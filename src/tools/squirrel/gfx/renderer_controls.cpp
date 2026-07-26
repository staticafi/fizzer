#include <squirrel/gfx/renderer_controls.hpp>
#include <utility/visualizer_breakpoint.hpp>
#include <utility/assumptions.hpp>
#include <utility/invariants.hpp>
#include <sstream>
#include <cstdint>
#include <algorithm>

namespace gfx {


using namespace ::visualizer::detail;


RendererControls::RendererControls()
    : Super{}
    , m_waiting_for_content{ false }
    , m_target_breakpoint_id{ 0U }
    , m_breakpoint_texts{}
    , m_max_breakpoint_text_size{ 0U }
{}


void RendererControls::next_frame()
{
    Super::next_frame();

    ImGui::BeginChild("Controls", ImVec2(0, 0), true);
        m_waiting_for_content = false;

        update_breakpoint_infos();
        if (frame_count() == 1ULL)
        {}

        if (m_target_breakpoint_id > 0U && m_target_breakpoint_id != get_current_breakpoint_id() + 1U)
            m_waiting_for_content = true;
        else
        {
            ImGui::Text("Current breakpoint: %s", m_breakpoint_texts.at(get_current_breakpoint_id() + 1U).c_str());

            if (ImGui::Button("Step"))
                m_waiting_for_content = true;
            else
            {
                ImGui::SameLine();

                ImGui::SetNextItemWidth(m_max_breakpoint_text_size);
                if (ImGui::BeginCombo("Choose breakpoint", m_breakpoint_texts.at(m_target_breakpoint_id).c_str()))
                {
                    for (BreakPointID id = 0U; id != (BreakPointID)m_breakpoint_texts.size(); ++id)
                    {
                        bool is_selected = (m_target_breakpoint_id == id);
                        if (ImGui::Selectable(m_breakpoint_texts.at(id).c_str(), is_selected))
                            m_target_breakpoint_id = id;
                        if (is_selected)
                            ImGui::SetItemDefaultFocus();
                    }
                    ImGui::EndCombo();
                }
            }
        }
    ImGui::EndChild();
}


void RendererControls::update_breakpoint_infos()
{
    if ((BreakPointID)m_breakpoint_texts.size() == get_end_breakpoint_id() + 1U)
        return;

    m_breakpoint_texts.clear();
    m_max_breakpoint_text_size = 0.0f;

    m_breakpoint_texts.push_back("The nearest");
    m_max_breakpoint_text_size = std::fmax(m_max_breakpoint_text_size, ImGui::CalcTextSize(m_breakpoint_texts.back().c_str()).x);
    for (BreakPointID id = 0U; id != get_end_breakpoint_id(); ++id)
    {
        BreakPoint const& breakpoint = *get_breakpoint(id);
        std::stringstream sstr;
        sstr << breakpoint.func << '[' + std::to_string(breakpoint.line) << "] " << breakpoint.file;
        m_breakpoint_texts.push_back(sstr.str());
        m_max_breakpoint_text_size = std::fmax(m_max_breakpoint_text_size, ImGui::CalcTextSize(m_breakpoint_texts.back().c_str()).x);
    }
}


}
