#ifndef TOOL_SQUIRREL_GFX_RENDERER_HPP_INCLUDED
#   define TOOL_SQUIRREL_GFX_RENDERER_HPP_INCLUDED

#   include <squirrel/gfx/data_sources.hpp>
#   include <imgui.h>

namespace gfx {


struct  Renderer
{
    Renderer(DataSources const&  data_sources);

    void set_waiting_for_content(bool const state) { m_waiting_for_content = state; }
    bool is_waiting_for_content() const { return m_waiting_for_content; }

    ImVec4 const& clear_color() const { return m_clear_color; }

    void next_frame(ImGuiIO& gui_io);

private:

    bool m_waiting_for_content;

    DataSources m_data;

    ImVec4 m_clear_color;
};


}

#endif
