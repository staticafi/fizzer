#ifndef TOOL_SQUIRREL_GFX_RENDERER_BASE_HPP_INCLUDED
#   define TOOL_SQUIRREL_GFX_RENDERER_BASE_HPP_INCLUDED

#   include <squirrel/gfx/math.hpp>
#   include <imgui.h>
#   include <cstdint>

namespace gfx {


struct  RendererBase
{
    RendererBase() : m_frame_count{ 0ULL } {}
    virtual ~RendererBase() {}

    vec2 window_origin() const { return ImGui::GetCursorScreenPos(); } // Left top corner.
    vec2 window_size() const { return ImGui::GetContentRegionAvail(); } // Width and height.
    Rect window_rect() const { vec2 o = window_origin(); return Rect{ .left_top = o, .right_bottom = o + window_size() }; }

    std::uint64_t frame_count() const { return m_frame_count; }

    virtual bool is_waiting_for_content() { return false; }
    virtual void on_data_updated() {}
    virtual void next_frame() { ++m_frame_count; }

private:

    std::uint64_t m_frame_count;
};


}

#endif
