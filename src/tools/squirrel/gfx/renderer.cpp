#include <squirrel/gfx/renderer.hpp>
#include <utility/visualizer_breakpoint.hpp>
#include <utility/assumptions.hpp>
#include <utility/invariants.hpp>
#include <cstdint>

namespace gfx {


Renderer::Renderer(DataSources const&  data_sources)
    : m_controls_renderer{ data_sources }
    , m_nav_graph_renderer{ data_sources }
    , m_path_tree_renderer{ data_sources }
    , m_data_tables_renderer{ data_sources }
    , m_call_graph_renderer{ data_sources }
{}


void Renderer::next_frame()
{
    ImGui::SetNextWindowPos(ImVec2(0, 0));
    ImGui::SetNextWindowSize(ImGui::GetIO().DisplaySize);
    ImGui::Begin(
        "FullScreenOverlay",
        nullptr,
        ImGuiWindowFlags_NoTitleBar | 
        ImGuiWindowFlags_NoResize | 
        ImGuiWindowFlags_NoMove | 
        ImGuiWindowFlags_NoScrollbar | 
        ImGuiWindowFlags_NoBackground | 
        ImGuiWindowFlags_NoBringToFrontOnFocus
        );

    if (ImGui::Shortcut(ImGuiMod_Ctrl | ImGuiKey_Space, ImGuiInputFlags_RouteGlobal))
        m_controls_renderer.request_resume_execution();

    if (!visualizer::is_execution_paused_on_breakpoint())
    {
        ImGui::BeginChild("Waiting for breakpoint hit", ImVec2(0, 0), true);
            ImGui::Text("Waiting till execution hits the chosen breakpoint...");
        ImGui::EndChild();
        ImGui::End();
        return;
    }

    if (m_data_changed)
    {
        m_data_changed = false;

        m_controls_renderer.on_data_changed();
        m_nav_graph_renderer.on_data_changed();
        m_path_tree_renderer.on_data_changed();
        m_data_tables_renderer.on_data_changed();
        m_call_graph_renderer.on_data_changed();
    }

    if (ImGui::BeginTabBar("RootTabs")) {
        if (ImGui::BeginTabItem("Controls")) {
            m_controls_renderer.update();
            ImGui::EndTabItem();
        }
        if (ImGui::BeginTabItem("NavGraph")) {
            m_nav_graph_renderer.update();
            ImGui::EndTabItem();
        }

        static bool first_round = true;
        if (ImGui::BeginTabItem("PathTree", nullptr, first_round ? ImGuiTabItemFlags_SetSelected : 0)) {
            m_path_tree_renderer.update();
            ImGui::EndTabItem();
        }
        first_round = false;

        if (ImGui::BeginTabItem("DataTables")) {
            m_data_tables_renderer.update();
            ImGui::EndTabItem();
        }
        if (ImGui::BeginTabItem("CallGraph")) {
            m_call_graph_renderer.update();
            ImGui::EndTabItem();
        }
        ImGui::EndTabBar();
    }

    ImGui::End();
}


}
