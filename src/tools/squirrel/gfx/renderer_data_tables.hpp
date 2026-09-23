#ifndef TOOL_SQUIRREL_GFX_RENDERER_DATA_TABLES_HPP_INCLUDED
#   define TOOL_SQUIRREL_GFX_RENDERER_DATA_TABLES_HPP_INCLUDED

#   include <squirrel/gfx/renderer_base.hpp>
#   include <squirrel/gfx/math.hpp>

namespace gfx {


struct  RendererDataTables : public RendererBase
{
    using Super = RendererBase;


    RendererDataTables(DataSources const&  data_sources);

    void next_frame() override;

private:

    float split_x;
    std::uint32_t  selected_graph_node;
};


}

#endif
