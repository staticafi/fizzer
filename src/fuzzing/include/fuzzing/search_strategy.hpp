#ifndef FUZZING_SEARCH_STRATEGY_HPP_INCLUDED
#   define FUZZING_SEARCH_STRATEGY_HPP_INCLUDED

#   include <fuzzing/branching_node.hpp>
#   include <unordered_set>
#   include <map>
#   include <deque>

namespace  fuzzing {


struct search_strategy
{
    enum METRIC_TYPE
    {
        MT_BEST_VALUE  = 0U,
        MT_INPUT_SIZE  = 1U,
        MT_HIT_COUNT   = 2U,
        NUM_METRIC_TYPES
    };

    enum FILTER_TYPE
    {
        FT_ALL         = 0U,
        FT_WARM        = 1U,
        FT_COLD        = 2U,
        FT_INPUT_USE   = 3U,
        FT_INPUT_WARM  = 4U,
        FT_INPUT_COLD  = 5U,
        NUM_FILTER_TYPES
    };

    using  location_props = std::deque<branching_node*>;
    using  locations_map = std::map<location_id, location_props>;

    search_strategy();
    ~search_strategy();

    branching_node*  choose_target(branching_node* const  root, bool  sensitive);
    bool  is_valid_target(branching_node*  node, bool  sensitive) const;
    void  on_new_uncovered_node(branching_node*  node);
    void  on_location_covered(location_id  id);
    void  on_erase(branching_node*  node);

    locations_map const&  get_locations_map() const { return locations; }

private:

    struct  navigation_cursor
    {
        navigation_cursor(locations_map*  locations_);
        void  next();
        void  on_insert_location(location_id  id);
        void  on_erase_location(location_id  id);
        bool  operator==(navigation_cursor const&  other) const { return  location == other.location && metric == other.metric && filter == other.filter; }
        bool  operator!=(navigation_cursor const&  other) const { return  !(*this == other); }
        bool  valid() const { return location != locations->end(); }
        locations_map::iterator  location;
        METRIC_TYPE  metric;
        FILTER_TYPE  filter;
    private:
        locations_map*  locations;
    };

    locations_map  locations;
    navigation_cursor  cursor;

    natural_16_bit  MAX_NODES;
};


}

#endif
