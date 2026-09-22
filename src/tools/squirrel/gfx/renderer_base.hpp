#ifndef TOOL_SQUIRREL_GFX_RENDERER_BASE_HPP_INCLUDED
#   define TOOL_SQUIRREL_GFX_RENDERER_BASE_HPP_INCLUDED

#   include <squirrel/gfx/math.hpp>
#   include <squirrel/gfx/data_sources.hpp>
#   include <cstdint>

namespace gfx {

    
struct Renderer;


struct  RendererBase
{
    RendererBase(DataSources const&  data_sources);
    virtual ~RendererBase() {}

    DataSources const&  data() const { return m_data; }
    sala::Program const&  program() const { return *data().program; }
    sala::CallGraph const&  call_graph() const { return *data().call_graph; }
    sala::NavigationGraph const&  nav_graph() const { return *data().nav_graph; }
    chickaree::PathTree const&  tree() const { return *data().tree; }
    chickaree::Solver const&  solver() const { return *data().solver; }

    vec2 window_origin() const; // Left top corner.
    vec2 window_size() const; // Width and height.
    Rect window_rect() const;

    std::uint64_t frame_count() const { return m_frame_count; }

    void request_resume_execution();

    virtual void initialize() {}
    virtual void next_frame() {}
    virtual void on_data_changed() {}

private:

    void update();

    friend struct Renderer;

    DataSources  m_data;
    std::uint64_t m_frame_count;
};


}

#endif
