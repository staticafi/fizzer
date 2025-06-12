#ifndef FUZZING_SEARCH_NAVIGATOR_REGRESSION_HPP_INCLUDED
#   define FUZZING_SEARCH_NAVIGATOR_REGRESSION_HPP_INCLUDED

#include <utility/basic_numeric_types.hpp>
#include <unordered_map>
#include <unordered_set>
#include <vector>

namespace  fuzzing {


struct  branching_node;


struct  navigator_regression
{
    struct  id_info
    {
        natural_32_bit  counts[2] = { 0U, 0U };
        float_64_bit  ratios[2][3] = { { 0.0, 0.0, 0.0 }, { 0.0, 0.0, 0.0 } };
    };

    struct vec2 { float_64_bit  x, y; };

    struct extrapolation
    {
        extrapolation() : c0{ 0.0 }, c1{ 0.0 } {}
        void  build(std::vector<vec2> const&  input);
        static float_64_bit  apply(float_64_bit const  c0, float_64_bit const  c1, float_64_bit const  value) { return c0 + value * c1; }
        float_64_bit  apply(float_64_bit const  value) const { return apply(c0, c1, value); }
    private:
        float_64_bit  c0;
        float_64_bit  c1;
    };

    struct  id_extra
    {
        extrapolation  counts[2] = { {}, {} };
        extrapolation  ratios[2][3] = { { {}, {}, {} }, { {}, {}, {} } };
    };

    navigator_regression(std::vector<branching_node*> const&  nodes, std::vector<float_64_bit> const&  values);
    bool  valid() const { return !extrapolations.empty(); }
    branching_node*  run(branching_node*  root, float_64_bit  value);
    bool  are_all_values_same() const { return all_values_are_same; }

private:
    static branching_node*  step_in_tree(branching_node*  node, bool  desired_direction);

    std::unordered_set<integer_32_bit>  sids;
    std::unordered_map<integer_32_bit, id_extra>  extrapolations;
    bool  all_values_are_same;
};


}

#endif
