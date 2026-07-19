#ifndef TOOL_SQUIRREL_GFX_SHAPE_HPP_INCLUDED
#   define TOOL_SQUIRREL_GFX_SHAPE_HPP_INCLUDED

#   include <squirrel/gfx/math.hpp>
#   include <vector>

namespace gfx {


void make_arrow_lines(std::vector<vec2>& lines, vec2 const& a, vec2 const& b);


void draw_arrow(ImDrawList& dl, vec2 const& a, vec2 const& b, ImColor color, float thickness = 1.0f);


}

#endif
