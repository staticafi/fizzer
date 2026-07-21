#ifndef TOOL_SQUIRREL_GFX_RENDERER_HPP_INCLUDED
#   define TOOL_SQUIRREL_GFX_RENDERER_HPP_INCLUDED

#   include <squirrel/gfx/data_sources.hpp>
#   include <squirrel/gfx/renderer_nav_graph.hpp>
#   include <imgui.h>

namespace gfx {


struct  Renderer
{
    Renderer(DataSources const&  data_sources);

    void set_waiting_for_content(bool state);
    bool is_waiting_for_content() const { return m_waiting_for_content; }

    void next_frame();

private:

    void next_frame(RendererBase& renderer);

    void render_controls();
    void render_path_tree();
    void render_solver();
    void render_call_graph();

    bool m_waiting_for_content;
    bool m_data_updated;
    DataSources m_data;
    RendererNavGraph  m_nav_graph_renderer;
};


}

#endif
