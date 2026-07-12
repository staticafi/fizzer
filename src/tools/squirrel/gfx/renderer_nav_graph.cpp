#include <squirrel/gfx/renderer_nav_graph.hpp>
#include <utility/assumptions.hpp>
#include <utility/invariants.hpp>
#include <cstdint>

namespace gfx {


RendererNavGraph::RendererNavGraph(DataSources const* const  data_sources)
    : RendererBase{ data_sources }
    , split_x{ 300.0f }
    , selected_function{ 0U }
{}

void RendererNavGraph::next_frame()
{
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

    ImGui::BeginChild("RightPane", ImVec2(0, 0), true);
        ImDrawList* draw_list = ImGui::GetWindowDrawList();
        ImVec2 p = ImGui::GetCursorScreenPos();
        draw_list->AddLine(p, ImVec2(p.x + 200, p.y + 100), IM_COL32(255, 0, 0, 255), 2.0f);
    ImGui::EndChild();

    ImGui::PopStyleVar();
}


}
