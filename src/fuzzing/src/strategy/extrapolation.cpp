#include <fuzzing/strategy/extrapolation.hpp>

namespace  fuzzing {


extrapolation_line::extrapolation_line()
    : c0{ 0.0 }
    , c1{ 0.0 }
{}


void  extrapolation_line::build(std::vector<vec2> const&  input)
{
    float_64_bit  A = 0.0, B = 0.0, C = 0.0, D = 0.0;
    for (std::size_t  i = 0ULL; i != input.size(); ++i) {
        vec2 const  p = input.at(i);
        A += p.x * p.x;
        B += p.x;
        C += p.x * p.y;
        D += p.y;
    }
    float_64_bit const  size{ (float_64_bit)input.size() };
    c1 = input.empty() || size * A - B * B == 0.0 ? 0.0 : (size * C - B * D) / (size * A - B * B);
    c0 = input.empty() ? 0.0 : (D - c1 * B) / size;
}


float_64_bit  extrapolation_line::apply(float_64_bit const  value) const
{
    return c0 + value * c1;
}


float_64_bit  compute_error(extrapolation_line const&  extrapolation, std::vector<vec2> const&  input)
{
    float_64_bit  sum{ 0.0 };
    for (vec2 const&  v : input)
    {
        float_64_bit const  delta{ extrapolation.apply(v.x) - v.y };
        sum += delta * delta;
    }
    return input.empty() ? sum : sum / input.size();
}


}
