#include <squirrel/gfx/renderer_path_tree.hpp>
#include <squirrel/gfx/shape.hpp>
#include <utility/assumptions.hpp>
#include <utility/invariants.hpp>
#include <sstream>
#include <cstdint>
#include <algorithm>

namespace gfx {


RendererPathTree::RendererPathTree(DataSources const* const  data_sources)
    : RendererBase{ data_sources }
    , m_mouse_tracking{}
    , m_origin{ vec2::zero() }
    , m_node_layouts{}
{
}


void RendererPathTree::next_frame()
{
    Super::next_frame();

    ImGui::Text("TODO: PathTree");
}


void RendererPathTree::draw_node(
        ImDrawList& dl,
        std::uint32_t const node_index,
        NodeLayout const& node_layout
        ) const
{
}


void RendererPathTree::draw_edge(ImDrawList& dl) const
{
}


}
