#ifndef TOOL_SQUIRREL_GFX_RENDERER_HPP_INCLUDED
#   define TOOL_SQUIRREL_GFX_RENDERER_HPP_INCLUDED

#   include <squirrel/gfx/data_sources.hpp>
#   include <squirrel/gfx/renderer_controls.hpp>
#   include <squirrel/gfx/renderer_nav_graph.hpp>
#   include <squirrel/gfx/renderer_path_tree.hpp>
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
    bool m_first_round;
    bool m_data_updated;
    DataSources m_data;
    RendererControls  m_controls_renderer;
    RendererNavGraph  m_nav_graph_renderer;
    RendererPathTree  m_path_tree_renderer;
};


}

#endif
