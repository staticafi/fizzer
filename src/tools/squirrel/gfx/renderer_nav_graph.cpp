#include <squirrel/gfx/renderer_nav_graph.hpp>
#include <squirrel/gfx/shape.hpp>
#include <sala/streaming.hpp>
#include <utility/assumptions.hpp>
#include <utility/invariants.hpp>
#include <sstream>
#include <deque>
#include <cstdint>
#include <algorithm>

namespace gfx {


RendererNavGraph::RendererNavGraph(DataSources const* const  data_sources)
    : RendererBase{ data_sources }
    , split_x{ 300.0f }
    , selected_function{ data_sources->program->entry_function() }
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

        struct IndexAndDepth
        {
            std::uint32_t node_index;
            vec2 pos;
            float size;
        };

        float const height = std::log2f(nav_graph().lookup(fn_index).end - nav_graph().lookup(fn_index).begin);
        float const leaves = std::pow(2.0f, height);
        float const size = leaves * (400.0f + 50.0f);

        std::deque<IndexAndDepth> queue{ IndexAndDepth{
                .node_index = nav_graph().begin(fn_index),
                .pos{ 0.0f, 0.0f },
                .size = size
                } };
        do
        {
            IndexAndDepth const item = queue.front();
            queue.pop_front();

            //  We create only empty layout for the node. We fill the layout
            // later (we cannot do it here, because we can get here repeatedly).
            // Here here we only set origin to position of the last related
            // item in the queue. 
            m_function_layouts.back().node_layouts.insert({ item.node_index, {} }).first->second.origin = item.pos;

            // Adding successor nodes do the queue.

            std::vector<std::uint32_t> succ_node_indices;
            if (nav_graph().is_call(item.node_index))
                succ_node_indices.push_back(nav_graph().bb_next(item.node_index));
            else
                succ_node_indices = nav_graph().successors(item.node_index);

            if (succ_node_indices.empty())
                continue;
            float dx = item.size / (float)succ_node_indices.size();
            float x = item.pos.x + (succ_node_indices.size() == 1ULL ? 0.0 : -item.size / 2.0f + dx / 2.0f);
            for (std::uint32_t const succ_node_index : succ_node_indices)
            {
                //  We create only empty layout for the edge. We fill the layout
                // later (we cannot do it here, because we can get here repeatedly).
                m_function_layouts.back().edge_layouts.insert({ {item.node_index, succ_node_index}, {} });

                queue.push_back(IndexAndDepth{
                        .node_index = succ_node_index,
                        .pos{ x, item.pos.y + 200.0f },
                        .size = item.size / 2.0f
                        });
                x += dx;
            }
        }
        while (!queue.empty());

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

                std::vector<std::uint32_t> sorted_callees;
                {
                    sala::NavigationGraph::InterCosts::Table const& inter_costs = nav_graph().inter_cost_from_call(node_index);
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
                    sstr << *it << ':' << nav_graph().inter_cost_from_call(node_index, *it);
                    ++counter;
                    if (counter == 5U)
                    {
                        edge_layout.text_lines.push_back(sstr.str());
                        sstr.clear();
                        counter = 0U;
                    }
                }
                if (counter > 0U)
                    edge_layout.text_lines.push_back(sstr.str());
            }
        }
    }
}

