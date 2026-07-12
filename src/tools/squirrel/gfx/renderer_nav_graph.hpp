#ifndef TOOL_SQUIRREL_GFX_RENDERER_NAV_GRAPH_HPP_INCLUDED
#   define TOOL_SQUIRREL_GFX_RENDERER_NAV_GRAPH_HPP_INCLUDED

#   include <squirrel/gfx/renderer_base.hpp>
#   include <imgui.h>

namespace gfx {


struct  RendererNavGraph : public RendererBase
{
    RendererNavGraph(DataSources const*  data_sources);

    void next_frame() override;

private:

    float split_x;
    std::uint32_t  selected_function;
};


}

#endif
