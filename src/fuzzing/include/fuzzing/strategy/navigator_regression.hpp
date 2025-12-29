#ifndef FUZZING_STRATEGY_NAVIGATOR_REGRESSION_HPP_INCLUDED
#   define FUZZING_STRATEGY_NAVIGATOR_REGRESSION_HPP_INCLUDED

#   include <fuzzing/strategy/value_and_node.hpp>
#   include <fuzzing/strategy/extrapolation.hpp>
#   include <utility/basic_numeric_types.hpp>
#   include <unordered_map>
#   include <unordered_set>
#   include <vector>

namespace  fuzzing {


struct  branching_node;


struct  navigator_regression
{
    struct  id_info
    {
        natural_32_bit  counts[2] = { 0U, 0U };
        float_64_bit  ratios[2][3] = { { 0.0, 0.0, 0.0 }, { 0.0, 0.0, 0.0 } };
    };

    struct  id_extra
    {
        extrapolation_line  counts[2] = { {}, {} };
        extrapolation_line  ratios[2][3] = { { {}, {}, {} }, { {}, {}, {} } };
    };

    navigator_regression(std::vector<value_and_node> const&  values_and_nodes);
    bool  valid() const { return !extrapolations.empty(); }
    branching_node*  run(branching_node*  root, float_64_bit  value);

private:
    static branching_node*  step_in_tree(branching_node*  node, bool  desired_direction);

    std::unordered_set<integer_32_bit>  sids;
    std::unordered_map<integer_32_bit, id_extra>  extrapolations;
};


}

#endif
