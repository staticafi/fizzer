#ifndef TOOL_SQUIRREL_GFX_RENDERER_BASE_HPP_INCLUDED
#   define TOOL_SQUIRREL_GFX_RENDERER_BASE_HPP_INCLUDED

#   include <squirrel/gfx/data_sources.hpp>
#   include <imgui.h>

namespace gfx {


struct  RendererBase
{
    RendererBase(DataSources const*  data_sources) : m_data{ data_sources } {}
    virtual ~RendererBase() {}

    DataSources const&  data() const { return *m_data; }
    sala::Program const&  program() const { return *data().program; }
    sala::CallGraph const&  call_graph() const { return *data().call_graph; }
    sala::NavigationGraph const&  nav_graph() const { return *data().nav_graph; }
    chickaree::PathTree const&  tree() const { return *data().tree; }
    chickaree::Solver const&  solver() const { return *data().solver; }

    virtual void next_frame() = 0;

private:

    DataSources const* m_data;
};


}

#endif
