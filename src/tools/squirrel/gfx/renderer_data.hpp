#ifndef TOOL_SQUIRREL_GFX_RENDERER_DATA_HPP_INCLUDED
#   define TOOL_SQUIRREL_GFX_RENDERER_DATA_HPP_INCLUDED

#   include <squirrel/gfx/renderer_base.hpp>
#   include <squirrel/gfx/data_sources.hpp>

namespace gfx {


struct  RendererData : public RendererBase
{
    using Super = RendererBase;

    RendererData(DataSources const*  data_sources) : Super(), m_data{ data_sources } {}

    DataSources const&  data() const { return *m_data; }
    sala::Program const&  program() const { return *data().program; }
    sala::CallGraph const&  call_graph() const { return *data().call_graph; }
    sala::NavigationGraph const&  nav_graph() const { return *data().nav_graph; }
    chickaree::PathTree const&  tree() const { return *data().tree; }
    chickaree::Solver const&  solver() const { return *data().solver; }

private:

    DataSources const* m_data;
};


}

#endif
