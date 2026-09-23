#ifndef TOOL_SQUIRREL_GFX_RENDERER_HPP_INCLUDED
#   define TOOL_SQUIRREL_GFX_RENDERER_HPP_INCLUDED

#   include <squirrel/gfx/data_sources.hpp>
#   include <squirrel/gfx/renderer_controls.hpp>
#   include <squirrel/gfx/renderer_nav_graph.hpp>
#   include <squirrel/gfx/renderer_path_tree.hpp>
#   include <squirrel/gfx/renderer_data_tables.hpp>
#   include <squirrel/gfx/renderer_call_graph.hpp>
#   include <imgui.h>

namespace gfx {


struct  Renderer
{
    Renderer(DataSources const&  data_sources);

    void next_frame();
    void on_data_changed() { m_data_changed = true; }

private:

    bool m_data_changed;
    RendererControls  m_controls_renderer;
    RendererNavGraph  m_nav_graph_renderer;
    RendererPathTree  m_path_tree_renderer;
    RendererDataTables  m_data_tables_renderer;
    RendererCallGraph  m_call_graph_renderer;
};


}

#endif
