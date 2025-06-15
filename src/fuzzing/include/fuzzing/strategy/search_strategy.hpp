#ifndef FUZZING_SEARCH_STRATEGY_HPP_INCLUDED
#   define FUZZING_SEARCH_STRATEGY_HPP_INCLUDED

#   include <fuzzing/branching_node.hpp>
#   include <unordered_set>
#   include <map>
#   include <deque>

namespace  fuzzing {


struct  navigation_cursor;


struct search_strategy
{
    using  location_props = std::deque<branching_node*>;
    using  locations_map = std::map<location_id, location_props>;

    search_strategy();
    ~search_strategy();

    branching_node*  choose_target(branching_node* const  root, bool  sensitive);
    void  on_new_uncovered_node(branching_node*  node);
    void  on_location_covered(location_id  id);
    void  on_erase(branching_node*  node);

    locations_map const&  get_locations_map() const { return locations; }

private:

    locations_map  locations;
    navigation_cursor*  cursor;

    natural_16_bit  MAX_NODES;
};


bool  is_valid_target(branching_node*  node, bool  sensitive);


}

#endif
