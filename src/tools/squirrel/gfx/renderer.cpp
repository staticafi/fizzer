#include <squirrel/gfx/renderer.hpp>
#include <utility/assumptions.hpp>
#include <utility/invariants.hpp>
#include <cstdint>

namespace gfx {


Renderer::Renderer(DataSources const&  data_sources)
    : m_waiting_for_content{ true }
    , m_first_round{ true }
    , m_data_updated{ true }
    , m_data{ data_sources }
    , m_controls_renderer{}
    , m_nav_graph_renderer( &m_data )
    , m_path_tree_renderer{ &m_data }
{}


void Renderer::set_waiting_for_content(bool const state)
{
    if (m_waiting_for_content && !state)
        m_data_updated = true;
    m_waiting_for_content = state;
}


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

    if (is_waiting_for_content())
    {
        ImGui::BeginChild("Waiting for content", ImVec2(0, 0), true);
            ImGui::Text("Waiting for content...");
        ImGui::EndChild();
        return;
    }

    if (ImGui::BeginTabBar("RootTabs")) {
        if (ImGui::BeginTabItem("Controls")) {
            next_frame(m_controls_renderer);
            ImGui::EndTabItem();
        }
        if (ImGui::BeginTabItem("NavGraph")) {
            next_frame(m_nav_graph_renderer);
            ImGui::EndTabItem();
        }
        if (ImGui::BeginTabItem("PathTree", nullptr, m_first_round ? ImGuiTabItemFlags_SetSelected : 0)) {
            next_frame(m_path_tree_renderer);
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

    m_first_round = false;
    m_data_updated = false;
}


void Renderer::next_frame(RendererBase& renderer)
{
    if (m_data_updated)
        renderer.on_data_updated();
    renderer.next_frame();
    if (renderer.is_waiting_for_content())
        set_waiting_for_content(true);
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
