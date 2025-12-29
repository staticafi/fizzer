#ifndef FUZZING_STRATEGY_SEARCH_STRATEGY_HPP_INCLUDED
#   define FUZZING_STRATEGY_SEARCH_STRATEGY_HPP_INCLUDED

#   include <fuzzing/strategy/metric.hpp>
#   include <fuzzing/strategy/filter.hpp>
#   include <fuzzing/strategy/value_and_node.hpp>
#   include <fuzzing/branching_node.hpp>
#   include <utility/random.hpp>
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

    std::vector<metric_and_filter>  metrics_and_filters;
    locations_map  locations;
    random_generator_for_natural_64_bit  random_generator;
    natural_16_bit  MAX_SIZE;
};


bool  is_valid_target(branching_node*  node, bool  sensitive);


}

#endif
