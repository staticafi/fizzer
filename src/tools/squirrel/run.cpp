#include <squirrel/program_info.hpp>
#include <squirrel/program_options.hpp>
#include <squirrel/gfx/visualizer.hpp>
#include <sala/program.hpp>
#include <sala/streaming.hpp>
#include <sala/call_graph.hpp>
#include <sala/navigation_graph.hpp>
#include <chickaree/solver.hpp>
#include <chickaree/path.hpp>
#include <chickaree/path_tree.hpp>
#include <chickaree/path_executor.hpp>
#include <chickaree/strategy.hpp>
#include <cps/solver.hpp>
#include <cps/evaluation_cache.hpp>
#include <utility/basic_numeric_types.hpp>
#include <utility/assumptions.hpp>
#include <iostream>
#include <fstream>
#include <chrono>
#include <filesystem>
#include <memory>


void run(int argc, char* argv[])
{
    std::chrono::system_clock::time_point const  start_time_point = std::chrono::system_clock::now();

    if (!get_program_options()->has("sala"))
    {
        std::cerr << "ERROR: Missing path to a sala program.\n";
        return;
    }
    std::filesystem::path sala_path = std::filesystem::absolute(get_program_options()->value("sala"));
    if (!std::filesystem::is_regular_file(sala_path))
    {
        std::cerr << "ERROR: The passed sala program '" << sala_path << "' does not reference a regular file.\n";

    }

    std::filesystem::path temp_dir = std::filesystem::absolute(get_program_options()->value("tmp"));
    {
        std::error_code  ec;
        std::filesystem::create_directories(temp_dir, ec);
        if (ec)
        {
            std::cerr << "ERROR: Failed to create/access the temp directory:\n        " << temp_dir << "\n";
            return;
        }
    }

    std::filesystem::path output_dir = std::filesystem::absolute(get_program_options()->value("out"));
    {
        std::error_code  ec;
        std::filesystem::create_directories(output_dir, ec);
        if (ec)
        {
            std::cerr << "ERROR: Failed to create/access the output directory:\n        " << output_dir << "\n";
            return;
        }
    }

    std::shared_ptr<sala::Program> sala_program_ptr;
    {
        sala_program_ptr = std::make_shared<sala::Program>();
        std::ifstream istr(sala_path.c_str(), std::ios_base::binary);
        istr >> *sala_program_ptr;
    }

    std::size_t  fn_index{ sala_program_ptr->functions().size() };
    for (std::size_t  i = 0UL; i < sala_program_ptr->functions().size(); ++i)
        if (sala_program_ptr->functions().at(i).name() == get_program_options()->value("fn"))
        {
            fn_index = i;
            break;
        }
    if (fn_index == sala_program_ptr->functions().size())
    {
        std::cerr << "ERROR: Function '" << get_program_options()->value("fn") << "' is not in the passed sala program.\n";
        return;
    }
    std::size_t const  bb_index{ (std::size_t)std::stoi(get_program_options()->value("bb")) };
    if (bb_index >= sala_program_ptr->functions().at(fn_index).basic_blocks().size())
    {
        std::cerr << "ERROR: Basic block '" << get_program_options()->value("bb")
                  << "' is not in the function '" << get_program_options()->value("fn") << "'.\n";
        return;
    }
    double const  timeout_seconds{ (double)std::stoi(get_program_options()->value("timeout")) };
    if (timeout_seconds < 0.0)
    {
        std::cerr << "ERROR: Negative timeout is not allowed.\n";
        return;
    }
    std::size_t const  memout_bytes{ (std::size_t)std::stoull(get_program_options()->value("memout")) };

    sala::CallGraph const  call_graph = sala::make_call_graph(*sala_program_ptr);
    sala::NavigationGraph const  nav_graph{ *sala_program_ptr, call_graph };
    chickaree::PathTree  tree{ nav_graph.entry(sala_program_ptr->entry_function()) };
    chickaree::Solver  solver{ *sala_program_ptr, nav_graph, tree };

    if (get_program_options()->has("gfx"))
        gfx::create_visualizer(gfx::DataSources{
            .program = &*sala_program_ptr,
            .call_graph = &call_graph,
            .nav_graph = &nav_graph,
            .tree = &tree,
            .solver = &solver
        });

    solver.run(
            (std::uint32_t)fn_index,
            (std::uint32_t)bb_index,
            timeout_seconds - std::chrono::duration<double>(std::chrono::system_clock::now() - start_time_point).count(),
            (std::int64_t)memout_bytes
            );
    if (solver.success())
    {
        std::cout << "SUCCESS: A feasible path was found:\n";
        for (std::uint32_t const  graph_node_index : solver.path())
        {
            sala::NavigationGraph::Node const&  n{ nav_graph.node(graph_node_index) };
            std::cout << n.function << ", "  << n.basic_block << '\n';
        }
    }
    else
    {
        std::cout << "FAILURE: No feasible path to the specified basic block was found.";
        if (solver.report().timeout)
            std::cout << "CAUSE: Timeout.";
        if (solver.report().memout)
            std::cout << "CAUSE: Out of memory.";
        if (solver.report().cps_failure)
            std::cout << "CAUSE: Failed to solve a coverage problem.";
    }

    gfx::visualize();
    gfx::destroy_visualizer();
}
