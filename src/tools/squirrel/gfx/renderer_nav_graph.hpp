#ifndef TOOL_SQUIRREL_GFX_RENDERER_NAV_GRAPH_HPP_INCLUDED
#   define TOOL_SQUIRREL_GFX_RENDERER_NAV_GRAPH_HPP_INCLUDED

#   include <squirrel/gfx/renderer_base.hpp>
#   include <squirrel/gfx/math.hpp>
#   include <utility/std_pair_hash.hpp>
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
        enum Type
        {
            ENTRY,
            CALL,
            RET,
            BRANCH,
            JUMP,
        };

        vec2 origin{ vec2::zero() };    // Center of the node.
        vec2 half_size{ vec2::zero() }; // Half width and half height.
        vec2 velocity{ vec2::zero() };
        vec2 force{ vec2::zero() };
        Type type{ ENTRY };
        std::vector<std::string> text_lines{};
    };

    using EdgeID = std::pair<std::uint32_t, std::uint32_t>;

    struct EdgeLayout
    {
        enum Type
        {
            CALL,
            BRANCH_FALSE,
            BRANCH_TRUE,
            JUMP,
        };

        Type type{ CALL };
        std::vector<std::string> text_lines{};
    };

    struct FunctionLayout
    {
        using NodeIndices2Layouts = std::unordered_map<std::uint32_t, NodeLayout>;
        using EdgeIDs2Layouts = std::unordered_map<EdgeID, EdgeLayout>;

        vec2 origin;
        NodeIndices2Layouts node_layouts;
        EdgeIDs2Layouts edge_layouts;
    };

    using FunctionLayouts = std::vector<FunctionLayout>;

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

    void draw_node(ImDrawList& dl, FunctionLayout const& fn_layout, std::uint32_t node_index, NodeLayout const& node_layout) const;
    void draw_edge(ImDrawList& dl, FunctionLayout const& fn_layout, EdgeID const& edge_id, EdgeLayout const& edge_layout) const;

    void draw_node_tooltip(
            ImDrawList& dl,
            vec2 const& pos,
            FunctionLayout const& fn_layout,
            std::uint32_t node_index,
            NodeLayout const& node_layout
            ) const;

    void inter_costs_table_to_text(
            std::vector<std::string>& out_text_lines,
            sala::NavigationGraph::InterCosts::Table const& inter_costs
            ) const;

    void clear_forces(std::uint32_t fn_index);
    void compute_forces(std::uint32_t fn_index);
    void apply_forces(std::uint32_t fn_index);

    float split_x;
    std::uint32_t  selected_function;
    MouseTracking mouse_tracking;

    FunctionLayouts m_function_layouts;
};


}

#endif
