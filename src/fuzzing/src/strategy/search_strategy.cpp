#include <fuzzing/strategy/search_strategy.hpp>
#include <fuzzing/strategy/search_metric.hpp>
#include <fuzzing/strategy/search_filter.hpp>
#include <fuzzing/strategy/search_navigator_expansion.hpp>
#include <fuzzing/strategy/search_navigator_regression.hpp>
#include <fuzzing/progress_recorder.hpp>
#include <utility/assumptions.hpp>
#include <utility/invariants.hpp>
#include <unordered_map>
#include <array>
#include <vector>
#include <memory>
#include <algorithm>

namespace  fuzzing {


struct  navigation_cursor
{
    navigation_cursor(search_strategy::locations_map*  locations_);
    void  next();
    void  on_insert_location(location_id  id);
    void  on_erase_location(location_id  id);
    bool  operator==(navigation_cursor const&  other) const;
    bool  operator!=(navigation_cursor const&  other) const { return  !(*this == other); }
    bool  valid() const { return location != locations->end(); }
    search_strategy::locations_map::iterator  location;
    METRIC_TYPE  metric;
    FILTER_TYPE  filter;
private:
    search_strategy::locations_map*  locations;
};


navigation_cursor::navigation_cursor(search_strategy::locations_map* const  locations_)
    : location{ locations_->end() }
    , metric{ METRIC_TYPE::BEST_VALUE }
    , filter{ FILTER_TYPE::ALL }
    , locations{ locations_ }
{}


void  navigation_cursor::next()
{
    ASSUMPTION(location != locations->end());

    filter = (FILTER_TYPE)((std::uint32_t)filter + 1);
    if (filter == FILTER_TYPE::NUM_FILTER_TYPES)
    {
        filter = (FILTER_TYPE)0;
        metric = (METRIC_TYPE)((std::uint32_t)metric + 1);
        if (metric == METRIC_TYPE::NUM_METRIC_TYPES)
        {
            metric = (METRIC_TYPE)0;
            ++location;
            if (location == locations->end())
                location = locations->begin();
        }
    }
}


void  navigation_cursor::on_insert_location(location_id const  id)
{
    if (location == locations->end())
    {
        location = locations->begin();
        metric = METRIC_TYPE::BEST_VALUE;
        filter = FILTER_TYPE::ALL;
    }
}


void  navigation_cursor::on_erase_location(location_id const  id)
{
    if (location != locations->end() && location->first == id)
    {
        if (locations->size() == 1ULL)
            location = locations->end();
        else
        {
            ++location;
            if (location == locations->end())
                location = locations->begin();
        }
        metric = METRIC_TYPE::BEST_VALUE;
        filter = FILTER_TYPE::ALL;
    }
}


bool  navigation_cursor::operator==(navigation_cursor const&  other) const
{
    return  location == other.location && metric == other.metric && filter == other.filter;
}


struct  best_target_info
{
    enum NAVIGATOR_TYPE
    {
        NONE = 0,
        EXPANSION = 1,
        REGRESSION = 2,
    };

    best_target_info(branching_node* const  root, bool const  sensitive);

    bool  is_best_already() const;
    void  accept_target_from(navigation_cursor const&  cursor_);

    branching_node* const  root;
    bool const  sensitive;

    navigation_cursor  cursor;
    branching_node*  target;
    NAVIGATOR_TYPE  type;
};


best_target_info::best_target_info(branching_node* const  root_, bool const  sensitive_)
    : root{ root_ }
    , sensitive{ sensitive_ }

    , cursor{ nullptr }
    , target{ nullptr }
    , type{ NONE }
{}


bool  best_target_info::is_best_already() const
{
    return  type == REGRESSION;
}


void  best_target_info::accept_target_from(navigation_cursor const&  cursor_)
{
    if (type == REGRESSION)
        return;

    search_strategy::location_props&  props{ cursor_.location->second };
    auto metric_ptr{ create_metric(cursor_.metric) };
    auto filter_ptr{ create_filter(cursor_.filter) };

    std::vector<branching_node*>  nodes;
    filter_ptr->apply({ props.begin(), props.end() }, *metric_ptr, nodes);

    std::vector<float_64_bit>  values;
    for (branching_node*  node : nodes)
        values.push_back(metric_ptr->value(node));

    navigator_regression  regression{ nodes, values };
    if (regression.valid())
    {
        float_64_bit const  value{ choose_target_value(nodes, values, cursor_.metric) };
        branching_node* const  target_{ regression.run(root, value) };
        if (is_valid_target(target_, sensitive))
        {
            target = target_;
            cursor = cursor_;
            type = REGRESSION;
            return;
        }
    }

    if (type == EXPANSION)
        return;

    navigator_expansion  expansion{ nodes, sensitive };
    if (expansion.valid())
    {
        branching_node* const  target_{ expansion.run() };
        if (is_valid_target(target_, sensitive))
        {
            target = target_;
            cursor = cursor_;
            type = EXPANSION;
            return;
        }
    }
}


search_strategy::search_strategy()
    : locations{}
    , cursor{ new navigation_cursor(&locations) }
    , MAX_NODES{ 50U }
{}


search_strategy::~search_strategy()
{
    delete cursor;
}


branching_node*  search_strategy::choose_target(branching_node* const  root, bool const  sensitive)
{
    ASSUMPTION(root != nullptr && !root->is_closed() && cursor->valid());

    best_target_info  best_target{ root, sensitive };
    navigation_cursor const  start_cursor{ *cursor };
    do
    {
        best_target.accept_target_from(*cursor);
        if (best_target.is_best_already())
            break;
        cursor->next();
    }
    while (*cursor != start_cursor);

    if (best_target.target != nullptr)
    {
        INVARIANT(is_valid_target(best_target.target, sensitive));

        *cursor = best_target.cursor;

        recorder().on_strategy(
            std::to_string(cursor->location->first) + '_' +
            to_string(cursor->metric) + '_' +
            to_string(cursor->filter) + '_' +
            (best_target.type == best_target_info::REGRESSION ? 'R' : 'E') + '_' +
            std::to_string(sensitive)
        );
    }
    cursor->next();

    return best_target.target;
}


void  search_strategy::on_new_uncovered_node(branching_node* const  node)
{
    auto const  it_and_state = locations.insert({ node->get_location_id(), {} });
    auto&  nodes{ it_and_state.first->second };
    nodes.push_back(node);
    while (nodes.size() > MAX_NODES)
        nodes.pop_front();
    cursor->on_insert_location(node->get_location_id());
}


void  search_strategy::on_location_covered(location_id const id)
{
    cursor->on_erase_location(id);
    locations.erase(id);
}


void  search_strategy::on_erase(branching_node* const  node)
{
    auto const  loc_it = locations.find(node->get_location_id());
    if (loc_it != locations.end())
    {
        auto&  nodes{ loc_it->second };
        nodes.erase(std::remove(nodes.begin(), nodes.end(), node), nodes.end());
    }
}


bool  is_valid_target(branching_node* const  node, bool const  sensitive)
{
    if (node == nullptr || node->is_closed() || !node->has_unexplored_direction())
        return false;
    if (sensitive)
        return node->was_sensitivity_performed() && node->has_pending_analysis();
    else 
        return !node->was_sensitivity_performed();
}


}
