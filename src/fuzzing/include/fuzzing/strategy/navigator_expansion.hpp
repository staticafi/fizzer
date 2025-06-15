#ifndef FUZZING_STRATEGY_NAVIGATOR_EXPANSION_HPP_INCLUDED
#   define FUZZING_STRATEGY_NAVIGATOR_EXPANSION_HPP_INCLUDED

#include <vector>

namespace  fuzzing {


struct  branching_node;


struct  navigator_expansion
{
    navigator_expansion(std::vector<branching_node*> const&  nodes, bool  sensitive);
    bool  valid() const { return true; }
    branching_node*  run();
private:
    branching_node*  best_node;
};


}

#endif
