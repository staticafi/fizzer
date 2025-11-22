#ifndef FUZZING_STRATEGY_EXTRAPOLATION_HPP_INCLUDED
#   define FUZZING_STRATEGY_EXTRAPOLATION_HPP_INCLUDED

#   include <utility/basic_numeric_types.hpp>
#   include <vector>

namespace  fuzzing {


struct vec2 { float_64_bit  x, y; };


struct extrapolation_line
{
    extrapolation_line();
    void  build(std::vector<vec2> const&  input);
    float_64_bit  apply(float_64_bit const  value) const;
    float_64_bit  get_c0() const { return c0; }
    float_64_bit  get_c1() const { return c1; }
    bool  is_constant() const { return c1 == 0.0; }
private:
    float_64_bit  c0;
    float_64_bit  c1;
};


float_64_bit  compute_error(extrapolation_line const&  extrapolation, std::vector<vec2> const&  input);


}

#endif
