#include <squirrel/gfx/renderer_path_tree.hpp>
#include <squirrel/gfx/shape.hpp>
#include <utility/assumptions.hpp>
#include <utility/invariants.hpp>
#include <sstream>
#include <cstdint>
#include <algorithm>

namespace gfx {


static float constexpr NODE_SEPARATION_HORIZONTAL = 10.0f;
static float constexpr NODE_SEPARATION_VERTICAL = 20.0f;
static float constexpr NODE_BORDER = 3.0f;


RendererPathTree::RendererPathTree(DataSources const* const  data_sources)
    : Super{ data_sources }
    , m_mouse_tracking{}
    , m_origin{ vec2::zero() }
    , m_node_layouts( tree().nodes().size() )
{}


void RendererPathTree::next_frame()
{
    Super::next_frame();

    ImGui::BeginChild("Tree canvas", ImVec2(0, 0), true);
    {
        if (frame_count() == 1ULL)
        {
            m_origin = window_origin() + vec2{ window_size().x / 2.0f, 50.0f };

            for (std::uint32_t node_index = 0U; node_index != (std::uint32_t)m_node_layouts.size(); ++node_index)
            {
                std::uint32_t const graph_node_index{ tree().node(node_index).graph_node_index };
                sala::NavigationGraph::Node const& n{ nav_graph().node(graph_node_index) };
                layout(node_index).text = std::to_string(n.function) + ":" + std::to_string(n.basic_block) + ":" + std::to_string(n.instruction);
            }
            for (std::uint32_t node_index = 0U; node_index != (std::uint32_t)m_node_layouts.size(); ++node_index)
                layout(node_index).half_size = 0.5f * ImGui::CalcTextSize(layout(node_index).text.c_str()) + vec2{ NODE_BORDER, NODE_BORDER };

            compute_node_locations();
            normalize_node_locations();
        }

        update_mouse_tracking_data(m_mouse_tracking);
        m_origin += m_mouse_tracking.delta;

        ImDrawList& dl = *ImGui::GetWindowDrawList();

        draw_subtree(dl, 0U, move_rect(window_rect(), -m_origin));
    }
    ImGui::EndChild();
}


void RendererPathTree::compute_node_locations(std::uint32_t const node_index, float min_x, float const y)
{
    NodeLayout& node_layout{ layout(node_index) };
    node_layout.origin.y = y;
    node_layout.subtrees_min_x = min_x;
    node_layout.subtrees_max_x = min_x + 2.0f * node_layout.half_size.x;
    for (std::uint32_t child_node_index = tree().child(node_index);
            child_node_index != chickaree::PathTree::INVALID_INDEX;
            child_node_index = tree().sibling(child_node_index))
    {
        compute_node_locations(child_node_index, min_x, y + 2.0f * node_layout.half_size.y + NODE_SEPARATION_VERTICAL);
        node_layout.subtrees_max_x = layout(child_node_index).subtrees_max_x;
        min_x = node_layout.subtrees_max_x + NODE_SEPARATION_HORIZONTAL;
    }
    node_layout.origin.x = 0.5f * (node_layout.subtrees_min_x + node_layout.subtrees_max_x);
}


void RendererPathTree::normalize_node_locations()
{
    vec2 const shift = -layout(0U).origin;
    for (std::uint32_t  node_index = 0U; node_index != (std::uint32_t)m_node_layouts.size(); ++node_index)
    {
        NodeLayout& node_layout{ layout(node_index) };
        node_layout.origin += shift;
        node_layout.subtrees_min_x += shift.x;
        node_layout.subtrees_max_x += shift.x;
    }
}


void RendererPathTree::draw_subtree(ImDrawList& dl, std::uint32_t node_index, Rect const& visible_rect) const
{
    NodeLayout const& node_layout{ layout(node_index) };

    if (node_layout.subtrees_min_x > visible_rect.right_bottom.x || node_layout.subtrees_max_x < visible_rect.left_top.x)
        return;
    if (node_layout.origin.y - node_layout.half_size.y > visible_rect.right_bottom.y)
        return;

    for (std::uint32_t child_node_index = tree().child(node_index);
            child_node_index != chickaree::PathTree::INVALID_INDEX;
            child_node_index = tree().sibling(child_node_index))
        draw_subtree(dl, child_node_index, visible_rect);

    if (node_layout.origin.y + node_layout.half_size.y < visible_rect.left_top.y)
        return;

    draw_node(dl, node_index);
    for (std::uint32_t child_node_index = tree().child(node_index);
            child_node_index != chickaree::PathTree::INVALID_INDEX;
            child_node_index = tree().sibling(child_node_index))
        draw_edge(dl, node_index, child_node_index);

    if (m_mouse_tracking.is_valid && !m_mouse_tracking.is_right_button_down)
    {
        NodeLayout const& node_layout{ layout(node_index) };
        vec2 const pos = nearest_point_on_rect_to_point(
                make_rect_from_center_and_half_size(node_layout.origin + m_origin, node_layout.half_size),
                m_mouse_tracking.last_pos
                );
        if (equal(m_mouse_tracking.last_pos, pos))
            draw_node_tooltip(node_index);
    }
}


void RendererPathTree::draw_node(ImDrawList& dl, std::uint32_t const node_index) const
{
    NodeLayout const& node_layout{ layout(node_index) };
    Rect const rect{ make_rect_from_center_and_half_size(node_layout.origin + m_origin, node_layout.half_size) };
    if (!collision(rect, window_rect()))
        return;

    chickaree::PathTree::Node const& tn{ tree().node(node_index) };

    ImU32 fill_color;
    ImU32 text_color;
    if (tn.flags.unreachable != 0)
    {
        fill_color = IM_COL32(10, 10, 10, 255);
        text_color = IM_COL32(100, 100, 100, 255);
    }
    else
    {
        if (tn.flags.executed != 0)
            text_color = IM_COL32(255, 210, 0, 255);
        else
            text_color = IM_COL32(255, 255, 255, 255);

        if (tn.stack_entry == node_index)
            fill_color = IM_COL32(50, 100, 50, 255);
        else
            fill_color = IM_COL32(75, 75, 75, 255);
    }

    dl.AddRectFilled(
        rect.left_top,
        rect.right_bottom,
        fill_color,
        0.0f,
        0
    );
    dl.AddRect(
        rect.left_top,
        rect.right_bottom,
        IM_COL32(125, 125, 125, 255),
        0.0f,
        0
    );
    dl.AddText(rect.left_top + vec2{ NODE_BORDER, NODE_BORDER }, text_color, node_layout.text.data(), node_layout.text.data() + node_layout.text.size());
}


void RendererPathTree::draw_edge(ImDrawList& dl, std::uint32_t const from_node_index, std::uint32_t const to_node_index) const
{
    NodeLayout const& from_node_layout{ layout(from_node_index) };
    Rect const from_rect{ make_rect_from_center_and_half_size(from_node_layout.origin + m_origin, from_node_layout.half_size) };

    NodeLayout const& to_node_layout{ layout(to_node_index) };
    Rect const to_rect{ make_rect_from_center_and_half_size(to_node_layout.origin + m_origin, to_node_layout.half_size) };

    vec2 from, to;
    std::tie(from, to) = nearest_points_of_rects(from_rect, to_rect);

    draw_arrow(dl, from, to, IM_COL32(125, 125, 125, 255), 1.0f);
}


void RendererPathTree::draw_node_tooltip(std::uint32_t node_index) const
{
    ImGui::BeginTooltip();
        chickaree::PathTree::Node const& tn{ tree().node(node_index) };
        std::uint32_t const graph_node_index{ tn.graph_node_index };
        sala::NavigationGraph::Node const& n{ nav_graph().node(graph_node_index) };

        std::string line = 
                "fn: " + std::to_string(n.function) +
                ", bb: " + std::to_string(n.basic_block) +
                ", ei: " + std::to_string(n.instruction);
        ImGui::Text("%s", line.c_str());

        ImGui::Separator();

        line = "tree idx: " + std::to_string(node_index);
        ImGui::Text("%s", line.c_str());
        ImGui::Text("Stack entry: %u", (unsigned int)tn.stack_entry);

        line = "cfg idx: " + std::to_string(graph_node_index);
        ImGui::Text("%s", line.c_str());

        ImGui::Separator();

        ImGui::Text("Flags:");
        ImGui::Text("  unreachable: %u", (unsigned int)tn.flags.unreachable);
        ImGui::Text("  executed: %u", (unsigned int)tn.flags.executed);

    ImGui::EndTooltip();
}


}
