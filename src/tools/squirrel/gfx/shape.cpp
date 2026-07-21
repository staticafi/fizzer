#include <squirrel/gfx/shape.hpp>

namespace gfx {


void make_arrow_end_lines(std::vector<vec2>& lines, vec2 const& a, vec2 const& b)
{
    vec2 const x{ normalized(a - b) };
    vec2 const y{ orthogonal_ccw(x) };

    const float arrow_length = 10.0f;
    const float arrow_width = 5.0f;

    lines.push_back(b);
    lines.push_back(b + arrow_length * x + arrow_width * y );

    lines.push_back(b);
    lines.push_back(b + arrow_length * x - arrow_width * y );
}


void make_arrow_lines(std::vector<vec2>& lines, vec2 const& a, vec2 const& b)
{
    lines.push_back(a);
    lines.push_back(b);

    make_arrow_end_lines(lines, a, b);
}


void draw_arrow(ImDrawList& dl, vec2 const& a, vec2 const& b, ImColor color, float thickness)
{
    std::vector<vec2> lines;
    make_arrow_lines(lines, a, b);
    for (std::size_t i = 0ULL; i < lines.size(); i += 2ULL)
        dl.AddLine(lines.at(i), lines.at(i+1ULL), color, thickness);
}


void draw_arrow_curved(ImDrawList& dl, vec2 const& a, vec2 const& mid, vec2 const& b, ImColor color, float thickness)
{
    dl.AddBezierQuadratic(a, mid, b, color, thickness);
    std::vector<vec2> lines;
    make_arrow_end_lines(lines, mid, b);
    for (std::size_t i = 0ULL; i < lines.size(); i += 2ULL)
        dl.AddLine(lines.at(i), lines.at(i+1ULL), color, thickness);
}


}
