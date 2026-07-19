#ifndef TOOL_SQUIRREL_GFX_RENDERER_NAV_GRAPH_HPP_INCLUDED
#   define TOOL_SQUIRREL_GFX_RENDERER_NAV_GRAPH_HPP_INCLUDED

#   include <squirrel/gfx/renderer_base.hpp>
#   include <squirrel/gfx/math.hpp>
#   include <imgui.h>
#   include <unordered_map>
#   include <vector>
#   include <string>

namespace gfx {


struct  RendererNavGraph : public RendererBase
{
    using Super = RendererBase;

    struct NodeLayout
    {
        vec2 origin;    // Center of the node.
        vec2 half_size; // Half width and half height.
        vec2 velocity;
        vec2 force;
        std::vector<std::string> text_lines;
    };

    struct FunctionLayout
    {
        using NodeIndices2Layouts = std::unordered_map<std::uint32_t, NodeLayout>;

        vec2 origin;
        NodeIndices2Layouts node_layouts;
    };

    using FunctionNodeLayouts = std::vector<FunctionLayout>;

    RendererNavGraph(DataSources const*  data_sources);

    void next_frame() override;

private:

    struct MouseTracking
    {
        bool is_valid{ false };
        bool is_right_button_down{ false };
        vec2 last_pos{ vec2::zero() };
        vec2 delta{ vec2::zero() };
    };

    void update_mouse_data();

    Rect node_rect(std::uint32_t node_index) const;
    Rect node_rect_local(std::uint32_t node_index, float extent = 0.0f) const;

    void draw_node(ImDrawList& dl, std::uint32_t node_index) const;
    void draw_edge(ImDrawList& dl, std::uint32_t src_node_index, std::uint32_t succ_index, std::size_t succ_count) const;

    void clear_forces(std::uint32_t fn_index);
    void compute_forces(std::uint32_t fn_index);
    void apply_forces(std::uint32_t fn_index);

    float split_x;
    std::uint32_t  selected_function;
    MouseTracking mouse_tracking;

    FunctionNodeLayouts m_function_node_layouts;
};


}

#endif
