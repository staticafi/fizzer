#include <cpseval/program_info.hpp>
#include <cpseval/program_options.hpp>
#include <cpseval/load_tests.hpp>
#include <fuzzing/target_executor.hpp>
#include <fuzzing/branching_node.hpp>
#include <fuzzing/input_flow_analysis.hpp>
#include <fuzzing/local_search_analysis.hpp>
#include <sala/program.hpp>
#include <sala/streaming.hpp>
#include <com/mut_type.hpp>
#include <utility/std_pair_hash.hpp>
#include <iostream>
#include <filesystem>
#include <fstream>
#include <memory>
#include <chrono>
#include <iostream>


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

    std::filesystem::path output_dir = std::filesystem::absolute(get_program_options()->value("output_dir"));
    {
        std::error_code  ec;
        std::filesystem::create_directories(output_dir, ec);
        if (ec)
        {
            std::cerr << "ERROR: Failed to create/access the output directory:\n        " << output_dir << "\n";
            return;
        }
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

    struct typed_input_and_trace
    {
        fuzzing::branching_node* leaf;
        fuzzing::typed_input_ptr  input{ nullptr };
        fuzzing::execution_trace_ptr  trace{ nullptr };
    };

    fuzzing::branching_node*  entry_branching{ nullptr };
    std::vector<typed_input_and_trace>  leaf_branchings{};
    {
        std::vector<test_case_ptr>  tests;
        if (!load_tests(get_program_options()->value("path_to_tests"), get_program_options()->value("source_file_name"), tests))
        {
            std::cerr << "ERROR: Cannot read the test-suite for program '" << get_program_options()->value("source_file_name")
                    << "' from ZIP file '" << get_program_options()->value("path_to_tests") << "'.\n";
            return;
        }
        if (tests.empty())
        {
            std::cerr << "ERROR: The test-suite is empty for program '" << get_program_options()->value("source_file_name")
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

                if (entry_branching == nullptr)
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

                leaf_branchings.push_back({ leaf, current_input, trace });
            }
        }
    }

    {
        fuzzing::input_flow_analysis  analysis{ sala_program_ptr.get(), &target_executor };
        for (auto const&  leaf_data : leaf_branchings)
        {
            fuzzing::input_flow_analysis::computation_io_data  io_data{
                .input_ptr = leaf_data.input,
                .trace_ptr = leaf_data.trace,
                .trace_size = leaf_data.leaf->get_trace_index() + 1U,
                .sensitive_bits{}
            };
            analysis.run(&io_data, [](std::string&) { return false; });

            fuzzing::branching_node*  node{ entry_branching };
            std::size_t  trace_index{ 0ULL };
            while (node != nullptr && trace_index < io_data.trace_size)
            {
                ASSUMPTION(node->get_trace_index() == trace_index);

                auto const&  info{ io_data.trace_ptr->at(trace_index) };
                if (node->get_location_id() != info.id)
                    break;

                if (trace_index < io_data.sensitive_bits.size())
                    for (auto const  bit_idx : io_data.sensitive_bits.at(trace_index))
                        node->insert_sensitive_stdin_bit(bit_idx);

                node->set_sensitivity_performed(1U);

                node = node->successor(info.direction).pointer;
                ++trace_index;
            }
        }
    }

    std::vector<fuzzing::local_search_analysis::configuration> lsa_configs;
    {
        if (get_program_options()->has("lsa_all"))
        {
            std::uint32_t const max_rounds = (std::uint32_t)std::stoi(get_program_options()->value("lsa_max_rounds"));
            lsa_configs.push_back({ max_rounds, false, false, false, false,  true });
            lsa_configs.push_back({ max_rounds, false, false, false,  true, false });
            lsa_configs.push_back({ max_rounds, false, false,  true, false, false });
            lsa_configs.push_back({ max_rounds, false, false,  true,  true,  true });
            lsa_configs.push_back({ max_rounds,  true, false,  true,  true,  true });
            lsa_configs.push_back({ max_rounds,  true,  true, false, false,  true });
            lsa_configs.push_back({ max_rounds,  true,  true, false,  true, false });
            lsa_configs.push_back({ max_rounds,  true,  true,  true, false, false });
            lsa_configs.push_back({ max_rounds,  true,  true, false,  true,  true });
            lsa_configs.push_back({ max_rounds,  true,  true,  true, false,  true });
            lsa_configs.push_back({ max_rounds,  true,  true,  true,  true, false });
            lsa_configs.push_back({ max_rounds,  true,  true,  true,  true,  true });
        }
        else
            lsa_configs.push_back({
                (std::uint32_t)std::stoi(get_program_options()->value("lsa_max_rounds")),
                std::stoi(get_program_options()->value("lsa_build_local_space")) != 0,
                std::stoi(get_program_options()->value("lsa_build_constraints")) != 0,
                std::stoi(get_program_options()->value("lsa_use_gradient_descent")) != 0,
                std::stoi(get_program_options()->value("lsa_use_bit_flips")) != 0,
                std::stoi(get_program_options()->value("lsa_use_random_fuzzing")) != 0,
            });
    };
    for (auto const& lsa_config : lsa_configs)
    {
        std::string const  output_file_name = std::string{""}
            + (lsa_config.build_local_space     ? "1-"  : "0-")
            + (lsa_config.build_constraints     ? "1-"  : "0-")
            + (lsa_config.use_gradient_descent  ? "1-"  : "0-")
            + (lsa_config.use_bit_flips         ? "1-"  : "0-")
            + (lsa_config.use_random_fuzzing    ? "1__" : "0__")
            + get_program_options()->value("source_file_name")
            + ".txt"
            ;
        std::filesystem::path const  test_file_path = output_dir / output_file_name;
        std::ofstream  ostr(test_file_path.c_str(), std::ios::binary);
        std::unordered_set<std::pair<fuzzing::branching_node*, bool> >  processed_nodes{};
        for (auto const&  leaf_data : leaf_branchings)
        {
            fuzzing::execution_trace_ptr const  trace{ leaf_data.trace };
            for (fuzzing::branching_node* node = leaf_data.leaf; node != nullptr; node = node->get_predecessor())
            {
                bool const  direction{ !trace->at(node->get_trace_index()).direction };
                if (node->successor(direction).label != fuzzing::branching_node::successor_pointer::NOT_VISITED
                        && !node->get_sensitive_stdin_bits().empty()
                        && !processed_nodes.contains({ node, direction }))
                {
                    ostr << "{ ";

                    ostr << "\"ID\": " << node->guid()
                        << ", \"Loc\": " << node->get_location_id()
                        << ", \"Idx\": " << node->get_trace_index()
                        << ", \"dir\": " << direction
                        ;
                    ostr.flush();

                    processed_nodes.insert({ node, direction });

                    node->update_best_data(leaf_data.input, trace, 1U);
                    auto const  saved_succ_ptr{ node->successor(direction) };
                    node->set_successor(direction, {});

                    float_64_bit  analysis_duration{ 0.0 };
                    float_64_bit  executor_duration{ 0.0 };
                    std::chrono::system_clock::time_point const  analysis_start_time_point{ std::chrono::system_clock::now() };
                    fuzzing::local_search_analysis  analysis{ lsa_config };
                    analysis.start(node, 1U);
                    while (true)
                    {
                        vecb  bits{};
                        fuzzing::input_types_ptr  types{ nullptr };
                        fuzzing::input_metadata_ptr  metadata{ nullptr };
                        if (!analysis.generate_next_input(bits, types, metadata))
                            break;
                        fuzzing::input_bytes  bytes;
                        bits_to_bytes(bits, bytes);

                        std::chrono::system_clock::time_point const  executor_start_time_point{ std::chrono::system_clock::now() };
                        fuzzing::execution_results_ptr const  results{ target_executor.run(bytes, *types, *metadata) };
                        executor_duration += std::chrono::duration<float_64_bit>(std::chrono::system_clock::now() - executor_start_time_point).count();

                        fuzzing::typed_input_ptr const  current_input{
                                std::make_shared<fuzzing::typed_input>(results->get_bytes(), results->get_types(), results->get_metadata())
                                };
                        fuzzing::execution_trace_ptr const  trace = results->get_trace();
                        analysis.process_execution_results(trace, current_input);
                    }
                    INVARIANT(analysis.is_ready());

                    analysis_duration = std::chrono::duration<float_64_bit>(std::chrono::system_clock::now() - analysis_start_time_point).count();

                    node->set_successor(direction, saved_succ_ptr);

                    ostr << ", \"Result\": " << (analysis.get_statistics().successes == 1ULL ? 1 : 0)
                        << ", \"Time\": " << analysis_duration
                        << ", \"ExeTime\": " << executor_duration
                        ;
                    for (auto const&  key_and_value : analysis.get_statistics().solver)
                        ostr << ", \"" << key_and_value.first << "\": " << key_and_value.second;

                    ostr << " }\n";
                    ostr.flush();
                }
            }
        }
    }

    std::unordered_set<fuzzing::branching_node*>  all_nodes{};
    for (auto const&  leaf_data : leaf_branchings)
        for (fuzzing::branching_node*  node = leaf_data.leaf ; node != nullptr; node = node->get_predecessor())
            all_nodes.insert(node);
    entry_branching = nullptr;
    leaf_branchings.clear();
    while (!all_nodes.empty())
    {
        fuzzing::branching_node*  node{ *all_nodes.begin() };
        all_nodes.erase(all_nodes.begin());
        delete node;
    }
}
