#ifndef TOOL_SQUIRREL_GFX_SHAPE_HPP_INCLUDED
#   define TOOL_SQUIRREL_GFX_SHAPE_HPP_INCLUDED

#   include <squirrel/gfx/math.hpp>
#   include <vector>
#   include <utility>

namespace gfx {


void make_arrow_lines(std::vector<vec2>& lines, vec2 const& a, vec2 const& b);
void make_arrow_end_lines(std::vector<vec2>& lines, vec2 const& a, vec2 const& b);

inline std::pair<vec2, vec2> point_and_derivative_in_middle_of_curved_arrow(vec2 const& a, vec2 const& mid, vec2 const& b)
{ return { 0.25f * a + 0.5f * mid + 0.25f * b, b - a }; }

void draw_arrow(ImDrawList& dl, vec2 const& a, vec2 const& b, ImColor color, float thickness = 1.0f);
void draw_arrow_curved(ImDrawList& dl, vec2 const& a, vec2 const& mid, vec2 const& b, ImColor color, float thickness);


}

#endif
