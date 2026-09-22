#include <squirrel/gfx/renderer_base.hpp>
#include <utility/visualizer_breakpoint.hpp>
#include <imgui.h>

namespace gfx {


RendererBase::RendererBase(DataSources const&  data_sources)
    : m_data{ data_sources }
    , m_frame_count{ 0ULL }
{}


vec2 RendererBase::window_origin() const { return ImGui::GetCursorScreenPos(); }
vec2 RendererBase::window_size() const { return ImGui::GetContentRegionAvail(); }
Rect RendererBase::window_rect() const { vec2 o = window_origin(); return Rect{ .left_top = o, .right_bottom = o + window_size() }; }


void RendererBase::request_resume_execution() { visualizer::request_resume_execution(); }


void RendererBase::update()
{
    if (m_frame_count == 0ULL)
        initialize();
    ++m_frame_count;
    next_frame();
}


}
