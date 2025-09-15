#include <cpseval/program_info.hpp>
#include <cpseval/program_options.hpp>
#include <cpseval/load_tests.hpp>
#include <fuzzing/target_executor.hpp>
#include <fuzzing/branching_node.hpp>
#include <sala/program.hpp>
#include <sala/streaming.hpp>
#include <com/mut_type.hpp>
#include <iostream>
#include <filesystem>
#include <fstream>
#include <memory>


void run(int argc, char* argv[])
{
    if (!get_program_options()->has("path_to_target")) {
        std::cerr << "ERROR: The path to target is empty.\n";
        return;
    }
    if (!std::filesystem::is_regular_file(get_program_options()->value("path_to_target")))
    {
        std::cerr << "ERROR: The passed target path '"
                    << get_program_options()->value("path_to_target")
                    << "' does not reference a regular file.\n";
        return;
    }
    std::filesystem::perms const perms = std::filesystem::status(get_program_options()->value("path_to_target")).permissions();
    if ((perms & std::filesystem::perms::owner_exec) == std::filesystem::perms::none)
    {
        std::cerr << "ERROR: The passed target path '"
                    << get_program_options()->value("path_to_target")
                    << "' references a file which is NOT executable.\n";
        return;
    }

    if (!std::filesystem::is_regular_file(get_program_options()->value("path_to_tests")))
    {
        std::cerr << "ERROR: The passed path '"
                    << get_program_options()->value("path_to_tests")
                    << "' to a ZIP file with a test-suite does not reference a regular file.\n";
        return;
    }

    std::shared_ptr<sala::Program> sala_program_ptr;
    {
        std::filesystem::path  sala_program_path;
        if (get_program_options()->has("path_to_sala"))
            sala_program_path = get_program_options()->value("path_to_sala");
        else if (get_program_options()->value("path_to_target").ends_with("_target"))
            sala_program_path = get_program_options()->value("path_to_target").substr(0,
                    get_program_options()->value("path_to_target").rfind("_target")
                    ) + "_instrumented.json";
        if (sala_program_path.empty())
            std::cerr << "WARNING: The path to sala program is empty.\n";
        else if (!std::filesystem::is_regular_file(sala_program_path))
        {
            std::cerr << "ERROR: The passed sala program '" << sala_program_path << "' does not reference a regular file.\n";
            return;
        }
        else
        {
            sala_program_ptr = std::make_shared<sala::Program>();
            std::ifstream istr(sala_program_path.c_str(), std::ios_base::binary);
            istr >> *sala_program_ptr;
        }
    }
    if (!std::filesystem::is_regular_file(get_program_options()->value("path_to_tests")))
    {
        std::cerr << "ERROR: The passed path '"
                    << get_program_options()->value("path_to_tests")
                    << "' to a ZIP file with a test-suite does not reference a regular file.\n";
        return;
    }
    if (!get_program_options()->has("source_file_name"))
    {
        std::cerr << "ERROR: Name of the source file was not specified.\n";
        return;
    }

    com::mut_type  mut_type;
    {
        std::string const mut_name{ sala_program_ptr->functions().at(sala_program_ptr->entry_function()).name() };
        if (mut_name == "__fizzer_private_entry_function")
            mut_type = com::mut_type::NO_ARGS;
        else if (mut_name == "__fizzer_private_entry_function_with_params")    
            mut_type = com::mut_type::WITH_ARGS;
        else
        {
            std::cerr << "ERROR: Unsupported format of program's entry function.\n";
            return;
        }
    }

    std::string  target_name = std::filesystem::path(get_program_options()->value("path_to_target")).filename().string();
    {
        std::string const  target_suffix = "_target";
        std::string::size_type const  suffix_i = target_name.find(target_suffix);
        if (suffix_i != std::string::npos) {
            target_name.erase(suffix_i, target_suffix.length());
        }
    }

    fuzzing::target_executor  target_executor{
            get_program_options()->value("path_to_target"),
            (natural_16_bit)std::max(0UL, std::stoul(get_program_options()->value("max_exec_milliseconds"))),
            (natural_16_bit)std::max(0UL, std::stoul(get_program_options()->value("max_exec_megabytes"))),
            (natural_32_bit)std::max(0UL, std::stoul(get_program_options()->value("max_trace_length"))),
            mut_type,
            iomodels::cmdline::create(),
            iomodels::simple::create(
                (natural_64_bit)std::max(0ULL, std::stoull(get_program_options()->value("max_bytes")))
                )
            };

    fuzzing::branching_node*  entry_branching{ nullptr };
    std::unordered_set<fuzzing::branching_node*>  leaf_branchings{};
    {
        std::vector<test_case_ptr>  tests;
        if (!load_tests(get_program_options()->value("path_to_tests"), get_program_options()->value("source_file_name"), tests))
        {
            std::cerr << "ERROR: Cannot read the test-suite for program '" << get_program_options()->value("source_file_name")
                    << "' from ZIP file '" << get_program_options()->value("path_to_tests") << "'.\n";
            return;
        }
        for (test_case_ptr test : tests)
        {
            fuzzing::execution_results_ptr const  results{ target_executor.run(test->bytes, test->types, test->metadata) };
            if (!results->get_trace()->empty())
            {
                fuzzing::typed_input_ptr const  current_input{
                        std::make_shared<fuzzing::typed_input>(results->get_bytes(), results->get_types(), results->get_metadata())
                        };
                fuzzing::execution_trace_ptr const  trace = results->get_trace();
                fuzzing::branching_node*  leaf{ nullptr };
                bool  diverged{ false };

                if (entry_branching == nullptr)
                {
                    entry_branching = new fuzzing::branching_node(
                            trace->front().id,
                            0,
                            trace->front().num_input_bytes,
                            trace->front().xor_like_branching_function,
                            trace->front().predicate,
                            nullptr,
                            current_input,
                            trace,
                            1U
                            );
                    diverged = true;
                }

                leaf = entry_branching;

                fuzzing::trace_index_type  trace_index = 0;
                for (; true; ++trace_index)
                {
                    fuzzing::trace_item const&  info = trace->at(trace_index);

                    INVARIANT(leaf->get_location_id() == info.id);

                    // Here we try to remove bad float (INF, NaN) from 'info.value'.
                    if (!std::isfinite(info.value) || std::isnan(info.value))
                    {
                        fuzzing::branching_value&  value_ref{ const_cast<fuzzing::branching_value&>(info.value) };
                        switch (info.predicate)
                        {
                            case fuzzing::atomic_predicate::EQUAL:
                                value_ref = info.direction ? 0.0 : std::numeric_limits<fuzzing::branching_value>::max();
                                break;
                            case fuzzing::atomic_predicate::UNEQUAL:
                                value_ref = info.direction ? std::numeric_limits<fuzzing::branching_value>::max() : 0.0;
                                break;
                            case fuzzing::atomic_predicate::LESS_EQUAL:
                            case fuzzing::atomic_predicate::LESS:
                                value_ref = (info.direction ? -1.0 : 1.0) * std::numeric_limits<fuzzing::branching_value>::max();
                                break;
                                break;
                            case fuzzing::atomic_predicate::GREATER:
                            case fuzzing::atomic_predicate::GREATER_EQUAL:
                                value_ref = (info.direction ? 1.0 : -1.0) * std::numeric_limits<fuzzing::branching_value>::max();
                                break;
                            default: UNREACHABLE(); break;
                        }
                    }

                    if (trace_index + 1 == trace->size())
                        break;

                    if (leaf->successor(info.direction).pointer == nullptr)
                    {
                        fuzzing::trace_item const&  succ_info = trace->at(trace_index + 1);
                        leaf->set_successor(info.direction, {
                            fuzzing::branching_node::successor_pointer::VISITED,
                            new fuzzing::branching_node(
                                succ_info.id,
                                trace_index + 1,
                                succ_info.num_input_bytes,
                                succ_info.xor_like_branching_function,
                                succ_info.predicate,
                                leaf,
                                current_input,
                                trace,
                                1U
                                )
                        });
                        diverged = true;
                    }

                    leaf = leaf->successor(info.direction).pointer;
                }

                leaf->set_successor(trace->back().direction, {
                    std::max(
                        results->get_termination() == fuzzing::target_termination::NORMAL ?
                            fuzzing::branching_node::successor_pointer::END_NORMAL :
                            fuzzing::branching_node::successor_pointer::END_EXCEPTIONAL,
                        leaf->successor(trace->back().direction).label
                        ),
                    leaf->successor(trace->back().direction).pointer
                });

                if (diverged)
                    leaf_branchings.insert(leaf);
            }
        }
    }

    // TODO!
}
