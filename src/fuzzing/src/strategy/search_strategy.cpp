#include <fuzzing/strategy/search_strategy.hpp>
#include <fuzzing/strategy/navigator_automaton.hpp>
#include <fuzzing/strategy/navigator_expansion.hpp>
#include <fuzzing/strategy/navigator_regression.hpp>
#include <fuzzing/progress_recorder.hpp>
#include <utility/assumptions.hpp>
#include <utility/invariants.hpp>
#include <utility/timeprof.hpp>
#include <algorithm>

namespace  fuzzing {


search_strategy::search_strategy()
    : metrics_and_filters{}
    , locations{}
    , cursors{ { locations.end(), 0U }, { locations.end(), 0U } }
    , MAX_SIZE{ 50U }
{
    metrics_and_filters.emplace_back(metric_and_filter{ METRIC_TYPE::BEST_VALUE, FILTER_TYPE::ALL });
    metrics_and_filters.emplace_back(metric_and_filter{ METRIC_TYPE::BEST_VALUE, FILTER_TYPE::WARM });
    metrics_and_filters.emplace_back(metric_and_filter{ METRIC_TYPE::BEST_VALUE, FILTER_TYPE::COLD });
    metrics_and_filters.emplace_back(metric_and_filter{ METRIC_TYPE::BEST_VALUE, FILTER_TYPE::INPUT_USE });
    metrics_and_filters.emplace_back(metric_and_filter{ METRIC_TYPE::BEST_VALUE, FILTER_TYPE::INPUT_WARM });
    metrics_and_filters.emplace_back(metric_and_filter{ METRIC_TYPE::BEST_VALUE, FILTER_TYPE::INPUT_COLD });
    metrics_and_filters.emplace_back(metric_and_filter{ METRIC_TYPE::INPUT_SIZE, FILTER_TYPE::ALL });
    metrics_and_filters.emplace_back(metric_and_filter{ METRIC_TYPE::INPUT_SIZE, FILTER_TYPE::INPUT_USE });
    metrics_and_filters.emplace_back(metric_and_filter{ METRIC_TYPE::HIT_COUNT, FILTER_TYPE::ALL });
    metrics_and_filters.emplace_back(metric_and_filter{ METRIC_TYPE::HIT_COUNT, FILTER_TYPE::INPUT_USE });
}


branching_node*  search_strategy::choose_target(branching_node* const  root, bool const  sensitive)
{
    ASSUMPTION(root != nullptr && !root->is_closed() && cursors[sensitive ? 1 : 0].location != locations.end());

    struct  best_target_info
    {
        navigation_cursor  cursor;
        branching_node*  target;
        NAVIGATOR_TYPE  type;
        float_64_bit  value;
    };

    best_target_info  best_target{ { locations.end(), 0U }, nullptr, NAVIGATOR_TYPE::NONE, 0.0 };
    navigation_cursor&  cursor{ cursors[sensitive ? 1 : 0] };
    navigation_cursor const  start_cursor{ cursor };
    do
    {
        auto const&  values_and_nodes{ cursor.location->second.at(cursor.index) };
        auto const  metric_type{ metrics_and_filters.at(cursor.index).metric_ptr->type() };

        navigator_automaton  automaton{ values_and_nodes };
        if (automaton.valid())
        {
            float_64_bit const  value{ choose_target_value(values_and_nodes, metric_type) };
            branching_node* const  target{ automaton.run(root, value) };
            if (is_valid_target(target, sensitive))
            {
                best_target.target = target;
                best_target.cursor = cursor;
                best_target.type = NAVIGATOR_TYPE::AUTOMATON;
                best_target.value = value;
                break;
            }
        }

        INVARIANT(best_target.type != NAVIGATOR_TYPE::AUTOMATON);

        navigator_regression  regression{ values_and_nodes };
        if (regression.valid())
        {
            float_64_bit const  value{ choose_target_value(values_and_nodes, metric_type) };
            branching_node* const  target{ regression.run(root, value) };
            if (is_valid_target(target, sensitive))
            {
                best_target.target = target;
                best_target.cursor = cursor;
                best_target.type = NAVIGATOR_TYPE::REGRESSION;
                best_target.value = value;
                break;
            }
        }

        INVARIANT(best_target.type != NAVIGATOR_TYPE::REGRESSION);

        navigator_expansion  expansion{ values_and_nodes, sensitive };
        if (expansion.valid())
        {
            branching_node* const  target{ expansion.run() };
            if (is_valid_target(target, sensitive))
            {
                best_target.target = target;
                best_target.cursor = cursor;
                best_target.type = NAVIGATOR_TYPE::EXPANSION;
                best_target.value = 0.0;
            }
        }

        next(cursor);
    }
    while (cursor.location != start_cursor.location || cursor.index != start_cursor.index);

    if (best_target.target != nullptr)
    {
        INVARIANT(is_valid_target(best_target.target, sensitive));

        cursor = best_target.cursor;

        switch (best_target.type)
        {
            case NAVIGATOR_TYPE::NONE:
            case NAVIGATOR_TYPE::EXPANSION:
            case NAVIGATOR_TYPE::REGRESSION:
                // TODO!
                break;
            case NAVIGATOR_TYPE::AUTOMATON:
                recorder().on_strategy_automaton(
                    to_string(metrics_and_filters.at(cursor.index).metric_ptr->type()),
                    to_string(metrics_and_filters.at(cursor.index).filter_ptr->type()),
                    cursor.location->first,
                    best_target.target,
                    sensitive,
                    best_target.value
                );
                break;
            default: UNREACHABLE(); break;
        }
    }
    next(cursor);

    return best_target.target;
}


void  search_strategy::next(navigation_cursor&  cursor)
{
    ASSUMPTION(cursor.location != locations.end());

    ++cursor.index;
    if (cursor.index == metrics_and_filters.size())
    {
        cursor.index = 0U;
        ++cursor.location;
        if (cursor.location == locations.end())
            cursor.location = locations.begin();
    }
}


void  search_strategy::on_new_uncovered_nodes(std::vector<branching_node*> const&  newcomers)
{
    TMPROF_BLOCK();

    for (branching_node* const  node : newcomers)
    {
        auto const  it_and_state = locations.insert({ node->get_location_id(), {} });
        location_props&  props{ it_and_state.first->second };
        props.resize(metrics_and_filters.size());
        for (natural_32_bit  i = 0U; i != metrics_and_filters.size(); ++i)
        {
            auto&  values_and_nodes{ props.at(i) };
            auto&  metric_and_filter{ metrics_and_filters.at(i) };
            values_and_nodes.push_back({ metric_and_filter.metric_ptr->value(node), node });
            std::vector<value_and_node>  temp;
            values_and_nodes.swap(temp);
            metric_and_filter.filter_ptr->apply({ temp.begin(), temp.end() }, values_and_nodes);
            float_64_bit const  value{ choose_target_value(temp, metric_and_filter.metric_ptr->type()) };
            std::sort(values_and_nodes.begin(), values_and_nodes.end(),
                [value](value_and_node const&  left, value_and_node const&  right) {
                    return std::fabs(left.value - value) < std::fabs(right.value - value);
                });
            while (values_and_nodes.size() > MAX_SIZE)
                values_and_nodes.pop_back();
        }
    }
    for (natural_32_bit  i = 0U; i != 2U; ++i)
        if (cursors[i].location == locations.end())
        {
            cursors[i].location = locations.begin();
            cursors[i].index = 0U;
        }
}


void  search_strategy::on_location_covered(location_id const  id)
{
    for (natural_32_bit  i = 0U; i != 2U; ++i)
        if (cursors[i].location != locations.end() && cursors[i].location->first == id)
        {
            if (locations.size() == 1ULL)
                cursors[i].location = locations.end();
            else
            {
                ++cursors[i].location;
                if (cursors[i].location == locations.end())
                    cursors[i].location = locations.begin();
            }
            cursors[i].index = 0U;
        }
    locations.erase(id);
}


void  search_strategy::on_erase(branching_node* const  node)
{
    auto const  loc_it = locations.find(node->get_location_id());
    if (loc_it != locations.end())
    {
        for (auto&  values_and_nodes : loc_it->second)
            values_and_nodes.erase(
                std::remove_if(
                    values_and_nodes.begin(), values_and_nodes.end(),
                    [node](value_and_node const&  item) { return item.node == node; }),
                values_and_nodes.end()
                );
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
