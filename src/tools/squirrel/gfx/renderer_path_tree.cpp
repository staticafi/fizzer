#include <squirrel/gfx/renderer_path_tree.hpp>
#include <squirrel/gfx/shape.hpp>
#include <cps/variable_str.hpp>
#include <cps/comparator_str.hpp>
#include <utility/assumptions.hpp>
#include <utility/invariants.hpp>
#include <sstream>
#include <cstdint>
#include <algorithm>

namespace gfx {


static float constexpr NODE_SEPARATION_HORIZONTAL = 10.0f;
static float constexpr NODE_SEPARATION_VERTICAL = 20.0f;
static float constexpr NODE_BORDER = 3.0f;


RendererPathTree::RendererPathTree(DataSources const&  data_sources)
    : Super{ data_sources }
    , m_mouse_tracking{}
    , m_origin{ vec2::zero() }
    , m_node_layouts( tree().nodes().size() )
{}


void RendererPathTree::next_frame()
{
    Super::next_frame();

    ImGui::BeginChild("Tree canvas", ImVec2(0, 0), ImGuiChildFlags_Borders);
    {
        if (frame_count() < 10ULL)
        {
            m_origin = window_origin() + vec2{ window_size().x / 2.0f, 50.0f };
            on_data_changed();
        }

        update_mouse_tracking_data(m_mouse_tracking);
        m_origin += m_mouse_tracking.delta;

        ImDrawList& dl = *ImGui::GetWindowDrawList();

        draw_subtree(dl, 0U, move_rect(window_rect(), -m_origin));
    }
    ImGui::EndChild();
}


void RendererPathTree::on_data_changed()
{
    m_node_layouts.clear();
    m_node_layouts.resize(tree().nodes().size(), {});

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
    compute_run_outcome_indices();
}


void RendererPathTree::compute_node_locations(std::uint32_t const node_index, float min_x, float const y)
{
    NodeLayout& node_layout{ layout(node_index) };
    node_layout.origin.y = y;
    node_layout.subtrees_min_x = min_x;
    node_layout.subtrees_max_x = min_x + 2.0f * node_layout.half_size.x;
    std::vector<float> x_coords;
    for (std::uint32_t child_node_index = tree().child(node_index);
            child_node_index != chickaree::PathTree::INVALID_INDEX;
            child_node_index = tree().sibling(child_node_index))
    {
        compute_node_locations(child_node_index, min_x, y + 2.0f * node_layout.half_size.y + NODE_SEPARATION_VERTICAL);
        node_layout.subtrees_max_x = layout(child_node_index).subtrees_max_x;
        min_x = node_layout.subtrees_max_x + NODE_SEPARATION_HORIZONTAL;
        x_coords.push_back(layout(child_node_index).origin.x);
    }
    if (x_coords.empty())
        node_layout.origin.x = 0.5f * (node_layout.subtrees_min_x + node_layout.subtrees_max_x);
    else
    {
        float lo_x = x_coords.back();
        float hi_x = lo_x;
        x_coords.pop_back();
        for (float const x : x_coords)
        {
            lo_x = std::min(lo_x, x);
            hi_x = std::max(hi_x, x);
        }
        node_layout.origin.x = 0.5f * (lo_x + hi_x);
    }
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


void RendererPathTree::compute_run_outcome_indices()
{
    chickaree::PathExecutor const* const  executor = solver().get_path_executor();
    if (executor == nullptr)
        return;

    {
        auto const& indices = solver().path();
        for (std::uint32_t i = 0U, end = (std::uint32_t)indices.size(); i != end; ++i)
            layout(indices.at(i)).get_or_create_run_outcome_indices()->path_index = i;
    }

    {
        auto const& indices = executor->run_outcome()->inputs.path_indices;
        for (std::uint32_t i = 0U, end = (std::uint32_t)indices.size(); i != end; ++i)
            layout(solver().path().at(indices.at(i))).get_or_create_run_outcome_indices()->inputs.push_back(i);
    }

    {
        auto const& indices = executor->run_outcome()->constants.path_indices;
        for (std::uint32_t i = 0U, end = (std::uint32_t)indices.size(); i != end; ++i)
            layout(solver().path().at(indices.at(i))).get_or_create_run_outcome_indices()->constants.push_back(i);
    }

    {
        auto const& indices = executor->run_outcome()->black_box_functions.path_indices;
        for (std::uint32_t i = 0U, end = (std::uint32_t)indices.size(); i != end; ++i)
            layout(solver().path().at(indices.at(i))).get_or_create_run_outcome_indices()->black_box_functions.push_back(i);
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

    if (!node_layout.has_run_outcome_indices())
        return;

    auto const& run_outcomes{ *solver().get_path_executor()->run_outcome() };

    vec2 const rect_ext{ 2.0f, 2.0f };
    dl.AddRect(
        rect.left_top - rect_ext,
        rect.right_bottom + rect_ext,
        !run_outcomes.diverged || node_layout.get_run_outcome_indices()->path_index < run_outcomes.path_index ?
            IM_COL32(75, 75, 255, 255) :
            IM_COL32(255, 75, 75, 255),
        0.0f,
        0,
        2.0f
    );
    if (!node_layout.get_run_outcome_indices()->inputs.empty())
    {
        float const r = 0.5f * (rect.right_bottom.y - rect.left_top.y);
        dl.AddCircleFilled(rect.left_top + vec2{ -r - 2.0f, r }, r, IM_COL32(255, 75, 75, 255) );
    }
    if (!node_layout.get_run_outcome_indices()->constants.empty())
    {
        float const r = 0.5f * (rect.right_bottom.y - rect.left_top.y);
        dl.AddCircleFilled(rect.right_bottom + vec2{ r + 2.0f, -r }, r, IM_COL32(75, 75, 255, 255) );
    }
    if (!node_layout.get_run_outcome_indices()->black_box_functions.empty())
    {
        float const r = 0.5f * (rect.right_bottom.y - rect.left_top.y);
        dl.AddCircleFilled(rect.left_top + vec2{ -r - 2.0f, r }, r, IM_COL32(75, 255, 75, 255), 4);
    }
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

        NodeLayout const& node_layout{ layout(node_index) };
        if (node_layout.has_run_outcome_indices())
        {
            auto const& run_outcomes{ *solver().get_path_executor()->run_outcome() };

            if (!node_layout.get_run_outcome_indices()->inputs.empty())
            {
                ImGui::Separator();
                ImGui::Text("Inputs:");
                if (ImGui::BeginTable("Inputs", 3U, ImGuiTableFlags_BordersH | ImGuiTableFlags_BordersV))
                {
                    ImGui::TableNextRow();
                    ImGui::TableSetColumnIndex(0); ImGui::Text("Idx");
                    ImGui::TableSetColumnIndex(1); ImGui::Text("Type");
                    ImGui::TableSetColumnIndex(2); ImGui::Text("Value");
                    for (std::uint32_t i : node_layout.get_run_outcome_indices()->inputs)
                    {
                        auto const& var = run_outcomes.inputs.variables.at(i);
                        auto const type = cps::type_as_str(var);
                        auto const value = cps::value_as_str(var);

                        ImGui::TableNextRow();
                        ImGui::TableSetColumnIndex(0); ImGui::Text("%d", i);
                        ImGui::TableSetColumnIndex(1); ImGui::Text("%s", type.c_str());
                        ImGui::TableSetColumnIndex(2); ImGui::Text("%s", value.c_str());
                    }
                    ImGui::EndTable();
                }
            }
            if (!node_layout.get_run_outcome_indices()->constants.empty())
            {
                ImGui::Separator();
                ImGui::Text("Constants:");
                if (ImGui::BeginTable("Constants", 3U, ImGuiTableFlags_BordersH | ImGuiTableFlags_BordersV))
                {
                    ImGui::TableNextRow();
                    ImGui::TableSetColumnIndex(0); ImGui::Text("Idx");
                    ImGui::TableSetColumnIndex(1); ImGui::Text("Type");
                    ImGui::TableSetColumnIndex(2); ImGui::Text("Value");
                    for (std::uint32_t i : node_layout.get_run_outcome_indices()->constants)
                    {
                        auto const& var = run_outcomes.constants.variables.at(i);
                        auto const type = cps::type_as_str(var);
                        auto const value = cps::value_as_str(var);

                        ImGui::TableNextRow();
                        ImGui::TableSetColumnIndex(0); ImGui::Text("%d", i);
                        ImGui::TableSetColumnIndex(1); ImGui::Text("%s", type.c_str());
                        ImGui::TableSetColumnIndex(2); ImGui::Text("%s", value.c_str());
                    }
                    ImGui::EndTable();
                }
            }
            if (!node_layout.get_run_outcome_indices()->black_box_functions.empty())
            {
                ImGui::Separator();
                ImGui::Text("Black box functions:");
                if (ImGui::BeginTable("BBF", 7U, ImGuiTableFlags_BordersH | ImGuiTableFlags_BordersV))
                {
                    ImGui::TableNextRow();
                    ImGui::TableSetColumnIndex(0); ImGui::Text("Idx");
                    ImGui::TableSetColumnIndex(1); ImGui::Text("Inputs");
                    ImGui::TableSetColumnIndex(2); ImGui::Text("Constants");
                    ImGui::TableSetColumnIndex(3); ImGui::Text("Comparator");
                    ImGui::TableSetColumnIndex(4); ImGui::Text("Value");
                    ImGui::TableSetColumnIndex(5); ImGui::Text("Predicate");
                    ImGui::TableSetColumnIndex(6); ImGui::Text("Hit counts");
                    for (std::uint32_t i : node_layout.get_run_outcome_indices()->black_box_functions)
                    {
                        auto const comparator = cps::as_str(run_outcomes.black_box_functions.comparators.at(i));
                        auto const value = run_outcomes.black_box_functions.output.at(i).function;
                        auto const predicate = run_outcomes.black_box_functions.output.at(i).predicate;

                        ImGui::TableNextRow();
                        ImGui::TableSetColumnIndex(0); ImGui::Text("%d", i);

                        ImGui::TableSetColumnIndex(1);
                        if (ImGui::BeginTable((std::string("Inputs:") + std::to_string(i)).c_str(), 1U, ImGuiTableFlags_BordersInner))
                        {
                            for (std::uint32_t i : run_outcomes.black_box_functions.inputs_indices.at(i))
                            {
                                ImGui::TableNextRow();
                                ImGui::TableSetColumnIndex(0); ImGui::Text("%d", i);
                            }
                            ImGui::EndTable();
                        }

                        ImGui::TableSetColumnIndex(2);
                        if (ImGui::BeginTable((std::string("Constants:") + std::to_string(i)).c_str(), 1U, ImGuiTableFlags_BordersInner))
                        {
                            for (std::uint32_t i : run_outcomes.black_box_functions.constants_indices.at(i))
                            {
                                ImGui::TableNextRow();
                                ImGui::TableSetColumnIndex(0); ImGui::Text("%d", i);
                            }
                            ImGui::EndTable();
                        }

                        ImGui::TableSetColumnIndex(3); ImGui::Text("%s", comparator.c_str());
                        ImGui::TableSetColumnIndex(4); ImGui::Text("%f", value);
                        ImGui::TableSetColumnIndex(5); ImGui::Text("%s", predicate ? "true" : "false");

                        ImGui::TableSetColumnIndex(6);
                        if (ImGui::BeginTable((std::string("HitCounts:") + std::to_string(i)).c_str(), 2U, ImGuiTableFlags_BordersInner))
                        {
                            for (auto [graph_node_index, count] : run_outcomes.black_box_functions.basic_blocks_hit_counts.at(i))
                            {
                                sala::NavigationGraph::Node const& n{ nav_graph().node(graph_node_index) };
                                auto const text = std::to_string(n.function) + ":" + std::to_string(n.basic_block) + ":" + std::to_string(n.instruction);
                                ImGui::TableNextRow();
                                ImGui::TableSetColumnIndex(0); ImGui::Text("%s", text.c_str());
                                ImGui::TableSetColumnIndex(1); ImGui::Text("%d", count);
                            }
                            ImGui::EndTable();
                        }
                    }
                    ImGui::EndTable();
                }
            }
        }

    ImGui::EndTooltip();
}


}