void RendererNavGraph::next_frame()
{
    Super::next_frame();

    ImGui::PushStyleVar(ImGuiStyleVar_ItemSpacing, ImVec2(0, 0));

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
        for (std::uint32_t i = 0; i < (std::uint32_t)program().functions().size(); ++i) {
            INVARIANT(i == data().program->functions().at(i).index());
            std::string const label = std::to_string(i) + ": " + program().functions().at(i).name();

            bool is_color_style_pushed = false;
            if (i == 0U)
            {
                ImGui::PushStyleColor(ImGuiCol_Text, special_functions_colors[0]);
                is_color_style_pushed = true;
            }
            else if (i == program().entry_function())
            {
                ImGui::PushStyleColor(ImGuiCol_Text, special_functions_colors[1]);
                is_color_style_pushed = true;
            }
            else if (external_functions.contains(i))
            {
                ImGui::PushStyleColor(ImGuiCol_Text, special_functions_colors[2]);
                is_color_style_pushed = true;
            }

            if (ImGui::Selectable(label.c_str(), selected_function == i)) {
                selected_function = i;
            }

            if (is_color_style_pushed)
                ImGui::PopStyleColor();
        }
    }
    ImGui::EndChild();

    ImGui::SameLine();
    {
        ImGui::InvisibleButton("vsplitter", ImVec2(8.0f, -1)); // 8px wide
        if (ImGui::IsItemActive()) {
            split_x += ImGui::GetIO().MouseDelta.x; // Adjust size on drag
        }
    }
    ImGui::SameLine();

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
                fn_layout.origin = window_origin() + vec2{ window_size().x / 2.0f, window_size().x / 4.0f };
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
            }
        }

        ImDrawList& dl = *ImGui::GetWindowDrawList();
        FunctionLayout& fn_layout{ m_function_layouts.at(selected_function) };

        update_mouse_data();
        fn_layout.origin += mouse_tracking.delta;

        for (auto const& idx_and_layout : fn_layout.node_layouts)
            draw_node(dl, fn_layout, idx_and_layout.first, idx_and_layout.second);

        for (auto const& id_and_layout : fn_layout.edge_layouts)
            draw_edge(dl, fn_layout, id_and_layout.first, id_and_layout.second);
    }
    ImGui::EndChild();

    ImGui::PopStyleVar();
}


void RendererNavGraph::update_mouse_data()
{
    if (!ImGui::IsWindowHovered())
    {
        mouse_tracking = {};
        return;
    }

    ImGuiIO& io = ImGui::GetIO();
    vec2 const pos = io.MousePos;
    bool const down = io.MouseDown[1];

    if (!mouse_tracking.is_valid)
    {
        mouse_tracking.is_valid = true;
        mouse_tracking.last_pos = pos;
        mouse_tracking.is_right_button_down = down;
        mouse_tracking.delta = vec2::zero();
        return;
    }

    if (mouse_tracking.is_right_button_down)
        mouse_tracking.delta = pos - mouse_tracking.last_pos;
    else
        mouse_tracking.delta = vec2::zero();

    mouse_tracking.last_pos = pos;
    mouse_tracking.is_right_button_down = down;
}


Rect RendererNavGraph::node_rect(std::uint32_t const node_index) const
{
    FunctionLayout const& fn_layout{ m_function_layouts.at(nav_graph().node(node_index).function) };
    NodeLayout const& node_layout{ fn_layout.node_layouts.at(node_index) };
    vec2 const left_top{ node_layout.origin - node_layout.half_size };
    vec2 const right_bottom{ node_layout.origin + node_layout.half_size };
    return Rect{ .left_top = left_top + fn_layout.origin, .right_bottom = right_bottom + fn_layout.origin };
}


Rect RendererNavGraph::node_rect_local(std::uint32_t node_index, float const extent) const
{
    FunctionLayout const& fn_layout{ m_function_layouts.at(nav_graph().node(node_index).function) };
    NodeLayout const& node_layout{ fn_layout.node_layouts.at(node_index) };
    vec2 const left_top{ node_layout.origin - node_layout.half_size };
    vec2 const right_bottom{ node_layout.origin + node_layout.half_size };
    return Rect{ .left_top = left_top - vec2{ extent, extent }, .right_bottom = right_bottom + vec2{ extent, extent } };
}


void RendererNavGraph::draw_node(
        ImDrawList& dl,
        FunctionLayout const& fn_layout,
        std::uint32_t const node_index,
        NodeLayout const& node_layout
        ) const
{
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

    Rect rect{ node_rect(node_index) };
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
    auto [ from, to ] = nearest_points_of_rects(node_rect(edge_id.first), node_rect(edge_id.second));

    ImU32 color;
    switch (edge_layout.type)
    {
        case EdgeLayout::CALL: color = IM_COL32(100, 200, 100, 255); break;
        case EdgeLayout::BRANCH_FALSE: color = IM_COL32(100, 100, 200, 255); break;
        case EdgeLayout::BRANCH_TRUE: color = IM_COL32(200, 100, 100, 255); break;
        case EdgeLayout::JUMP: color = IM_COL32(175, 175, 175, 255); break;
        default: UNREACHABLE(); break;
    }

    draw_arrow(dl, from, to, color, 1.0f);

    float max_line_height = 0.0f;
    for (std::string const& line : edge_layout.text_lines)
    {
        vec2 const size = ImGui::CalcTextSize(line.c_str());
        max_line_height = std::max(max_line_height, size.y);
    }

    float constexpr SEPARATION_X = 5U;
    float constexpr SEPARATION_Y = 5U;

    vec2 dir = to - from;
    if (dir.x < 0.0f)
        dir = -dir;

    vec2 pos{ avg(from, to) };
    pos.x += SEPARATION_X;
    if (dir.y >= 0.0f)
        pos.y -= (float)edge_layout.text_lines.size() * max_line_height + SEPARATION_Y;
    else
        pos.y += SEPARATION_Y;

    for (std::string const& line : edge_layout.text_lines)
    {
        dl.AddText(pos, color, line.data(), line.data() + line.size());
        pos.y += max_line_height;
    }
}


