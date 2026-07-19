#include <squirrel/gfx/renderer_nav_graph.hpp>
#include <squirrel/gfx/shape.hpp>
#include <utility/assumptions.hpp>
#include <utility/invariants.hpp>
#include <cstdint>

namespace gfx {


RendererNavGraph::RendererNavGraph(DataSources const* const  data_sources)
    : RendererBase{ data_sources }
    , split_x{ 300.0f }
    , selected_function{ 0U }
    , mouse_tracking{}
    , m_function_node_layouts{}
{
    for (std::size_t fn_index = 0ULL; fn_index != nav_graph().lookups().size(); ++fn_index)
    {
        m_function_node_layouts.push_back(FunctionLayout{
            .origin = vec2::zero(),
            .node_layouts = {}
        });
        vec2 origin = vec2{ 25.0f, 0.0f };
        for (std::uint32_t bb_index = nav_graph().begin(fn_index), bb_end = nav_graph().end(fn_index); bb_index != bb_end; ++bb_index)
        {
            m_function_node_layouts.back().node_layouts[bb_index] = NodeLayout {
                .origin = origin,
                .half_size = vec2{ 15.0f, 10.0f },
                .velocity = vec2::zero(),
                .force = vec2::zero()
            };
            origin.x *= -1.0f;
            origin.y += 100.0f;
        }
    }
}

void RendererNavGraph::next_frame()
{
    Super::next_frame();

    ImGui::PushStyleVar(ImGuiStyleVar_ItemSpacing, ImVec2(0, 0));

    ImGui::BeginChild("LeftPane", ImVec2(split_x, 0), true);
        for (std::uint32_t i = 0; i < (std::uint32_t)program().functions().size(); ++i) {
            INVARIANT(i == data().program->functions().at(i).index());
            std::string const label = std::to_string(i) + ": " + program().functions().at(i).name();
            if (ImGui::Selectable(label.c_str(), selected_function == i)) {
                selected_function = i;
            }
        }
    ImGui::EndChild();

    ImGui::SameLine();
    ImGui::InvisibleButton("vsplitter", ImVec2(8.0f, -1)); // 8px wide
    if (ImGui::IsItemActive()) {
        split_x += ImGui::GetIO().MouseDelta.x; // Adjust size on drag
    }
    ImGui::SameLine();

    clear_forces(selected_function);
    compute_forces(selected_function);
    apply_forces(selected_function);

    ImGui::BeginChild("RightPane", ImVec2(0, 0), true);

        if (frame_count() == 1ULL)
            for (auto& fn_layout : m_function_node_layouts)
                fn_layout.origin = window_origin() + vec2{ window_size().x / 2.0f, 0.0f };

        ImDrawList& dl = *ImGui::GetWindowDrawList();
        FunctionLayout& fn_layout{ m_function_node_layouts.at(selected_function) };

        update_mouse_data();
        fn_layout.origin += mouse_tracking.delta;

        for (auto const& idx_and_layout : fn_layout.node_layouts)
            draw_node(dl, idx_and_layout.first);

        for (auto const& idx_and_layout : fn_layout.node_layouts)
        {
            auto const& succ_node_indices{ nav_graph().successors(idx_and_layout.first) };
            for (std::size_t i = 0ULL; i != succ_node_indices.size(); ++i)
                draw_edge(dl, idx_and_layout.first, i, succ_node_indices.size());
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


Rect RendererNavGraph::node_rect(std::uint32_t node_index, bool const local) const
{
    FunctionLayout const& fn_layout{ m_function_node_layouts.at(nav_graph().node(node_index).function) };
    NodeLayout const& node_layout{ fn_layout.node_layouts.at(node_index) };
    vec2 left_top{ node_layout.origin - node_layout.half_size };
    vec2 right_bottom{ node_layout.origin + node_layout.half_size };
    if (local)
        return Rect{ .left_top = left_top, .right_bottom = right_bottom };
    else
        return Rect{ .left_top = left_top + fn_layout.origin, .right_bottom = right_bottom + fn_layout.origin };
}


void RendererNavGraph::draw_node(ImDrawList& dl, std::uint32_t const node_index) const
{
    Rect rect{ node_rect(node_index) };
    dl.AddRectFilled(
        rect.left_top,
        rect.right_bottom,
        nav_graph().is_entry(node_index)  ? IM_COL32(75, 25, 55, 255) :
        nav_graph().is_ret(node_index)    ? IM_COL32(75, 55, 25, 255) :
        nav_graph().is_call(node_index)   ? IM_COL32(25, 75, 55, 255) :
                                            IM_COL32(75, 75, 75, 255) ,
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
    std::string text = std::to_string(node_index);
    dl.AddText(rect.left_top, IM_COL32(255, 255, 255, 255), text.data(), text.data() + text.size());
}


void RendererNavGraph::draw_edge(ImDrawList& dl, std::uint32_t const src_node_index, std::uint32_t const succ_index, std::size_t const succ_count) const
{
    Rect const src_rect{ node_rect(src_node_index ) };

    if (nav_graph().is_call(src_node_index))
    {
        std::uint32_t const succ_node_index{ nav_graph().bb_next(src_node_index) };
        Rect const dst_rect{ node_rect(succ_node_index) };
        auto [ from, to ] = nearest_points_of_rects(src_rect, dst_rect);
        draw_arrow(dl, from, to, IM_COL32(50, 200, 50, 255), 1.0f);
    }
    else
    {
        std::uint32_t const succ_node_index{ nav_graph().successors(src_node_index).at(succ_index) };
        Rect const dst_rect{ node_rect(succ_node_index) };
        auto [ from, to ] = nearest_points_of_rects(src_rect, dst_rect);
        draw_arrow(
                dl, from, to,
                succ_count == 1ULL ? IM_COL32(150, 150, 150, 255) :
                succ_index == 0U   ? IM_COL32(50, 50, 200, 255) :
                                     IM_COL32(200, 50, 50, 255) ,
                1.0f);
    }
}


void RendererNavGraph::clear_forces(std::uint32_t const fn_index)
{
    for (auto& idx_and_layout : m_function_node_layouts.at(fn_index).node_layouts)
        idx_and_layout.second.force = vec2::zero();
}


void RendererNavGraph::compute_forces(std::uint32_t const fn_index)
{
    float const NEUTRAL_DISTANCE = 50.0f;
    float const VISCOUS_DRAG_COEFF = 1.0f;
    vec2 const GRAVITY_FORCE{ 0.0f, 100.0f };

    auto& fn_layouts{ m_function_node_layouts.at(fn_index) };

    std::uint32_t const begin_node_index = nav_graph().begin(fn_index);
    std::uint32_t const end_node_index = nav_graph().end(fn_index);
    for (std::uint32_t i = begin_node_index; i < end_node_index; ++i)
    {
        NodeLayout& i_layout{ fn_layouts.node_layouts.at(i) };
        Rect const i_rect{ node_rect(i, true) };
        for (std::uint32_t j = i + 1U; j < end_node_index; ++j)
        {
            NodeLayout& j_layout{ fn_layouts.node_layouts.at(j) };
            Rect const j_rect{ node_rect(j, true) };
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

        Rect const src_rect{ node_rect(src_node_index, true) };
        for (std::uint32_t const dst_node_index : dst_node_indices)
        {
            NodeLayout& dst_layout{ fn_layouts.node_layouts.at(dst_node_index) };
            Rect const dst_rect{ node_rect(dst_node_index, true) };
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
    entry_layout.force += snap_constraint_force(node_rect(begin_node_index, true), vec2::zero());
}


void RendererNavGraph::apply_forces(std::uint32_t const fn_index)
{
    float const MAX_SPEED = 500.0f;
    float const dt = 1.0f / 60.0f; // 60 Hz. Moreover, we do not need real-time simulation.
    for (auto& [ _, layout ] : m_function_node_layouts.at(fn_index).node_layouts)
    {
        layout.velocity += dt * layout.force;
        float const speed = layout.velocity.length();
        if (speed > MAX_SPEED)
            layout.velocity *= MAX_SPEED / speed;
        layout.origin += dt * layout.velocity;
    }
}


}
