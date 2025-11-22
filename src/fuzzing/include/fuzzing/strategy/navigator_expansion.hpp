#ifndef FUZZING_STRATEGY_NAVIGATOR_EXPANSION_HPP_INCLUDED
#   define FUZZING_STRATEGY_NAVIGATOR_EXPANSION_HPP_INCLUDED

#   include <fuzzing/strategy/value_and_node.hpp>
#   include <vector>

namespace  fuzzing {


struct  branching_node;


struct  navigator_expansion
{
    navigator_expansion(std::vector<value_and_node> const&  values_and_nodes, bool  sensitive);
    bool  valid() const { return true; }
    branching_node*  run();
private:
    branching_node*  best_node;
};


}

#endif
