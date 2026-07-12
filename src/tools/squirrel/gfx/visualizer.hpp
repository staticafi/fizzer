#ifndef TOOL_SQUIRREL_GFX_VISUALIZER_HPP_INCLUDED
#   define TOOL_SQUIRREL_GFX_VISUALIZER_HPP_INCLUDED

#   include <squirrel/gfx/data_sources.hpp>

namespace gfx {


void  create_visualizer(DataSources const& data);
void  destroy_visualizer();

void  visualize();


}

#endif
