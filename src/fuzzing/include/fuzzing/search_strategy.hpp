#ifndef FUZZING_SEARCH_STRATEGY_HPP_INCLUDED
#   define FUZZING_SEARCH_STRATEGY_HPP_INCLUDED

#   include <fuzzing/branching_node.hpp>
#   include <unordered_set>

namespace  fuzzing {


struct search_strategy
{
    search_strategy();
    ~search_strategy();

    branching_node*  choose(branching_node* const  root);
    void  on_new_uncovered_node(branching_node*  node);
    void  on_location_covered(location_id const id);
    void  on_erase(branching_node*  node);

private:
    std::unordered_set<branching_node*>  uncovered;
};


}

#endif
