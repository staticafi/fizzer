#ifndef TOOL_SQUIRREL_GFX_RENDERER_CALL_GRAPH_HPP_INCLUDED
#   define TOOL_SQUIRREL_GFX_RENDERER_CALL_GRAPH_HPP_INCLUDED

#   include <squirrel/gfx/renderer_data.hpp>
#   include <squirrel/gfx/mouse_tracking.hpp>
#   include <squirrel/gfx/math.hpp>
#   include <utility/std_pair_hash.hpp>
#   include <imgui.h>
#   include <unordered_map>
#   include <unordered_set>
#   include <string>

namespace gfx {


struct  RendererCallGraph : public RendererData
{
    using Super = RendererData;

    struct NodeLayout
    {
        vec2 origin{ vec2::zero() };    // Center of the node.
        vec2 half_size{ vec2::zero() }; // Half width and half height.
        std::string text{};
    };

    using EdgeLayout = std::pair<std::uint32_t, std::uint32_t>;

    using NodeIndices2Layouts = std::unordered_map<std::uint32_t, NodeLayout>;
    using EdgeLayouts = std::unordered_set<EdgeLayout>;

    RendererCallGraph(DataSources const*  data_sources);

    void next_frame() override;

private:

    MouseTracking m_mouse_tracking;

    vec2 m_origin;
    NodeIndices2Layouts m_node_layouts;
    EdgeLayouts m_edge_layouts;
};


}

#endif
