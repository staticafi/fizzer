#ifndef TOOL_SQUIRREL_GFX_RENDERER_MOUSE_TRACKING_HPP_INCLUDED
#   define TOOL_SQUIRREL_GFX_RENDERER_MOUSE_TRACKING_HPP_INCLUDED

#   include <squirrel/gfx/math.hpp>

namespace gfx {


struct MouseTracking
{
    bool is_valid{ false };
    bool is_right_button_down{ false };
    vec2 last_pos{ vec2::zero() };
    vec2 delta{ vec2::zero() };
};


void update_mouse_tracking_data(MouseTracking& mouse_tracking);


}

#endif
