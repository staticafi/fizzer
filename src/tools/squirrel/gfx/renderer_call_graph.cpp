#include <squirrel/gfx/renderer_call_graph.hpp>
#include <squirrel/gfx/shape.hpp>
#include <sala/streaming.hpp>
#include <sala/streaming_utils.hpp>
#include <utility/assumptions.hpp>
#include <utility/invariants.hpp>
#include <unordered_set>
#include <sstream>
#include <deque>
#include <cstdint>
#include <algorithm>

namespace gfx {


RendererCallGraph::RendererCallGraph(DataSources const* const  data_sources)
    : Super{ data_sources }
    , m_mouse_tracking{}
    , m_origin{ vec2::zero() }
    , m_node_layouts{}
    , m_edge_layouts{}
{

}

void RendererCallGraph::next_frame()
{
    Super::next_frame();

    ImGui::BeginChild("CG canvas", ImVec2(0, 0), true);
        ImGui::Text("TODO callgraph.");
    ImGui::EndChild();
}


}
