#include <fuzzing/strategy/navigator_expansion.hpp>
#include <fuzzing/branching_node.hpp>
#include <utility/assumptions.hpp>
#include <utility/invariants.hpp>

namespace  fuzzing {


extern bool  is_valid_target(branching_node*  node, bool  sensitive);


navigator_expansion::navigator_expansion(std::vector<value_and_node> const&  values_and_nodes, bool const  sensitive)
    : best_node{ nullptr }
{
    trace_index_type  best_cost{ std::numeric_limits<trace_index_type>::max() };
    for (auto const&  value_and_node : values_and_nodes)
    {
        trace_index_type  cost{ value_and_node.node->get_trace_index() };
        for (branching_node*  n = value_and_node.node; n != nullptr; n = n->get_predecessor(), ++cost)
            if (is_valid_target(n, sensitive) && cost < best_cost)
            {
                best_node = n;
                best_cost = cost;
            }
    }
}


branching_node*  navigator_expansion::run()
{
    return best_node;
}


}
