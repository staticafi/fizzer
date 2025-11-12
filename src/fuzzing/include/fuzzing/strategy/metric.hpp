#ifndef FUZZING_STRATEGY_METRIC_HPP_INCLUDED
#   define FUZZING_STRATEGY_METRIC_HPP_INCLUDED

#   include <utility/basic_numeric_types.hpp>
#   include <string>
#   include <vector>
#   include <unordered_map>
#   include <memory>

namespace  fuzzing {


enum struct  METRIC_TYPE : std::uint32_t
{
    BEST_VALUE  = 0U,
    INPUT_SIZE  = 1U,
    HIT_COUNT   = 2U,
    NUM_METRIC_TYPES
};


std::string  to_string(METRIC_TYPE const  type);


struct  branching_node;


struct  metric
{
    virtual ~metric() {}
    virtual float_64_bit  value(branching_node const*  node) = 0;
};


struct  best_value_metric : public metric
{
    float_64_bit  value(branching_node const* const  node) override;
};


struct input_size_metric : public metric
{
    float_64_bit  value(branching_node const* const  node) override;
};


struct hit_count_metric : public metric
{
    float_64_bit  value(branching_node const* const  node) override;
private:
    std::unordered_map<branching_node const*, float_64_bit>  cache{};
};


std::unique_ptr<metric>  create_metric(METRIC_TYPE const  type);


float_64_bit  choose_target_value(
        std::vector<branching_node*> const&  nodes,
        std::vector<float_64_bit> const&  values,
        METRIC_TYPE const  type
        );


}

#endif
