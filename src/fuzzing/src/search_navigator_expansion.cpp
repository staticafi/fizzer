#include <fuzzing/search_navigator_expansion.hpp>
#include <fuzzing/branching_node.hpp>
#include <utility/assumptions.hpp>
#include <utility/invariants.hpp>

namespace  fuzzing {


navigator_expansion::navigator_expansion(std::vector<branching_node*> const&  nodes)
    : start_node{ nullptr }
{
}


branching_node*  navigator_expansion::run()
{
    return start_node;
}


}
