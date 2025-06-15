#include <fuzzing/strategy/search_metric.hpp>
#include <fuzzing/branching_node.hpp>
#include <utility/invariants.hpp>
#include <algorithm>

namespace  fuzzing {


std::string  to_string(METRIC_TYPE const  type)
{
    switch (type)
    {
        case METRIC_TYPE::BEST_VALUE: return "BestValue";
        case METRIC_TYPE::INPUT_SIZE: return "InputSize";
        case METRIC_TYPE::HIT_COUNT: return "HitCount";
        default: UNREACHABLE(); return "";
    }
}


float_64_bit  best_value_metric::value(branching_node const* const  node)
{
    return node->get_best_value();
}


float_64_bit  input_size_metric::value(branching_node const* const  node)
{
    return (float_64_bit)node->get_num_stdin_bytes();
}


float_64_bit  hit_count_metric::value(branching_node const* const  node)
{
    auto it = cache.find(node);
    if (it == cache.end())
    {
        natural_32_bit  count = 0;
        for (branching_node const*  n = node->get_predecessor(); n != nullptr; n = n->get_predecessor())
            if (n->get_location_id() == node->get_location_id())
                ++count;
        it = cache.insert({ node, (float_64_bit)count }).first;
    }
    return it->second;
}


std::unique_ptr<metric>  create_metric(METRIC_TYPE const  type)
{
    switch (type)
    {
        case METRIC_TYPE::BEST_VALUE: return std::unique_ptr<metric>{ new best_value_metric };
        case METRIC_TYPE::INPUT_SIZE: return std::unique_ptr<metric>{ new input_size_metric };
        case METRIC_TYPE::HIT_COUNT: return std::unique_ptr<metric>{ new hit_count_metric };
        default: UNREACHABLE(); return nullptr;
    }
}


float_64_bit  choose_target_value(
        std::vector<branching_node*> const&  nodes,
        std::vector<float_64_bit> const&  values,
        METRIC_TYPE const  type
        )
{
    if (nodes.empty())
        return 0.0;

    if (type == METRIC_TYPE::BEST_VALUE)
    {
        float_64_bit constexpr  non_zero{ 1000.0 };
        branching_node* const  node{ nodes.front() };
        bool const  dir{ node->is_direction_unexplored(true) };
        switch (node->get_atomic_predicate())
        {
            case atomic_predicate::EQUAL: return dir ? 0.0 : non_zero;
            case atomic_predicate::UNEQUAL: return dir ? non_zero : 0.0;
            case atomic_predicate::LESS: return dir ? -non_zero : non_zero;
            case atomic_predicate::LESS_EQUAL: return dir ? -non_zero : non_zero;
            case atomic_predicate::GREATER: return dir ? non_zero : -non_zero;
            case atomic_predicate::GREATER_EQUAL: return dir ? non_zero : -non_zero;
            default: UNREACHABLE();
        }
    }
    return 2.0 * *std::max_element(values.begin(), values.end());
}


}
