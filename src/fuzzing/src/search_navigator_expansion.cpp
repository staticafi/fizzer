#include <fuzzing/search_navigator_expansion.hpp>
#include <fuzzing/branching_node.hpp>
#include <utility/assumptions.hpp>
#include <utility/invariants.hpp>

namespace  fuzzing {


extern bool  is_valid_target(branching_node*  node, bool  sensitive);


navigator_expansion::navigator_expansion(std::vector<branching_node*> const&  nodes, bool const  sensitive)
    : best_node{ nullptr }
{
    trace_index_type  best_cost{ std::numeric_limits<trace_index_type>::max() };
    for (branching_node*  node : nodes)
    {
        trace_index_type  cost{ node->get_trace_index() };
        for (branching_node*  n = node; n != nullptr; n = n->get_predecessor(), ++cost)
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
