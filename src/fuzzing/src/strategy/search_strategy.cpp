#include <fuzzing/strategy/search_strategy.hpp>
#include <fuzzing/strategy/navigator_automaton.hpp>
#include <fuzzing/strategy/navigator_expansion.hpp>
#include <fuzzing/strategy/navigator_regression.hpp>
#include <fuzzing/progress_recorder.hpp>
#include <utility/assumptions.hpp>
#include <utility/invariants.hpp>
#include <utility/timeprof.hpp>
#include <unordered_set>
#include <algorithm>

namespace  fuzzing {


search_strategy::search_strategy()
    : metrics_and_filters{}
    , locations{}
    , random_generator{ 0U }
    , MAX_SIZE{ 50U }
{
    // metrics_and_filters.emplace_back(metric_and_filter{ METRIC_TYPE::BEST_VALUE, FILTER_TYPE::ALL });
    metrics_and_filters.emplace_back(metric_and_filter{ METRIC_TYPE::BEST_VALUE, FILTER_TYPE::WARM });
    metrics_and_filters.emplace_back(metric_and_filter{ METRIC_TYPE::BEST_VALUE, FILTER_TYPE::COLD });
    // metrics_and_filters.emplace_back(metric_and_filter{ METRIC_TYPE::BEST_VALUE, FILTER_TYPE::INPUT_USE });
    // metrics_and_filters.emplace_back(metric_and_filter{ METRIC_TYPE::BEST_VALUE, FILTER_TYPE::INPUT_WARM });
    // metrics_and_filters.emplace_back(metric_and_filter{ METRIC_TYPE::BEST_VALUE, FILTER_TYPE::INPUT_COLD });
    // metrics_and_filters.emplace_back(metric_and_filter{ METRIC_TYPE::INPUT_SIZE, FILTER_TYPE::ALL });
    // metrics_and_filters.emplace_back(metric_and_filter{ METRIC_TYPE::INPUT_SIZE, FILTER_TYPE::INPUT_USE });
    metrics_and_filters.emplace_back(metric_and_filter{ METRIC_TYPE::HIT_COUNT, FILTER_TYPE::ALL });
    // metrics_and_filters.emplace_back(metric_and_filter{ METRIC_TYPE::HIT_COUNT, FILTER_TYPE::INPUT_USE });
}


branching_node*  search_strategy::choose_target(branching_node* const  root, bool const  sensitive)
{
    TMPROF_BLOCK();

    if (root == nullptr || root->is_closed())
        return nullptr;

    struct  selection_info
    {
        bool  operator<(selection_info const&  other) const { return priority < other.priority; }
        float_64_bit  priority;
        location_id  location;
        natural_32_bit  index;
    };
    std::vector<selection_info>  selection_infos;
    {
        for (auto const&  loc_and_data : locations)
            for (natural_32_bit  i{ 0U }; i < (natural_32_bit)loc_and_data.second.size(); ++i)
            {
                std::unordered_set<float_64_bit>  values;
                for (auto const&  value_and_node : loc_and_data.second.at(i))
                    values.insert(value_and_node.value);
                selection_infos.push_back({
                    values.empty() ? 0.0 : (float_64_bit)values.size() / (float_64_bit)loc_and_data.second.at(i).size(),
                    loc_and_data.first,
                    i
                });
                selection_infos.back().priority *= selection_infos.back().priority;
            }
        std::sort(selection_infos.begin(), selection_infos.end());
        std::reverse(selection_infos.begin(), selection_infos.end());
        while (!selection_infos.empty() && selection_infos.back().priority < 1.0 / (2.0 * (float_64_bit)MAX_SIZE * (float_64_bit)MAX_SIZE))
            selection_infos.pop_back();
        if (selection_infos.empty())
            return nullptr;
        for (auto&  info : selection_infos)
            info.priority = std::round(info.priority / selection_infos.back().priority);
        float_64_bit  sum{ 0.0 };
        for (std::size_t  i{ 0ULL }; i < selection_infos.size(); ++i)
        {
            float_64_bit const  temp{ selection_infos.at(i).priority };
            selection_infos.at(i).priority = sum;
            sum += temp;
        }
    }

    for (std::size_t  i{ 0ULL }; i != selection_infos.size(); ++i)
    {
        selection_info const*  winner_ptr;
        {
            natural_64_bit const  choice{ get_random_natural_64_bit_in_range(0ULL, (natural_64_bit)selection_infos.back().priority, random_generator) };
            auto  it{ std::lower_bound(selection_infos.begin(), selection_infos.end(), selection_info{ (float_64_bit)choice, 0U, 0U }) };
            if (it != selection_infos.begin() && it != selection_infos.end() && (float_64_bit)choice < it->priority)
                --it;
            winner_ptr = it == selection_infos.end() ? &selection_infos.back() : &*it;
        }

        auto const&  values_and_nodes{ locations.at(winner_ptr->location).at(winner_ptr->index) };
        auto const  metric_type{ metrics_and_filters.at(winner_ptr->index).metric_ptr->type() };

        navigator_automaton  automaton{ values_and_nodes };
        if (automaton.valid())
        {
            float_64_bit const  value{ choose_target_value(values_and_nodes, metric_type) };
            branching_node* const  target{ automaton.run(root, value, sensitive) };
            if (is_valid_target(target, sensitive))
            {
                recorder().on_strategy_automaton(
                    to_string(metric_type),
                    to_string(metrics_and_filters.at(winner_ptr->index).filter_ptr->type()),
                    values_and_nodes,
                    winner_ptr->location,
                    target,
                    sensitive,
                    value,
                    automaton
                );
                return target;
            }
        }
    }

    return nullptr;
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
}


void  search_strategy::on_location_covered(location_id const  id)
{
    TMPROF_BLOCK();

    locations.erase(id);
}


void  search_strategy::on_erase(branching_node* const  node)
{
    TMPROF_BLOCK();

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
