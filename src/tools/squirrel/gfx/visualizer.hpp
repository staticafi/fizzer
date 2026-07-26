#ifndef TOOL_SQUIRREL_GFX_VISUALIZER_HPP_INCLUDED
#   define TOOL_SQUIRREL_GFX_VISUALIZER_HPP_INCLUDED

#   include <squirrel/gfx/data_sources.hpp>
#   include <utility/visualizer.hpp>

namespace gfx {


visualizer::ConstructorType get_visualizer_constructor(DataSources const& data);


}

#endif
