#ifndef FUZZING_STRATEGY_METRIC_HPP_INCLUDED
#   define FUZZING_STRATEGY_METRIC_HPP_INCLUDED

#   include <fuzzing/strategy/value_and_node.hpp>
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
    explicit  metric(METRIC_TYPE const  type_) : m_type{ type_ } {}
    virtual ~metric() {}
    virtual float_64_bit  value(branching_node const*  node) = 0;
    METRIC_TYPE  type() const { return m_type; }
private:
    METRIC_TYPE  m_type;
};


struct  best_value_metric : public metric
{
    explicit  best_value_metric(METRIC_TYPE const  type) : metric{ type } {}
    float_64_bit  value(branching_node const* const  node) override;
};


struct input_size_metric : public metric
{
    explicit  input_size_metric(METRIC_TYPE const  type) : metric{ type } {}
    float_64_bit  value(branching_node const* const  node) override;
};


struct hit_count_metric : public metric
{
    explicit  hit_count_metric(METRIC_TYPE const  type) : metric{ type } {}
    float_64_bit  value(branching_node const* const  node) override;
private:
    std::unordered_map<branching_node const*, float_64_bit>  cache{};
};


std::unique_ptr<metric>  create_metric(METRIC_TYPE const  type);


float_64_bit  choose_target_value(
        std::vector<value_and_node> const&  values_and_nodes,
        METRIC_TYPE const  type
        );


}

#endif
