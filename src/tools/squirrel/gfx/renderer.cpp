#include <squirrel/gfx/renderer.hpp>
#include <utility/assumptions.hpp>
#include <utility/invariants.hpp>
#include <cstdint>

namespace gfx {


Renderer::Renderer(DataSources const&  data_sources)
    : m_waiting_for_content{ true }
    , m_data{ data_sources }
    , m_nav_graph_renderer( &m_data )
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

    if (ImGui::BeginTabBar("RootTabs")) {
        if (ImGui::BeginTabItem("Controls")) {
            render_controls();
            ImGui::EndTabItem();
        }
        if (ImGui::BeginTabItem("NavGraph")) {
            m_nav_graph_renderer.next_frame();
            ImGui::EndTabItem();
        }
        if (ImGui::BeginTabItem("PathTree")) {
            render_path_tree();
            ImGui::EndTabItem();
        }
        if (ImGui::BeginTabItem("Solver")) {
            render_solver();
            ImGui::EndTabItem();
        }
        if (ImGui::BeginTabItem("CallGraph")) {
            render_call_graph();
            ImGui::EndTabItem();
        }
        ImGui::EndTabBar();
    }

    ImGui::End();
}


void Renderer::render_controls()
{
    ImGui::Text("TODO: Controls");
}


void Renderer::render_path_tree()
{
    ImGui::Text("TODO: PathTree");
}


void Renderer::render_solver()
{
    ImGui::Text("TODO: Solver");
}


void Renderer::render_call_graph()
{
    ImGui::Text("TODO: CallGraph");
}





}
