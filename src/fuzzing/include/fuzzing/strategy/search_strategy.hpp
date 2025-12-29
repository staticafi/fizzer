#ifndef FUZZING_STRATEGY_SEARCH_STRATEGY_HPP_INCLUDED
#   define FUZZING_STRATEGY_SEARCH_STRATEGY_HPP_INCLUDED

#   include <fuzzing/strategy/metric.hpp>
#   include <fuzzing/strategy/filter.hpp>
#   include <fuzzing/strategy/value_and_node.hpp>
#   include <fuzzing/branching_node.hpp>
#   include <map>
#   include <vector>
#   include <memory>

namespace  fuzzing {


struct search_strategy
{
    search_strategy();
    branching_node*  choose_target(branching_node* const  root, bool  sensitive);
    void  on_new_uncovered_nodes(std::vector<branching_node*> const&  newcomers);
    void  on_location_covered(location_id  id);
    void  on_erase(branching_node*  node);

private:

    struct  metric_and_filter
    {
        metric_and_filter(METRIC_TYPE const  metric_type, FILTER_TYPE const  filter_type)
            : metric_ptr{ create_metric(metric_type) }
            , filter_ptr{ create_filter(filter_type) }
        {}
        std::unique_ptr<metric>  metric_ptr;
        std::unique_ptr<filter>  filter_ptr;
    };

    using  location_props = std::vector<std::vector<value_and_node> >;
    using  locations_map = std::map<location_id, location_props>;

    struct  navigation_cursor
    {
        locations_map::iterator  location;
        natural_32_bit  index;
    };

    enum struct  NAVIGATOR_TYPE : natural_8_bit
    {
        NONE = 0,
        EXPANSION = 1,
        REGRESSION = 2,
        AUTOMATON = 3,
    };

    struct  best_target_info
    {
        navigation_cursor  cursor;
        branching_node*  target;
        NAVIGATOR_TYPE  type;
    };

    void  next(navigation_cursor&  cursor);

    std::vector<metric_and_filter>  metrics_and_filters;
    locations_map  locations;
    navigation_cursor  cursors[2];
    natural_16_bit  MAX_SIZE;
};


bool  is_valid_target(branching_node*  node, bool  sensitive);


}

#endif