void RendererNavGraph::clear_forces(std::uint32_t const fn_index)
{
    for (auto& idx_and_layout : m_function_layouts.at(fn_index).node_layouts)
        idx_and_layout.second.force = vec2::zero();
}


void RendererNavGraph::compute_forces(std::uint32_t const fn_index)
{
    float const NEUTRAL_DISTANCE = 50.0f;
    float const VISCOUS_DRAG_COEFF = 1.0f;
    vec2 const GRAVITY_FORCE{ 0.0f, 100.0f };

    auto& fn_layouts{ m_function_layouts.at(fn_index) };

    std::uint32_t const begin_node_index = nav_graph().begin(fn_index);
    std::uint32_t const end_node_index = nav_graph().end(fn_index);
    for (std::uint32_t i = begin_node_index; i < end_node_index; ++i)
    {
        NodeLayout& i_layout{ fn_layouts.node_layouts.at(i) };
        Rect const i_rect{ node_rect_local(i, 0.5f * NEUTRAL_DISTANCE) };
        for (std::uint32_t j = i + 1U; j < end_node_index; ++j)
        {
            NodeLayout& j_layout{ fn_layouts.node_layouts.at(j) };
            Rect const j_rect{ node_rect_local(j, 0.5f * NEUTRAL_DISTANCE) };
            vec2 const force = collision_constraint_force(i_rect, j_rect);
            i_layout.force += force;
            j_layout.force -= force;
        }
    }

    for (auto& idx_and_layout : fn_layouts.node_layouts)
    {
        std::uint32_t const src_node_index{ idx_and_layout.first };
        NodeLayout& src_layout{ idx_and_layout.second };

        std::vector<std::uint32_t> dst_node_indices;
        if (nav_graph().is_call(src_node_index))
            dst_node_indices.push_back(nav_graph().bb_next(src_node_index));
        else
            dst_node_indices = nav_graph().successors(src_node_index);

        Rect const src_rect{ node_rect_local(src_node_index) };
        for (std::uint32_t const dst_node_index : dst_node_indices)
        {
            NodeLayout& dst_layout{ fn_layouts.node_layouts.at(dst_node_index) };
            Rect const dst_rect{ node_rect_local(dst_node_index) };
            vec2 const force = distance_constraint_force(src_rect, dst_rect, NEUTRAL_DISTANCE);

            src_layout.force += force;
            dst_layout.force -= force;
        }

        src_layout.force += viscous_drag_force(src_layout.velocity, VISCOUS_DRAG_COEFF);
        src_layout.force += GRAVITY_FORCE;
    }

    for (std::uint32_t i = begin_node_index; i < end_node_index; ++i)
    {
        NodeLayout& i_layout{ fn_layouts.node_layouts.at(i) };
        i_layout.force += viscous_drag_force(i_layout.velocity, VISCOUS_DRAG_COEFF);
        i_layout.force += GRAVITY_FORCE;
    }

    NodeLayout& entry_layout{ fn_layouts.node_layouts.at(begin_node_index) };
    entry_layout.force += snap_constraint_force(node_rect_local(begin_node_index), vec2::zero());
}


void RendererNavGraph::apply_forces(std::uint32_t const fn_index)
{
    float const MAX_SPEED = 100.0f;
    float const dt = 1.0f / 60.0f; // 60 Hz. Moreover, we do not need real-time simulation.
    for (auto& [ _, layout ] : m_function_layouts.at(fn_index).node_layouts)
    {
        layout.velocity += dt * layout.force;
        float const speed = layout.velocity.length();
        if (speed > MAX_SPEED)
            layout.velocity *= MAX_SPEED / speed;
        layout.origin += dt * layout.velocity;
    }
}


}
