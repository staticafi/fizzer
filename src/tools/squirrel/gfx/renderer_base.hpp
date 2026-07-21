#ifndef TOOL_SQUIRREL_GFX_RENDERER_BASE_HPP_INCLUDED
#   define TOOL_SQUIRREL_GFX_RENDERER_BASE_HPP_INCLUDED

#   include <squirrel/gfx/data_sources.hpp>
#   include <squirrel/gfx/math.hpp>
#   include <imgui.h>

namespace gfx {


struct  RendererBase
{
    RendererBase(DataSources const*  data_sources) : m_data{ data_sources }, m_frame_count{ 0ULL } {}
    virtual ~RendererBase() {}

    DataSources const&  data() const { return *m_data; }
    sala::Program const&  program() const { return *data().program; }
    sala::CallGraph const&  call_graph() const { return *data().call_graph; }
    sala::NavigationGraph const&  nav_graph() const { return *data().nav_graph; }
    chickaree::PathTree const&  tree() const { return *data().tree; }
    chickaree::Solver const&  solver() const { return *data().solver; }

    vec2 window_origin() const { return ImGui::GetCursorScreenPos(); } // Left top corner.
    vec2 window_size() const { return ImGui::GetContentRegionAvail(); } // Width and height.
    Rect window_rect() const { vec2 o = window_origin(); return Rect{ .left_top = o, .right_bottom = o + window_size() }; }

    std::uint64_t frame_count() const { return m_frame_count; }

    virtual bool is_waiting_for_content() { return false; }
    virtual void on_data_updated() {}
    virtual void next_frame() { ++m_frame_count; }

private:

    DataSources const* m_data;
    std::uint64_t m_frame_count;
};


}

#endif
