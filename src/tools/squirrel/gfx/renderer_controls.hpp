#ifndef TOOL_SQUIRREL_GFX_RENDERER_CONTROLS_HPP_INCLUDED
#   define TOOL_SQUIRREL_GFX_RENDERER_CONTROLS_HPP_INCLUDED

#   include <squirrel/gfx/renderer_base.hpp>
#   include <squirrel/gfx/mouse_tracking.hpp>
#   include <squirrel/gfx/math.hpp>
#   include <utility/visualizer_breakpoint.hpp>
#   include <imgui.h>
#   include <vector>
#   include <string>
#   include <cstdint>

namespace gfx {


struct  RendererControls : public RendererBase
{
    using Super = RendererBase;

    RendererControls(DataSources const&  data_sources);

    void next_frame() override;
    void on_data_changed() override;

    void request_resume_execution() const;

private:

    void update_breakpoint_infos();

    ::visualizer::BreakPointID m_current_breakpoint_id;
    ::visualizer::BreakPointID m_selected_breakpoint_id;
    std::vector<std::string> m_breakpoint_texts;
    float m_max_breakpoint_text_size;
};


}

#endif
