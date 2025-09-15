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
int iii = 0;
        for (test_case_ptr test : tests)
        {
std::cout << "Executing test case " << (++iii) << "/" << tests.size() << ".\n"; std::cout.flush();
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

std::vector<std::pair<fuzzing::branching_node::guid_type, bool> > GUID_AND_DIR {
#define temp_bak1X
#ifdef temp_bak01
    { 10761, false },
    { 10761, true },
    { 20191, false },
    { 20191, true },
    { 96342, false },
    { 169513, false },
    { 187177, false },
    { 187177, true },
    { 417285, false },
    { 417285, true },
    { 860848, false },
    { 985192, false },
    { 985192, true },
    { 1241582, true },
    { 1349916, false },
    { 1349916, true },
    { 1486906, false },
    { 1486906, true },
    { 1836366, true },
#endif
#ifdef temp_bak02
    { 204, false },
    { 204, true },
    { 252, false },
    { 252, true },
    { 10051, false },
    { 10051, true },
    { 19886, false },
    { 40604, false },
    { 40604, true },
    { 50508, false },
    { 50508, true },
    { 56685, true },
    { 77644, false },
    { 83649, false },
    { 83649, true },
    { 83872, false },
    { 83872, true },
    { 89911, false },
    { 89911, true },
    { 89912, false },
    { 89912, true },
    { 101498, false },
    { 101498, true },
    { 108239, false },
    { 117596, false },
    { 117596, true },
    { 123946, true },
    { 123984, true },
    { 150391, false },
    { 150391, true },
    { 150445, false },
    { 150483, false },
    { 156534, false },
    { 156534, true },
    { 166171, false },
    { 166171, true },
    { 166250, false },
    { 166250, true },
    { 190598, false },
    { 190627, false },
    { 190687, false },
    { 206242, false },
    { 206242, true },
    { 240731, false },
    { 257952, false },
    { 257952, true },
    { 269871, false },
    { 275779, false },
    { 275779, true },
    { 276002, false },
    { 276044, false },
    { 276044, true },
    { 321387, false },
    { 321387, true },
    { 379364, false },
    { 379364, true },
    { 476043, false },
    { 476043, true },
    { 482307, false },
    { 482307, true },
    { 494512, true },
    { 494540, false },
    { 494609, true },
    { 552905, false },
    { 552905, true },
    { 552906, false },
    { 552906, true },
    { 590635, false },
    { 590635, true },
    { 639280, false },
    { 639280, true },
    { 763682, true },
    { 1205540, false },
#endif
#ifdef temp_bak03
    { 261, false },
    { 261, true },
    { 262, false },
    { 262, true },
    { 263, false },
    { 263, true },
    { 275, true },
    { 276, false },
    { 276, true },
    { 279, false },
    { 279, true },
    { 283, false },
    { 283, true },
    { 291, false },
    { 291, true },
    { 10012, false },
    { 10012, true },
    { 10015, false },
    { 10015, true },
    { 10019, false },
    { 10019, true },
    { 39568, false },
    { 39568, true },
    { 58623, false },
    { 58628, true },
    { 78059, false },
    { 78059, true },
    { 97503, false },
    { 97503, true },
    { 97504, false },
    { 97504, true },
    { 97517, false },
    { 107242, false },
    { 107242, true },
    { 116999, false },
    { 116999, true },
    { 241026, false },
    { 241026, true },
    { 250296, false },
    { 250296, true },
    { 394137, false },
    { 394137, true },
    { 423710, false },
    { 423710, true },
    { 423723, true },
    { 423727, false },
    { 423727, true },
    { 433051, false },
    { 433051, true },
    { 460968, false },
    { 460968, true },
    { 470331, true },
#endif
#ifdef temp_bak04
    { 4, false },
    { 4, true },
    { 6, false },
    { 6, true },
    { 8, false },
    { 8, true },
    { 10, false },
    { 10, true },
    { 12, false },
    { 12, true },
    { 14, false },
    { 14, true },
    { 16, false },
    { 16, true },
#endif
#ifdef temp_bak05
    { 16, false },
    { 16, true },
    { 17, false },
    { 17, true },
    { 24, false },
    { 24, true },
    { 30, false },
    { 30, true },
    { 40, false },
    { 40, true },
#endif
#ifdef temp_bak06
    { 6, false },
    { 6, true },
    { 7, false },
    { 7, true },
    { 10, false },
    { 10, true },
    { 24, false },
    { 24, true },
#endif
#ifdef temp_bak07
    { 16, true },
    { 20, false },
    { 20, true },
    { 42, true },
    { 56, false },
    { 56, true },
    { 107, false },
#endif
#ifdef temp_bak08
    { 80, false },
    { 234, false },
    { 309, false },
    { 386, false },
    { 454, false },
#endif
#ifdef temp_bak09
    { 75, false },
    { 179, false },
    { 284, false },
    { 1313, false },
#endif
#ifdef temp_bak10
    { 15, false },
    { 15, true },
    { 28, false },
    { 28, true },
#endif
#ifdef temp_bak11
    { 170, true },
    { 245, true },
    { 334, false },
    { 336, true },
#endif
#ifdef temp_bak12
    { 19, true },
    { 22, true },
    { 24, true },
#endif
#ifdef temp_bak13
    { 287, false },
    { 287, true },
#endif
#ifdef temp_bak14
    { 11, false },
    { 11, true },
#endif
#ifdef temp_bak15
    { 31, false },
#endif
#ifdef temp_bak16
    (2022, true),
    (2022, false),
    (2007, true),
#endif
#ifdef temp_bak1X
#endif

};
std::map<std::pair<fuzzing::branching_node::guid_type, bool>, bool> TARGETS;
{ for (auto const& item : GUID_AND_DIR) TARGETS.insert({ item, false }); }
    {
int iii = 0;
        fuzzing::input_flow_analysis  analysis{ sala_program_ptr.get(), &target_executor };
        for (auto const&  leaf_data : leaf_branchings)
        {
++iii;
if (!TARGETS.empty())
{
bool found = false;
for (fuzzing::branching_node* node = leaf_and_data.first; node != nullptr; node = node->get_predecessor())
{
    auto const it{ TARGETS.find({ node->guid(), !leaf_and_data.second.trace->at(node->get_trace_index()).direction }) };
    if (it != TARGETS.end() && it->second == false)
    {
        it->second = true;
        found = true;
        break;
    }
}
if (!found) {
std::cout << "Skipping input flow analysis " << iii << "/" << leaf_branchings.size() << ".\n"; std::cout.flush();
    continue;
}
}
std::cout << "Running input flow analysis " << iii << "/" << leaf_branchings.size() << ", Idx: " << leaf_and_data.first->get_trace_index() << " .\n"; std::cout.flush();
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
std::cout << "CPS begins.\n"; std::cout.flush();
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
auto const TGT_IT{ TARGETS.find({ node->guid(), direction }) };
if (!TARGETS.empty() && TGT_IT == TARGETS.end()) continue;
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
int const RESULT = analysis.get_statistics().successes == 1ULL ? 1 : 0;
std::cout << (RESULT == 0 ? "        " : "") << "{ \"GUID\": " << node->guid() << ", \"dir\": " << (int)direction << ", \"Result\": " << RESULT << " }\n";
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
