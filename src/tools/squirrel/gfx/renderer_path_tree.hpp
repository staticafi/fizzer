#ifndef TOOL_SQUIRREL_GFX_RENDERER_PATH_TREE_HPP_INCLUDED
#   define TOOL_SQUIRREL_GFX_RENDERER_PATH_TREE_HPP_INCLUDED

#   include <squirrel/gfx/renderer_base.hpp>
#   include <squirrel/gfx/mouse_tracking.hpp>
#   include <squirrel/gfx/math.hpp>
#   include <imgui.h>
#   include <vector>

namespace gfx {


struct  RendererPathTree : public RendererBase
{
    using Super = RendererBase;

    struct NodeLayout
    {
        // Center of the node.
        vec2 origin{ vec2::zero() };

        // The X-coordinate is the smallest of all coordinates of all
        // nodes in all subtrees of this node. The Y-coordinate is the
        // largest of all coordinates of allnodes in all subtrees of
        // this node.
        vec2 subtrees_width{ vec2::zero() };
    };

    RendererPathTree(DataSources const*  data_sources);

    void next_frame() override;

private:

    void draw_node(ImDrawList& dl, std::uint32_t node_index, NodeLayout const& node_layout) const;
    void draw_edge(ImDrawList& dl) const;

    // Used for moving the viewport over the tree.
    MouseTracking m_mouse_tracking;

    // The origin of the model space of the tree in
    // the window (representing the world space).
    vec2 m_origin;

    // For each node in the tree we have the layout
    // for that node here. The index of a node in
    // the path tree is the index also to this vector.
    std::vector<NodeLayout> m_node_layouts;
};


}

#endif
