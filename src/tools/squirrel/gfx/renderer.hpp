#ifndef TOOL_SQUIRREL_GFX_RENDERER_HPP_INCLUDED
#   define TOOL_SQUIRREL_GFX_RENDERER_HPP_INCLUDED

namespace gfx {


struct  Renderer
{
    void set_waiting_for_content(bool const state) { m_waiting_for_content = state; }
    bool is_waiting_for_content() const { return m_waiting_for_content; }

    void next_frame();

private:

    bool m_waiting_for_content;
};


}

#endif
