#ifndef TOOL_SQUIRREL_GFX_DATA_SOURCES_HPP_INCLUDED
#   define TOOL_SQUIRREL_GFX_DATA_SOURCES_HPP_INCLUDED

#   include <sala/program.hpp>
#   include <sala/call_graph.hpp>
#   include <sala/navigation_graph.hpp>
#   include <chickaree/path_tree.hpp>
#   include <chickaree/solver.hpp>

namespace gfx {


struct  DataSources
{
    sala::Program const*  program;
    sala::CallGraph const*  call_graph;
    sala::NavigationGraph const*  nav_graph;
    chickaree::PathTree const*  tree;
    chickaree::Solver const*  solver;
};


}

#endif
