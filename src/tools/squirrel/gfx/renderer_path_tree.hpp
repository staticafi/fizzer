#ifndef TOOL_SQUIRREL_GFX_RENDERER_PATH_TREE_HPP_INCLUDED
#   define TOOL_SQUIRREL_GFX_RENDERER_PATH_TREE_HPP_INCLUDED

#   include <squirrel/gfx/renderer_base.hpp>
#   include <squirrel/gfx/mouse_tracking.hpp>
#   include <squirrel/gfx/math.hpp>
#   include <imgui.h>
#   include <vector>
#   include <cstdint>

namespace gfx {


struct  RendererPathTree : public RendererBase
{
    using Super = RendererBase;

    struct NodeLayout
    {
        // Center of the node.
        vec2 origin{ vec2::zero() };

        // Half size of the rect representing the node.
        // It is computed from the text size.
        vec2 half_size{ vec2::zero() };

        std::string text;

        // The smallest coordinate origin.x of all coordinates of all
        // nodes in all subtrees of this node.
        float subtrees_min_x{ 0.0f };

        // The largest coordinate origin.x of all coordinates of all
        // nodes in all subtrees of this node.
        float subtrees_max_x{ 0.0f };
    };

    RendererPathTree(DataSources const*  data_sources);

    void next_frame() override;

private:

    NodeLayout& layout(std::uint32_t const node_index) { return m_node_layouts.at(node_index); }
    NodeLayout const& layout(std::uint32_t const node_index) const { return m_node_layouts.at(node_index); }

    void compute_node_locations(std::uint32_t node_index = 0U, float min_x = 0.0f, float y = 0.0f);
    void normalize_node_locations();

    void draw_subtree(ImDrawList& dl, std::uint32_t node_index, Rect const& visible_rect) const;
    void draw_node(ImDrawList& dl, std::uint32_t node_index) const;
    void draw_edge(ImDrawList& dl, std::uint32_t from_node_index, std::uint32_t to_node_index) const;

    void draw_node_tooltip(std::uint32_t node_index) const;

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
