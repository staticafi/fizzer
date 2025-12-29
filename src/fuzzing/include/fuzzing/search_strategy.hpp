#ifndef FUZZING_SEARCH_STRATEGY_HPP_INCLUDED
#   define FUZZING_SEARCH_STRATEGY_HPP_INCLUDED

#   include <fuzzing/branching_node.hpp>
#   include <unordered_set>
#   include <map>
#   include <deque>

namespace  fuzzing {


struct search_strategy
{
    search_strategy();
    ~search_strategy();

    branching_node*  choose(branching_node* const  root);
    void  on_new_uncovered_node(branching_node*  node);
    void  on_location_covered(location_id  id);
    void  on_erase(branching_node*  node);

private:
    enum METRIC_TYPE
    {
        MT_BEST_VALUE  = 0U,
        MT_INPUT_SIZE  = 1U,
        MT_HIT_COUNT   = 2U,
        NUM_METRIC_TYPES
    };

    enum FILTER_TYPE : natural_8_bit
    {
        FT_ALL         = 0U,
        FT_WARM        = 1U,
        FT_COLD        = 2U,
        FT_INPUT_USE   = 3U,
        FT_INPUT_WARM  = 4U,
        FT_INPUT_COLD  = 5U,
        NUM_FILTER_TYPES
    };

    struct  location_props
    {
        std::deque<branching_node*>  nodes{};
        METRIC_TYPE  metric_type{ MT_BEST_VALUE};
        FILTER_TYPE  filter_type{ FT_ALL };
    };

    std::map<location_id, location_props>  locations;
    decltype(locations)::iterator  location;
    std::unordered_set<branching_node*>  uncovered;

    natural_16_bit  MAX_NODES;
};


}

#endif
