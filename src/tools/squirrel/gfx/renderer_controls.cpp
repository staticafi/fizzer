#include <squirrel/gfx/renderer_controls.hpp>
#include <utility/assumptions.hpp>
#include <utility/invariants.hpp>
#include <sstream>
#include <cstdint>
#include <algorithm>

namespace gfx {


namespace vis = ::visualizer;


RendererControls::RendererControls(DataSources const&  data_sources)
    : Super{ data_sources }
    , m_current_breakpoint_id{ 0U }
    , m_selected_breakpoint_id{ 0U }
    , m_breakpoint_texts{}
    , m_max_breakpoint_text_size{ 0U }
{}


void RendererControls::next_frame()
{
    Super::next_frame();

    ImGui::BeginChild("Controls", ImVec2(0, 0), ImGuiChildFlags_Borders);

        update_breakpoint_infos();

        ImGui::Text("Current breakpoint: %s", m_breakpoint_texts.at(m_current_breakpoint_id).c_str());

        if (ImGui::Button("Step"))
            request_resume_execution();

        if (ImGui::IsItemHovered(ImGuiHoveredFlags_DelayShort)) 
        {
            ImGui::BeginTooltip();
            ImGui::Text("Ctrl+Space");
            ImGui::EndTooltip();
        }

        ImGui::SameLine();

        ImGui::SetNextItemWidth(m_max_breakpoint_text_size);
        if (ImGui::BeginCombo("Choose breakpoint", m_breakpoint_texts.at(m_selected_breakpoint_id).c_str()))
        {
            for (vis::BreakPointID id = 0U; id != (vis::BreakPointID)m_breakpoint_texts.size(); ++id)
            {
                bool is_selected = (m_selected_breakpoint_id == id);
                if (ImGui::Selectable(m_breakpoint_texts.at(id).c_str(), is_selected))
                    m_selected_breakpoint_id = id;
                if (is_selected)
                    ImGui::SetItemDefaultFocus();
            }
            ImGui::EndCombo();
        }
    ImGui::EndChild();
}


void RendererControls::on_data_changed()
{
    m_current_breakpoint_id = vis::get_target_breakpoint_id();
}


void RendererControls::request_resume_execution() const
{
    vis::set_target_breakpoint_id(m_selected_breakpoint_id);
    vis::request_resume_execution();
}


void RendererControls::update_breakpoint_infos()
{
    if ((vis::BreakPointID)m_breakpoint_texts.size() == vis::get_num_registered_breakpoints() + 1U)
        return;

    m_breakpoint_texts.clear();
    m_max_breakpoint_text_size = 0.0f;

    m_breakpoint_texts.push_back("The nearest");
    m_max_breakpoint_text_size = std::fmax(m_max_breakpoint_text_size, ImGui::CalcTextSize(m_breakpoint_texts.back().c_str()).x);
    for (vis::BreakPointID id = 1U; id <= vis::get_num_registered_breakpoints(); ++id)
    {
        vis::BreakPoint const& breakpoint = *vis::get_registered_breakpoint(id);
        std::stringstream sstr;
        sstr << breakpoint.func << " [line: " + std::to_string(breakpoint.line) << "] " << breakpoint.file;
        m_breakpoint_texts.push_back(sstr.str());
        m_max_breakpoint_text_size = std::fmax(m_max_breakpoint_text_size, ImGui::CalcTextSize(m_breakpoint_texts.back().c_str()).x);
    }
}


}
