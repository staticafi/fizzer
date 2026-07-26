#ifndef TOOL_SQUIRREL_GFX_RENDERER_CONTROLS_HPP_INCLUDED
#   define TOOL_SQUIRREL_GFX_RENDERER_CONTROLS_HPP_INCLUDED

#   include <squirrel/gfx/renderer_base.hpp>
#   include <squirrel/gfx/visualizer_breakpoint.hpp>
#   include <squirrel/gfx/mouse_tracking.hpp>
#   include <squirrel/gfx/math.hpp>
#   include <imgui.h>
#   include <vector>
#   include <string>
#   include <cstdint>

namespace gfx {


struct  RendererControls : public RendererBase
{
    using Super = RendererBase;

    RendererControls();

    void next_frame() override;

    bool is_waiting_for_content() override { return m_waiting_for_content; }

private:

    void update_breakpoint_infos();

    bool m_waiting_for_content;
    detail::BreakPointID m_target_breakpoint_id;
    std::vector<std::string> m_breakpoint_texts;
    float m_max_breakpoint_text_size;
};


}

#endif
