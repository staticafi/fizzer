#include <squirrel/gfx/mouse_tracking.hpp>
#include <imgui.h>

namespace gfx {


void update_mouse_tracking_data(MouseTracking& mouse_tracking)
{
    if (!ImGui::IsWindowHovered())
    {
        mouse_tracking = {};
        return;
    }

    ImGuiIO& io = ImGui::GetIO();
    vec2 const pos = io.MousePos;
    bool const down = io.MouseDown[1];

    if (!mouse_tracking.is_valid)
    {
        mouse_tracking.is_valid = true;
        mouse_tracking.last_pos = pos;
        mouse_tracking.is_right_button_down = down;
        mouse_tracking.delta = vec2::zero();
        return;
    }

    if (mouse_tracking.is_right_button_down)
        mouse_tracking.delta = pos - mouse_tracking.last_pos;
    else
        mouse_tracking.delta = vec2::zero();

    mouse_tracking.last_pos = pos;
    mouse_tracking.is_right_button_down = down;
}


}
