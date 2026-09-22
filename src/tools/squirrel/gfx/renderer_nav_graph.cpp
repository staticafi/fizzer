#include <squirrel/gfx/renderer_nav_graph.hpp>
#include <squirrel/gfx/shape.hpp>
#include <sala/streaming.hpp>
#include <sala/streaming_utils.hpp>
#include <utility/assumptions.hpp>
#include <utility/invariants.hpp>
#include <unordered_set>
#include <sstream>
#include <deque>
#include <cstdint>
#include <algorithm>

namespace gfx {


RendererNavGraph::RendererNavGraph(DataSources const&  data_sources)
    : Super{ data_sources }
    , split_x{ 300.0f }
    , selected_function{ data_sources.program->entry_function() }
    , mouse_tracking{}
    , m_function_layouts{}
{
    for (std::size_t fn_index = 0ULL; fn_index != nav_graph().lookups().size(); ++fn_index)
    {
        m_function_layouts.push_back(FunctionLayout{
            .origin = vec2::zero(),
            .node_layouts = {},
            .edge_layouts = {}
        });

        // Create empty node and edge layouts.
        std::uint32_t const begin_node_index = nav_graph().begin(fn_index);
        std::uint32_t const end_node_index = nav_graph().end(fn_index);
        for (std::uint32_t i = begin_node_index; i < end_node_index; ++i)
        {
            m_function_layouts.back().node_layouts.insert({ i, {} });
            std::vector<std::uint32_t> succ_node_indices;
            if (nav_graph().is_call(i))
                succ_node_indices.push_back(nav_graph().bb_next(i));
            else
                succ_node_indices = nav_graph().successors(i);
            for (std::uint32_t const j : succ_node_indices)
                m_function_layouts.back().edge_layouts.insert({ {i, j}, {} });
        }

        // Here we fill in layouts of nodes.
        for (auto& idx_and_layout : m_function_layouts.back().node_layouts)
        {
            std::uint32_t const node_index = idx_and_layout.first;
            NodeLayout& node_layout = idx_and_layout.second;

            sala::NavigationGraph::Node const& n{ nav_graph().node(node_index) };

            node_layout.text_lines.push_back(
                    "idx: " + std::to_string(node_index) +
                    ", fn: " + std::to_string(n.function) +
                    ", bb: " + std::to_string(n.basic_block) +
                    ", ei: " + std::to_string(n.instruction)
                    );

            auto const& bbs{ program().functions().at(fn_index).basic_blocks().at(n.basic_block) };
            for (std::size_t i = 0ULL, end = nav_graph().num_instructions(node_index); i != end; ++i)
            {
                std::size_t const instr_index = ((n.instruction + 1ULL) - end) + i;
                std::stringstream sstr;
                sstr << instr_index << ":\t" << bbs.instructions().at(instr_index);
                node_layout.text_lines.push_back(sstr.str());
            }

            if (node_index != nav_graph().entry(fn_index))
            {
                if (nav_graph().is_call(node_index))
                    node_layout.type = NodeLayout::CALL;
                else if (nav_graph().is_ret(node_index))
                    node_layout.type = NodeLayout::RET;
                else if (nav_graph().successors(node_index).size() == 1ULL)
                    node_layout.type = NodeLayout::JUMP;
                else
                    node_layout.type = NodeLayout::BRANCH;
            }
        }

        // Filling edge layouts.
        for (auto& id_and_layout : m_function_layouts.back().edge_layouts)
        {
            std::uint32_t const node_index = id_and_layout.first.first;
            std::uint32_t const succ_node_index = id_and_layout.first.second;
            EdgeLayout& edge_layout = id_and_layout.second;

            // Setup of type
            if (nav_graph().is_call(node_index))
                edge_layout.type = EdgeLayout::CALL;
            else
            {
                auto const& succ = nav_graph().successors(node_index);
                INVARIANT(succ.size() == 1ULL || succ.size() == 2ULL);
                if (succ.size() == 1ULL)
                    edge_layout.type = EdgeLayout::JUMP;
                else if (succ.front() == succ_node_index)
                    edge_layout.type = EdgeLayout::BRANCH_FALSE;
                else
                {
                    INVARIANT(succ.back() == succ_node_index);
                    edge_layout.type = EdgeLayout::BRANCH_TRUE;
                }
            }

            // Line 1 (intra cost; always shown)
            {
                std::stringstream sstr;
                sala::NavigationGraph::Cost const cost = nav_graph().intra_cost(node_index, succ_node_index);
                if (cost == sala::NavigationGraph::INFINITY_COST)
                    sstr << "INF";
                else
                    sstr << cost;
                edge_layout.text_lines.push_back(sstr.str());
            }

            if (edge_layout.type == EdgeLayout::CALL)
            {
                // We add text of costs of all callees in format 'callee1:cost1, callee2:cost2, ...'
                inter_costs_table_to_text(edge_layout.text_lines, nav_graph().inter_cost_from_call(node_index));
            }
        }
    }
}


void RendererNavGraph::compute_node_locations(NodePlacementInfo& info, std::uint32_t const node_index, float min_x, float const y)
{
    static float constexpr NODE_SEPARATION_HORIZONTAL = 50.0f;
    static float constexpr NODE_SEPARATION_VERTICAL = 100.0f;

    NodeLayout& node_layout{ m_function_layouts.at(info.fn_index).node_layouts.at(node_index) };
    NodePlacementInfo::SubWidth& sub_width{ info.visited.insert({ node_index, { min_x, min_x + 2.0f * node_layout.half_size.x } }).first->second };
    node_layout.origin.y = y;
    std::vector<std::uint32_t> succ_node_indices;
    if (nav_graph().is_call(node_index))
        succ_node_indices.push_back(nav_graph().bb_next(node_index));
    else
        succ_node_indices = nav_graph().successors(node_index);
    std::vector<std::uint32_t> proper_childs;
    for (std::uint32_t const child_node_index : succ_node_indices)
    {
        if (info.visited.contains(child_node_index))
            continue;
        compute_node_locations(info, child_node_index, min_x, y + 2.0f * node_layout.half_size.y + NODE_SEPARATION_VERTICAL);
        NodePlacementInfo::SubWidth& child_sub_width{ info.visited.at(child_node_index) };
        sub_width.max_x = std::max(sub_width.max_x, child_sub_width.max_x);
        min_x = sub_width.max_x + NODE_SEPARATION_HORIZONTAL;
        proper_childs.push_back(child_node_index);
    }
    if (proper_childs.empty())
        node_layout.origin.x = 0.5f * (sub_width.min_x + sub_width.max_x);
    else
    {
        auto const& layouts = m_function_layouts.at(info.fn_index).node_layouts;
        float lo_x = layouts.at(proper_childs.back()).origin.x;
        float hi_x = lo_x;
        proper_childs.pop_back();
        for (std::uint32_t const child_node_index : proper_childs)
        {
            float x = layouts.at(child_node_index).origin.x;
            lo_x = std::min(lo_x, x);
            hi_x = std::max(hi_x, x);
        }
        node_layout.origin.x = 0.5f * (lo_x + hi_x);
    }
}


void RendererNavGraph::normalize_node_locations(std::uint32_t const fn_index)
{
    auto& fn_layouts{ m_function_layouts.at(fn_index) };
    vec2 const shift = -fn_layouts.node_layouts.at(nav_graph().begin(fn_index)).origin;
    for (auto& [ _, layout ] : fn_layouts.node_layouts)
        layout.origin += shift;
}


void RendererNavGraph::next_frame()
{
    Super::next_frame();

    ImGui::BeginChild("LeftPane", ImVec2(split_x, 0), true);
    {
        std::unordered_set<std::uint32_t> external_functions {
                program().external_functions().begin(),
                program().external_functions().end()
                };
        ImU32 special_functions_colors[3] {
                IM_COL32(100, 150, 100, 255),   // Static initializer
                IM_COL32(255, 175, 0, 255),     // Entry function
                IM_COL32(150, 150, 150, 255)    // Extern function
                };
        for (std::uint32_t fn_index = 0; fn_index < (std::uint32_t)program().functions().size(); ++fn_index) {
            INVARIANT(fn_index == data().program->functions().at(fn_index).index());
            std::string const label = std::to_string(fn_index) + ": " + program().functions().at(fn_index).name();

            bool is_color_style_pushed = false;
            if (fn_index == 0U)
            {
                ImGui::PushStyleColor(ImGuiCol_Text, special_functions_colors[0]);
                is_color_style_pushed = true;
            }
            else if (fn_index == program().entry_function())
            {
                ImGui::PushStyleColor(ImGuiCol_Text, special_functions_colors[1]);
                is_color_style_pushed = true;
            }
            else if (external_functions.contains(fn_index))
            {
                ImGui::PushStyleColor(ImGuiCol_Text, special_functions_colors[2]);
                is_color_style_pushed = true;
            }

            if (ImGui::Selectable(label.c_str(), selected_function == fn_index)) {
                selected_function = fn_index;
            }

            if (is_color_style_pushed)
                ImGui::PopStyleColor();

            if (ImGui::IsItemHovered())
            {
                ImGui::BeginTooltip();
                {
                    ImGui::Text("Avg. cost: %u", nav_graph().func_avg_cost(fn_index));

                    {
                        std::vector<std::string> text_lines;
                        inter_costs_table_to_text(text_lines, nav_graph().inter_costs(fn_index).from_entry);
                        if (!text_lines.empty())
                        {
                            ImGui::Separator();
                            text_lines[0] = "Callees: " + text_lines[0];
                            for (auto const& line : text_lines)
                                ImGui::Text("%s", line.c_str());
                        }
                    }

                    {
                        ImGui::Separator();
                        ImGui::Text("Intra costs:");
                        std::uint32_t const begin_node_index{ nav_graph().begin(fn_index) };
                        std::uint32_t const end_node_index{ nav_graph().end(fn_index) };
                        if (ImGui::BeginTable(
                                "Intra costs",
                                end_node_index - begin_node_index + 1U, 
                                ImGuiTableFlags_BordersH | ImGuiTableFlags_BordersV
                                ))
                        {
                            ImGui::TableNextRow();
                            ImGui::TableSetColumnIndex(0);
                            ImGui::Text("");
                            for (std::uint32_t node_index = begin_node_index; node_index != end_node_index; ++node_index)
                            {
                                ImGui::TableSetColumnIndex(node_index + 1U - begin_node_index);
                                ImGui::PushStyleColor(ImGuiCol_Text, IM_COL32(255, 200, 0, 255));
                                    ImGui::Text("%u", node_index);
                                ImGui::PopStyleColor();
                            }

                            for (std::uint32_t row_node_index = begin_node_index; row_node_index != end_node_index; ++row_node_index)
                            {
                                ImGui::TableNextRow();
                                ImGui::TableSetColumnIndex(0);
                                ImGui::PushStyleColor(ImGuiCol_Text, IM_COL32(255, 200, 0, 255));
                                    ImGui::Text("%u", row_node_index);
                                ImGui::PopStyleColor();

                                for (std::uint32_t col_node_index = begin_node_index; col_node_index != end_node_index; ++col_node_index)
                                {
                                    ImGui::TableSetColumnIndex(col_node_index + 1U - begin_node_index);
                                    sala::NavigationGraph::Cost const cost = nav_graph().intra_cost(row_node_index, col_node_index);
                                    if (cost == sala::NavigationGraph::INFINITY_COST)
                                    {
                                        ImGui::PushStyleColor(ImGuiCol_Text, IM_COL32(100, 100, 100, 255));
                                            ImGui::Text("INF");
                                        ImGui::PopStyleColor();
                                    }
                                    else
                                        ImGui::Text("%u", cost);
                                }
                            }

                            ImGui::EndTable();
                        }

                    }
                }
                ImGui::EndTooltip();
            }
        }
    }
    ImGui::EndChild();

    ImGui::PushStyleVar(ImGuiStyleVar_ItemSpacing, ImVec2(0, 0));
    ImGui::SameLine();
    {
        ImGui::InvisibleButton("vsplitter", ImVec2(8.0f, -1)); // 8px wide
        if (ImGui::IsItemActive()) {
            split_x += ImGui::GetIO().MouseDelta.x; // Adjust size on drag
        }
    }
    ImGui::SameLine();
    ImGui::PopStyleVar();

    // clear_forces(selected_function);
    // compute_forces(selected_function);
    // apply_forces(selected_function);

    ImGui::BeginChild("RightPane", ImVec2(0, 0), true);
    {
        if (frame_count() == 1ULL)
        {
            for (std::size_t fn_index = 0ULL; fn_index != nav_graph().lookups().size(); ++fn_index)
            {
                FunctionLayout& fn_layout{ m_function_layouts.at(fn_index) };
                fn_layout.origin = window_origin() + vec2{ window_size().x / 2.0f, 150.0f };
                for (auto& idx_and_layout : fn_layout.node_layouts)
                {
                    std::uint32_t const node_index{ idx_and_layout.first };
                    NodeLayout& layout{ idx_and_layout.second };

                    for (std::string const& line : layout.text_lines)
                    {
                        vec2 const line_size = ImGui::CalcTextSize(line.c_str());
                        layout.half_size.x = std::max(layout.half_size.x, line_size.x);
                        layout.half_size.y += line_size.y;
                    }
                    layout.half_size *= 0.5f;
                }

                NodePlacementInfo info{};
                info.fn_index = fn_index;
                compute_node_locations(info, nav_graph().begin(fn_index), 0.0f, 0.0f);
                normalize_node_locations(fn_index);
            }
        }

        ImDrawList& dl = *ImGui::GetWindowDrawList();
        FunctionLayout& fn_layout{ m_function_layouts.at(selected_function) };

        update_mouse_tracking_data(mouse_tracking);
        fn_layout.origin += mouse_tracking.delta;

        for (auto const& idx_and_layout : fn_layout.node_layouts)
            draw_node(dl, fn_layout, idx_and_layout.first, idx_and_layout.second);

        for (auto const& id_and_layout : fn_layout.edge_layouts)
            draw_edge(dl, fn_layout, id_and_layout.first, id_and_layout.second);

        if (mouse_tracking.is_valid && !mouse_tracking.is_right_button_down)
            for (auto const& idx_and_layout : fn_layout.node_layouts)
            {
                vec2 pos = nearest_point_on_rect_to_point(
                        make_rect_from_center_and_half_size(
                                idx_and_layout.second.origin + fn_layout.origin,
                                idx_and_layout.second.half_size
                                ),
                        mouse_tracking.last_pos
                        );
                if (equal(mouse_tracking.last_pos, pos))
                {
                    draw_node_tooltip(pos - fn_layout.origin, fn_layout, idx_and_layout.first, idx_and_layout.second);
                    break;
                }
            }
    }
    ImGui::EndChild();
}


void RendererNavGraph::draw_node(
        ImDrawList& dl,
        FunctionLayout const& fn_layout,
        std::uint32_t const node_index,
        NodeLayout const& node_layout
        ) const
{
    Rect rect{ make_rect_from_center_and_half_size(node_layout.origin + fn_layout.origin, node_layout.half_size) };
    if (!collision(rect, window_rect()))
        return;

    ImU32 color;
    switch (node_layout.type)
    {
        case NodeLayout::ENTRY: color = IM_COL32(75, 25, 55, 255); break;
        case NodeLayout::CALL: color = IM_COL32(25, 75, 55, 255); break;
        case NodeLayout::RET: color = IM_COL32(75, 55, 25, 255); break;
        case NodeLayout::BRANCH:
        case NodeLayout::JUMP: color = IM_COL32(75, 75, 75, 255); break;
        default: UNREACHABLE(); break;
    }

    dl.AddRectFilled(
        rect.left_top,
        rect.right_bottom,
        color,
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
    vec2 pos = rect.left_top;
    for (std::string const& line : node_layout.text_lines)
    {
        dl.AddText(pos, IM_COL32(255, 255, 255, 255), line.data(), line.data() + line.size());
        pos.y += ImGui::CalcTextSize(line.c_str()).y;
    }
}


void RendererNavGraph::draw_edge(
        ImDrawList& dl,
        FunctionLayout const& fn_layout,
        EdgeID const& edge_id,
        EdgeLayout const& edge_layout
        ) const
{
    NodeLayout const& from_layout{ fn_layout.node_layouts.at(edge_id.first) };
    NodeLayout const& to_layout{ fn_layout.node_layouts.at(edge_id.second) };

    Rect const from_rect = make_rect_from_center_and_half_size(from_layout.origin + fn_layout.origin, from_layout.half_size);
    Rect const to_rect = make_rect_from_center_and_half_size(to_layout.origin + fn_layout.origin, to_layout.half_size);

    vec2 from, to, mid;
    if (edge_id.first == edge_id.second)
    {
        from = vec2{ from_rect.right_bottom.x, from_rect.left_top.y };
        to = from_rect.right_bottom;
        mid = avg(from, to) - 2.0f * orthogonal_ccw(to - from);
    }
    else if (fn_layout.edge_layouts.contains({ edge_id.second, edge_id.first}))
    {
        std::tie(from, to) = nearest_points_of_rects(from_rect, to_rect);
        mid = avg(from, to) - 0.5f * orthogonal_ccw(to - from);
    }
    else
    {
        std::tie(from, to) = nearest_points_of_rects(from_rect, to_rect);
        mid = avg(from, to);
    }

    vec2 max_line_size{ 0.0f, 0.0f };
    for (std::string const& line : edge_layout.text_lines)
    {
        vec2 const size = ImGui::CalcTextSize(line.c_str());
        max_line_size.x = std::max(max_line_size.x, size.x); 
        max_line_size.y = std::max(max_line_size.y, size.y); 
    }

    float constexpr SEPARATION_X = 5U;
    float constexpr SEPARATION_Y = 5U;

    vec2 pos, dir;

    std::tie(pos, dir) = point_and_derivative_in_middle_of_curved_arrow(from, mid, to);

    if (dir.x < 0.0f)
        dir = -dir;

    pos.x += SEPARATION_X;
    if (dir.y >= 0.0f)
        pos.y -= (float)edge_layout.text_lines.size() * max_line_size.y + SEPARATION_Y;
    else
        pos.y += SEPARATION_Y;

    Rect const text_rect{
            .left_top = pos,
            .right_bottom = pos + vec2{ max_line_size.x, max_line_size.y * (float)edge_layout.text_lines.size() }
            };

    Rect const wnd_rect = window_rect();
    if (!collision(make_rect_from_triangle(from, mid, to), wnd_rect) && !collision(text_rect, wnd_rect))
        return;

    ImU32 color;
    switch (edge_layout.type)
    {
        case EdgeLayout::CALL: color = IM_COL32(100, 200, 100, 255); break;
        case EdgeLayout::BRANCH_FALSE: color = IM_COL32(100, 100, 200, 255); break;
        case EdgeLayout::BRANCH_TRUE: color = IM_COL32(200, 100, 100, 255); break;
        case EdgeLayout::JUMP: color = IM_COL32(175, 175, 175, 255); break;
        default: UNREACHABLE(); break;
    }

    draw_arrow_curved(dl, from, mid, to, color, 1.0f);

    for (std::string const& line : edge_layout.text_lines)
    {
        dl.AddText(pos, color, line.data(), line.data() + line.size());
        pos.y += max_line_size.y;
    }
}


void RendererNavGraph::draw_node_tooltip(
        vec2 const& pos,
        FunctionLayout const& fn_layout,
        std::uint32_t node_index,
        NodeLayout const& node_layout
        ) const
{
    std::uint32_t hovered_line_index = 0U;
    {
        vec2 line_left_top = node_layout.origin - node_layout.half_size;
        for ( ; hovered_line_index != (std::uint32_t)node_layout.text_lines.size(); ++hovered_line_index)
        {
            float const line_height = ImGui::CalcTextSize(node_layout.text_lines.at(hovered_line_index).c_str()).y;
            Rect const line_rect{
                    .left_top = line_left_top,
                    .right_bottom = line_left_top + vec2{ 2.0f* node_layout.half_size.x, line_height }
                    };
            if (collision(line_rect, pos))
                break;
            line_left_top.y += line_height;
        }
        if (hovered_line_index == (std::uint32_t)node_layout.text_lines.size())
            return; // May happen only due to floating point imprecision. (So, happens almost never.)
    }

    if (hovered_line_index == 0U)
        return;

    sala::NavigationGraph::Node const& n = nav_graph().node(node_index);
    sala::Instruction const& instr =
            program().functions().at(n.function)
                     .basic_blocks().at(n.basic_block)
                     .instructions().at(n.instruction + 1U - nav_graph().num_instructions(node_index) + (hovered_line_index - 1U));
    if (instr.descriptors().empty())
        return;

    ImGui::BeginTooltip();
        if (ImGui::BeginTable("Vars info", 4U, ImGuiTableFlags_BordersH | ImGuiTableFlags_BordersV))
        {
            ImGui::TableNextRow();
            ImGui::TableSetColumnIndex(0); ImGui::Text("Desc");
            ImGui::TableSetColumnIndex(1); ImGui::Text("Idx");
            ImGui::TableSetColumnIndex(2); ImGui::Text("Size");
            ImGui::TableSetColumnIndex(3); ImGui::Text("BM/Value");

            for (std::uint32_t i = 0U; i != (std::uint32_t)instr.descriptors().size(); ++i)
            {
                ImGui::TableNextRow();

                ImGui::TableSetColumnIndex(0);
                ImGui::Text("%s", sala::instruction_descriptor_to_string(instr.descriptors().at(i)).c_str());
                
                ImGui::TableSetColumnIndex(1);
                ImGui::Text("%u", instr.operands().at(i));

                switch (instr.descriptors().at(i))
                {
                    case sala::Instruction::Descriptor::STATIC:
                        {
                            auto const& var = program().static_variables().at(instr.operands().at(i));
                            ImGui::TableSetColumnIndex(2);
                            ImGui::Text("%u", (std::uint32_t)var.num_bytes());
                            if (var.source_back_mapping().line != 0 || var.source_back_mapping().column != 0)
                            {
                                ImGui::TableSetColumnIndex(3);
                                ImGui::Text("%s", sala::source_back_mapping_to_string(var.source_back_mapping()).c_str());
                            }
                        }
                        break;
                    case sala::Instruction::Descriptor::LOCAL:
                        {
                            auto const& var = program().functions().at(n.function).local_variables().at(instr.operands().at(i));
                            ImGui::TableSetColumnIndex(2);
                            ImGui::Text("%u", (std::uint32_t)var.num_bytes());
                            if (var.source_back_mapping().line != 0 || var.source_back_mapping().column != 0)
                            {
                                ImGui::TableSetColumnIndex(3);
                                ImGui::Text("%s", sala::source_back_mapping_to_string(var.source_back_mapping()).c_str());
                            }
                        }
                        break;
                    case sala::Instruction::Descriptor::PARAMETER:
                        {
                            auto const& var = program().functions().at(n.function).parameters().at(instr.operands().at(i));
                            ImGui::TableSetColumnIndex(2);
                            ImGui::Text("%u", (std::uint32_t)var.num_bytes());
                            if (var.source_back_mapping().line != 0 || var.source_back_mapping().column != 0)
                            {
                                ImGui::TableSetColumnIndex(3);
                                ImGui::Text("%s", sala::source_back_mapping_to_string(var.source_back_mapping()).c_str());
                            }
                        }
                        break;
                    case sala::Instruction::Descriptor::CONSTANT:
                        {
                            auto const& cvar = program().constants().at(instr.operands().at(i));
                            ImGui::TableSetColumnIndex(2);
                            ImGui::Text("%u", (std::uint32_t)cvar.num_bytes());
                            ImGui::TableSetColumnIndex(3);
                            ImGui::Text("h[]: %s", sala::bytes_to_hex_string(cvar.bytes()).c_str());
                            {
                                ImGui::TableNextRow();
                                ImGui::TableSetColumnIndex(3);
                                std::string str{ cvar.bytes().begin(), cvar.bytes().end() };
                                if (str.size() > 50ULL)
                                    str.resize(50ULL);
                                ImGui::Text("c[]: %s", str.c_str());
                            }
                            if (cvar.num_bytes() == 1ULL)
                            {
                                ImGui::TableNextRow();
                                ImGui::TableSetColumnIndex(3);
                                ImGui::Text("i8: %d", (int)*(std::int8_t*)cvar.bytes().data());

                                ImGui::TableNextRow();
                                ImGui::TableSetColumnIndex(3);
                                ImGui::Text("u8: %d", (unsigned int)*(std::uint8_t*)cvar.bytes().data());
                            }
                            if (cvar.num_bytes() == 2ULL)
                            {
                                ImGui::TableNextRow();
                                ImGui::TableSetColumnIndex(3);
                                ImGui::Text("i16: %d", *(std::int16_t*)cvar.bytes().data());

                                ImGui::TableNextRow();
                                ImGui::TableSetColumnIndex(3);
                                ImGui::Text("u16: %d", *(std::uint16_t*)cvar.bytes().data());
                            }
                            else if (cvar.num_bytes() == 4ULL)
                            {
                                ImGui::TableNextRow();
                                ImGui::TableSetColumnIndex(3);
                                ImGui::Text("i32: %d", *(std::int32_t*)cvar.bytes().data());

                                ImGui::TableNextRow();
                                ImGui::TableSetColumnIndex(3);
                                ImGui::Text("u32: %d", *(std::uint32_t*)cvar.bytes().data());

                                ImGui::TableNextRow();
                                ImGui::TableSetColumnIndex(3);
                                ImGui::Text("f32: %e", (double)*(float*)cvar.bytes().data());
                            }
                            else if (cvar.num_bytes() == 8ULL)
                            {
                                ImGui::TableNextRow();
                                ImGui::TableSetColumnIndex(3);
                                ImGui::Text("i64: %lld", (long long int)*(std::int64_t*)cvar.bytes().data());

                                ImGui::TableNextRow();
                                ImGui::TableSetColumnIndex(3);
                                ImGui::Text("u64: %llu", (unsigned long long int)*(std::uint64_t*)cvar.bytes().data());

                                ImGui::TableNextRow();
                                ImGui::TableSetColumnIndex(3);
                                ImGui::Text("f64: %e", *(double*)cvar.bytes().data());
                            }
                        }
                        break;
                    case sala::Instruction::Descriptor::FUNCTION:
                        {
                            auto const& fn = program().functions().at(n.function);
                            ImGui::TableSetColumnIndex(2);
                            ImGui::Text("1");
                            if (fn.source_back_mapping().line != 0 || fn.source_back_mapping().column != 0)
                            {
                                ImGui::TableSetColumnIndex(3);
                                ImGui::Text("%s", sala::source_back_mapping_to_string(fn.source_back_mapping()).c_str());
                            }
                        }
                        break;
                    default: UNREACHABLE(); break;
                }
            }
            ImGui::EndTable();
        }
    ImGui::EndTooltip();
}


void RendererNavGraph::inter_costs_table_to_text(
        std::vector<std::string>& out_text_lines,
        sala::NavigationGraph::InterCosts::Table const& inter_costs
        ) const
{
    std::vector<std::uint32_t> sorted_callees;
    {
        for (auto it = inter_costs.begin(); it != inter_costs.end(); ++it)
            sorted_callees.push_back(it->first);
        std::sort(sorted_callees.begin(), sorted_callees.end());
    }

    std::stringstream sstr;
    std::uint32_t counter{ 0U };
    for (auto it = sorted_callees.begin(); it != sorted_callees.end(); ++it)
    {
        if (it != sorted_callees.begin())
            sstr << ", ";
        sstr << *it << ':' << inter_costs.at(*it);
        ++counter;
        if (counter == 5U)
        {
            out_text_lines.push_back(sstr.str());
            sstr.clear();
            counter = 0U;
        }
    }
    if (counter > 0U)
        out_text_lines.push_back(sstr.str());
}


void RendererNavGraph::clear_forces(std::uint32_t const fn_index)
{
    for (auto& idx_and_layout : m_function_layouts.at(fn_index).node_layouts)
        idx_and_layout.second.force = vec2::zero();
}


std::pair<vec2, float> compute_direction_and_dist(
        vec2 const& origin_1, vec2 const& half_sizes_1,
        vec2 const& origin_2, vec2 const& half_sizes_2,
        float halfsize_extension = 50.0f
        )
    {
        vec2 dir = origin_2 - origin_1;
        float const len = dir.length();
        if (len < 0.01f)
            dir = vec2::axis_y();
        else
            dir /= len;
        vec2 const ext{ halfsize_extension, halfsize_extension };
        float const i_rad = (half_sizes_1 + ext).length();
        float const j_rad = (half_sizes_2 + ext).length();
        return { dir, len - i_rad - j_rad };
    };


void RendererNavGraph::compute_forces(std::uint32_t const fn_index)
{
    float const VISCOUS_DRAG_COEFF = 0.5f;
    vec2 const GRAVITY_FORCE{ 0.0f, 10.0f };

    auto& fn_layouts{ m_function_layouts.at(fn_index) };

    std::uint32_t const begin_node_index = nav_graph().begin(fn_index);
    std::uint32_t const end_node_index = nav_graph().end(fn_index);
    for (std::uint32_t i = begin_node_index; i < end_node_index; ++i)
    {
        NodeLayout& i_layout{ fn_layouts.node_layouts.at(i) };
        for (std::uint32_t j = i + 1U; j < end_node_index; ++j)
        {
            NodeLayout& j_layout{ fn_layouts.node_layouts.at(j) };

            auto [dir, dist] = compute_direction_and_dist(
                i_layout.origin, i_layout.half_size,
                j_layout.origin, j_layout.half_size
                );
            if (dist > 0.0f)
                continue;

            vec2 force = -(10.0f * dist * dist) * dir;
            i_layout.force += force;
            j_layout.force -= force;
        }

        std::vector<std::uint32_t> j_nodes;
        if (nav_graph().is_call(i))
            j_nodes.push_back(nav_graph().bb_next(i));
        else
            j_nodes = nav_graph().successors(i);

        for (std::uint32_t const j : j_nodes)
        {
            NodeLayout& j_layout{ fn_layouts.node_layouts.at(j) };

            auto [dir, dist] = compute_direction_and_dist(
                i_layout.origin, i_layout.half_size,
                j_layout.origin, j_layout.half_size
                );
            if (dist < 0.0f)
                continue;
            vec2 force = (1.0f * dist) * dir;

            i_layout.force += force;
            j_layout.force -= force;
        }
    }

    for (std::uint32_t i = begin_node_index; i < end_node_index; ++i)
    {
        NodeLayout& i_layout{ fn_layouts.node_layouts.at(i) };
        i_layout.force += viscous_drag_force(i_layout.velocity, VISCOUS_DRAG_COEFF);
        i_layout.force += GRAVITY_FORCE;
    }
}


void RendererNavGraph::apply_forces(std::uint32_t const fn_index)
{
    float const MAX_SPEED = 1000.0f;
    float const dt = 1.0f / 60.0f; // 60 Hz. Moreover, we do not need real-time simulation.

    auto& fn_layouts{ m_function_layouts.at(fn_index) };
    std::uint32_t const begin_node_index = nav_graph().begin(fn_index);
    std::uint32_t const end_node_index = nav_graph().end(fn_index);

    vec2& root_velocity = fn_layouts.node_layouts.at(begin_node_index).velocity;

    for (auto& [ idx, layout ] : fn_layouts.node_layouts)
        layout.velocity += dt * layout.force;

    for (int round = 0; round < 5; ++round)
        for (std::uint32_t i = begin_node_index; i < end_node_index; ++i)
        {
            NodeLayout& i_layout{ fn_layouts.node_layouts.at(i) };
            for (std::uint32_t j = i + 1U; j < end_node_index; ++j)
            {
                NodeLayout& j_layout{ fn_layouts.node_layouts.at(j) };

                auto [dir, dist] = compute_direction_and_dist(
                    i_layout.origin, i_layout.half_size,
                    j_layout.origin, j_layout.half_size
                    );
                if (dist > 0.0f)
                    continue;
                root_velocity = vec2::zero();
                vec2 const dv = j_layout.velocity - i_layout.velocity;
                float dv_dot_dir = dv * dir;
                if (dv_dot_dir < 0.0f)
                {
                    vec2 const w = (0.5f * dv_dot_dir) * dir;
                    i_layout.velocity += w;
                    j_layout.velocity -= w;
                }
            }
        }

    root_velocity = vec2::zero();
    for (auto& [ _, layout ] : fn_layouts.node_layouts)
    {
        float const speed = layout.velocity.length();
        if (speed > MAX_SPEED)
            layout.velocity *= MAX_SPEED / speed;
        layout.origin += dt * layout.velocity;
    }
}


}
