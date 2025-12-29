#include <fuzzing/dump.hpp>
#include <utility/assumptions.hpp>
#include <utility/invariants.hpp>
#include <utility/math.hpp>
#include <utility/log.hpp>
#include <iostream>
#include <fstream>
#include <sstream>
#include <iomanip>

namespace  fuzzing {


void  print_fuzzing_configuration(
        std::ostream&  ostr,
        std::string const&  benchmark,
        target_executor const&  executor,
        termination_info const&  terminator,
        local_search_analysis::configuration const&  lsa_config
        )
{
    std::string const  shift = "    ";
    ostr << "{\n"
         << shift << "\"benchmark\": \"" << benchmark << "\",\n"
         << shift << "\"max_executions\": " << terminator.max_executions << ",\n"
         << shift << "\"max_seconds\": " << terminator.max_seconds << ",\n"
         << shift << "\"max_exec_milliseconds\": " << executor.executor().get_max_exec_milliseconds() << ",\n"
         << shift << "\"max_exec_megabytes\": " << executor.max_exec_megabytes() << ",\n"
         << shift << "\"max_trace_length\": " << executor.max_trace_length() << ",\n"
         << shift << "\"max_bytes\": " << executor.io_simple().max_bytes() << ",\n"
         << shift << "\"lsa_max_rounds\": " << lsa_config.max_rounds << ",\n"
         << shift << "\"lsa_build_local_space\": " << lsa_config.build_local_space << ",\n"
         << shift << "\"lsa_build_constraints\": " << lsa_config.build_constraints << ",\n"
         << shift << "\"lsa_use_gradient_descent\": " << lsa_config.use_gradient_descent << ",\n"
         << shift << "\"lsa_use_bit_flips\": " << lsa_config.use_bit_flips << ",\n"
         << shift << "\"lsa_use_random_fuzzing\": " << lsa_config.use_random_fuzzing << "\n"
         << "}"
         ;
}


void  log_fuzzing_configuration(
        std::string const&  benchmark,
        target_executor const&  executor,
        termination_info const&  terminator,
        local_search_analysis::configuration const&  lsa_config
        )
{
    std::stringstream sstr;
    print_fuzzing_configuration(sstr, benchmark, executor, terminator, lsa_config);
    LOG(LSL_INFO, sstr.str());
}


void  save_fuzzing_configuration(
        std::filesystem::path const&  output_dir,
        std::string const&  benchmark,
        target_executor const&  executor,
        termination_info const&  terminator,
        local_search_analysis::configuration const&  lsa_config
        )
{
    std::filesystem::path const  test_file_path = output_dir / (benchmark + "_config.json");
    std::ofstream  ostr(test_file_path.c_str(), std::ios::binary);
    print_fuzzing_configuration(ostr, benchmark, executor, terminator, lsa_config);
}


void  print_fuzzing_outcomes(std::ostream&  ostr, fuzzing_outcomes const&  results)
{
    std::string const  shift = "    ";

    ostr << "{\n";

    ostr << shift << "\"termination_type\": \"";
    switch (results.termination_type)
    {
    case fuzzing_outcomes::TERMINATION_TYPE::NORMAL:
        ostr << "NORMAL";
        break;
    case fuzzing_outcomes::TERMINATION_TYPE::SERVER_INTERNAL_ERROR:
        ostr << "SERVER_INTERNAL_ERROR";
        break;
    default: { UNREACHABLE(); break; }
    }
    ostr << "\",\n";

    if (results.termination_type == fuzzing_outcomes::TERMINATION_TYPE::NORMAL)
    {
        ostr << shift << "\"termination_reason\": \"";
        switch (results.termination_reason)
        {
        case fuzzer::TERMINATION_REASON::ALL_REACHABLE_BRANCHINGS_COVERED:
            ostr << "ALL_REACHABLE_BRANCHINGS_COVERED";
            break;
        case fuzzer::TERMINATION_REASON::FUZZING_STRATEGY_DEPLETED:
            ostr << "FUZZING_STRATEGY_DEPLETED";
            break;
        case fuzzer::TERMINATION_REASON::TIME_BUDGET_DEPLETED:
            ostr << "TIME_BUDGET_DEPLETED";
            break;
        case fuzzer::TERMINATION_REASON::EXECUTIONS_BUDGET_DEPLETED:
            ostr << "EXECUTIONS_BUDGET_DEPLETED";
            break;
        default: { UNREACHABLE(); break; }
        }
        ostr << "\",\n";
    }
    else
        ostr << shift << "\"error_message\": \"" << results.error_message << "\",\n";

    std::vector<std::string>  warnings;
    if (results.fuzzer_statistics.leaf_nodes_created != results.fuzzer_statistics.leaf_nodes_destroyed)
        warnings.push_back("The number of created and destroyed leaf nodes differ.");
    if (results.fuzzer_statistics.nodes_created != results.fuzzer_statistics.nodes_destroyed)
        warnings.push_back("The number of created and destroyed nodes differ => Memory leak!");
    if (!warnings.empty())
    {
        ostr << shift << "\"WARNINGS\": [\n";
        for (std::size_t  i = 0, n = warnings.size(); i < n; ++i)
        {
            ostr << shift << shift << "\"" << warnings.at(i) << "\"";
            if (i + 1 < n)
                ostr << ',';
            ostr << '\n';
        }
        ostr << shift << "],\n";
    }

    ostr << shift << "\"num_executions\": " << results.num_executions << ",\n"
         << shift << "\"num_elapsed_seconds\": " << results.num_elapsed_seconds << ",\n"
         << shift << "\"input_flow_analysis\": {\n"
         << shift << shift << "\"num_successes\": " << results.input_flow_statistics.num_successes << ",\n"
         << shift << shift << "\"num_failures\": " << results.input_flow_statistics.num_failures << ",\n"
         << shift << shift << "\"errors\": [";
    {
        bool first1{ true };
        for (std::string const&  error : results.input_flow_statistics.errors)
        {
            if (first1) first1 = false; else ostr << ",";
            ostr << "\n" << shift << shift << shift << error;
        }
        ostr << "\n";
    }
    ostr << shift << shift << "],\n"
         << shift << shift << "\"warnings\": [";
    {
        bool first1{ true };
        for (std::string const& warning : results.input_flow_statistics.warnings) 
        {
            if (first1) first1 = false; else ostr << ",";
            ostr << "\n" << shift << shift << shift << warning;
        }
        ostr << "\n";
    }
    ostr << shift << shift << "],\n"
         << shift << shift << "\"complexity\": [";
    {
        bool first1{ true };
        for (auto const& key_and_value : results.input_flow_statistics.complexity)
        {
            if (first1) first1 = false; else ostr << ",";
            ostr << "\n";
            ostr << shift << shift << shift << "{ "
                 << "\"trace_index\": " << key_and_value.first.first
                 << ", \"stdin_bytes\": " << key_and_value.first.second
                 << ", \"durations\": [ ";
            bool first2{ true };
            for (auto const time : key_and_value.second)
            {
                if (first2) first2 = false; else ostr << ", ";
                ostr << time;
            }
            ostr << " ] }";
        }
        ostr << "\n";
    }
    ostr << shift << shift << "]\n"
         << shift << "},\n"
         ;

    ostr << shift << "\"bitshare_analysis\": {\n"
         << shift << shift << "\"generated_inputs\": " << results.bitshare_statistics.generated_inputs << ",\n"
         << shift << shift << "\"hits\": " << results.bitshare_statistics.hits << ",\n"
         << shift << shift << "\"misses\": " << results.bitshare_statistics.misses << ",\n"
         << shift << shift << "\"start_calls\": " << results.bitshare_statistics.start_calls << ",\n"
         << shift << shift << "\"stop_calls_regular\": " << results.bitshare_statistics.stop_calls_regular << ",\n"
         << shift << shift << "\"stop_calls_early\": " << results.bitshare_statistics.stop_calls_early << ",\n"
         << shift << shift << "\"stop_calls_instant\": " << results.bitshare_statistics.stop_calls_instant << ",\n"
         << shift << shift << "\"num_locations\": " << results.bitshare_statistics.num_locations << ",\n"
         << shift << shift << "\"num_insertions\": " << results.bitshare_statistics.num_insertions << ",\n"
         << shift << shift << "\"num_deletions\": " << results.bitshare_statistics.num_deletions << "\n"
         << shift << "},\n"
         ;

    ostr << shift << "\"local_search_analysis\": {\n"
         << shift << shift << "\"generated_inputs\": " << results.local_search_statistics.generated_inputs << ",\n"
         << shift << shift << "\"start_calls\": " << results.local_search_statistics.start_calls << ",\n"
         << shift << shift << "\"successes\": " << results.local_search_statistics.successes << ",\n"
         << shift << shift << "\"failures\": " << results.local_search_statistics.failures
         ;
        for (auto const&  key_and_value : results.local_search_statistics.solver)
            ostr << ",\n" << shift << shift << "\"" << key_and_value.first << "\": " << key_and_value.second;
        ostr << '\n' << shift << "},\n";

    ostr << shift << "\"bitflip_analysis\": {\n"
         << shift << shift << "\"generated_inputs\": " << results.bitflip_statistics.generated_inputs << ",\n"
         << shift << shift << "\"max_bits\": " << results.bitflip_statistics.max_bits << ",\n"
         << shift << shift << "\"start_calls\": " << results.bitflip_statistics.start_calls << "\n"
         << shift << "},\n"
         ;

    ostr << shift << "\"fuzzer\": {\n"
         << shift << shift << "\"leaf_nodes_created\": " << results.fuzzer_statistics.leaf_nodes_created << ",\n"
         << shift << shift << "\"leaf_nodes_destroyed\": " << results.fuzzer_statistics.leaf_nodes_destroyed << ",\n"
         << shift << shift << "\"nodes_created\": " << results.fuzzer_statistics.nodes_created << ",\n"
         << shift << shift << "\"nodes_destroyed\": " << results.fuzzer_statistics.nodes_destroyed << ",\n"
         << shift << shift << "\"max_leaf_nodes\": " << results.fuzzer_statistics.max_leaf_nodes << ",\n"
         << shift << shift << "\"max_input_width\": " << results.fuzzer_statistics.max_input_width << ",\n"
         << shift << shift << "\"longest_branch\": " << results.fuzzer_statistics.longest_branch << ",\n"
         << shift << shift << "\"crashes\": " << results.fuzzer_statistics.crashes << ",\n"
         << shift << shift << "\"boundary_violations\": " << results.fuzzer_statistics.boundary_violations << ",\n"
         << shift << shift << "\"medium_overflows\": " << results.fuzzer_statistics.medium_overflows << ",\n"
         << shift << shift << "\"coverage_failure_resets\": " << results.fuzzer_statistics.coverage_failure_resets << "\n"
         << shift << "},\n"
         ;

    ostr << shift << "\"num_branchings_to_cover\": " << results.num_branchings_to_cover << ",\n";
    ostr << shift << "\"num_covered_branchings\": " << results.covered_branchings.size() << ",\n"
         << shift << "\"covered_branchings\": [";
    for (std::size_t  i = 0, n = results.covered_branchings.size(); i < n; ++i)
    {
        if (i % 4U == 0U) ostr << '\n' << shift << shift;
        ostr << std::dec << results.covered_branchings.at(i);
        if (i + 1 < n)
            ostr << ',' << shift;
    }
    ostr << '\n' << shift << "],\n";

    ostr << shift << "\"num_uncovered_branchings\": " << results.uncovered_branchings.size() << ",\n"
         << shift << "\"uncovered_branchings\": [";
    for (std::size_t  i = 0, n = results.uncovered_branchings.size(); i < n; ++i)
    {
        if (i % 4U == 0U) ostr << '\n' << shift << shift;
        ostr << std::dec << results.uncovered_branchings.at(i).first << ','
             << (results.uncovered_branchings.at(i).second ? 1 : 0);
        if (i + 1 < n)
            ostr << ',' << shift;
    }
    ostr << '\n' << shift << "],\n";

    ostr << shift << "\"output_statistics\": {\n";
    for (auto  it = results.output_statistics.begin(); it != results.output_statistics.end(); ++it)
    {
        ostr << shift << shift << '\"' << it->first << "\": {\n";
        ostr << shift << shift << shift << "\"num_generated_tests\": " << it->second.num_generated_tests << ",\n";
        ostr << shift << shift << shift << "\"num_crashes\": " << it->second.num_crashes << ",\n";
        ostr << shift << shift << shift << "\"num_boundary_violations\": " << it->second.num_boundary_violations << "\n";
        ostr << shift << shift << '}' << (std::next(it) != results.output_statistics.end() ? "," : "") << '\n';
    }
    ostr << shift << "}\n";

    ostr << "}";
}


void  log_fuzzing_outcomes(fuzzing_outcomes const&  results)
{
    std::stringstream sstr;
    print_fuzzing_outcomes(sstr, results);
    LOG(LSL_INFO, sstr.str());
}


void  save_fuzzing_outcomes(
        std::filesystem::path const&  output_dir,
        std::string const&  benchmark,
        fuzzing_outcomes const&  results
        )
{
    std::filesystem::path const  test_file_path = output_dir / (benchmark + "_outcomes.json");
    std::ofstream  ostr(test_file_path.c_str(), std::ios::binary);
    print_fuzzing_outcomes(ostr, results);
}


void  print_optimization_configuration(
    std::ostream&  ostr,
    std::string const&  benchmark,
    target_executor const&  executor,
    natural_32_bit const  opt_max_num_seconds
    )
{
    std::string const  shift = "    ";
    ostr << "{\n"
        << shift << "\"benchmark\": \"" << benchmark << "\",\n"
        << shift << "\"opt_max_seconds\": " << opt_max_num_seconds << ",\n"
        << shift << "\"opt_max_exec_milliseconds\": " << executor.executor().get_max_exec_milliseconds() << ",\n"
        << shift << "\"opt_max_exec_megabytes\": " << executor.max_exec_megabytes() << ",\n"
        << shift << "\"opt_max_trace_length\": " << executor.max_trace_length() << ",\n"
        << shift << "\"opt_max_bytes\": " << executor.io_simple().max_bytes() << ",\n"
        << "}"
        ;
}


void  log_optimization_configuration(
    std::string const&  benchmark,
    target_executor const&  executor,
    natural_32_bit const  opt_max_num_seconds
    )
{
    std::stringstream sstr;
    print_optimization_configuration(sstr, benchmark, executor, opt_max_num_seconds);
    LOG(LSL_INFO, sstr.str());
}


void  save_optimization_configuration(
    std::filesystem::path const&  output_dir,
    std::string const&  benchmark,
    target_executor const&  executor,
    natural_32_bit const  opt_max_num_seconds
    )
{
    std::filesystem::path const  test_file_path = output_dir / (benchmark + "_config_opt.json");
    std::ofstream  ostr(test_file_path.c_str(), std::ios::binary);
    print_optimization_configuration(ostr, benchmark, executor, opt_max_num_seconds);
}


void  print_optimization_outcomes(std::ostream&  ostr, optimization_outcomes const&  results)
{
    std::string const  shift = "    ";

    ostr << "{\n";

    ostr << shift << "\"termination_type\": \"";
    switch (results.termination_type)
    {
    case optimization_outcomes::TERMINATION_TYPE::NORMAL:
        ostr << "NORMAL";
        break;
    case optimization_outcomes::TERMINATION_TYPE::SERVER_INTERNAL_ERROR:
        ostr << "SERVER_INTERNAL_ERROR";
        break;
    default: { UNREACHABLE(); break; }
    }
    ostr << "\",\n";

    if (results.termination_type == optimization_outcomes::TERMINATION_TYPE::NORMAL)
    {
        ostr << shift << "\"termination_reason\": \"";
        switch (results.termination_reason)
        {
        case optimizer::TERMINATION_REASON::ALL_TESTS_WERE_PROCESSED:
            ostr << "ALL_TESTS_WERE_PROCESSED";
            break;
        case optimizer::TERMINATION_REASON::TIME_BUDGET_DEPLETED:
            ostr << "TIME_BUDGET_DEPLETED";
            break;
        default: { UNREACHABLE(); break; }
        }
        ostr << "\",\n";
    }
    else
        ostr << shift << "\"error_message\": \"" << results.error_message << "\",\n";

    ostr << shift << "\"num_executions\": " << results.statistics.num_executions << ",\n"
         << shift << "\"num_seconds\": " << results.statistics.num_seconds << ",\n"
         << shift << "\"num_extended_tests\": " << results.statistics.num_extended_tests << ",\n"
         ;

    ostr << shift << "\"num_covered_branchings\": " << results.covered_branchings.size() << ",\n"
         << shift << "\"covered_branchings\": [";
    for (std::size_t  i = 0, n = results.covered_branchings.size(); i < n; ++i)
    {
        if (i % 4U == 0U) ostr << '\n' << shift << shift;
        ostr << std::dec << results.covered_branchings.at(i);
        if (i + 1 < n)
            ostr << ',' << shift;
    }
    ostr << '\n' << shift << "],\n";

    ostr << shift << "\"num_uncovered_branchings\": " << results.uncovered_branchings.size() << ",\n"
         << shift << "\"uncovered_branchings\": [";
    for (std::size_t  i = 0, n = results.uncovered_branchings.size(); i < n; ++i)
    {
        if (i % 4U == 0U) ostr << '\n' << shift << shift;
        ostr << std::dec << results.uncovered_branchings.at(i).first << ','
             << (results.uncovered_branchings.at(i).second ? 1 : 0);
        if (i + 1 < n)
            ostr << ',' << shift;
    }
    ostr << '\n' << shift << "]\n";

    ostr << "}";
}


void  log_optimization_outcomes(optimization_outcomes const&  results)
{
    std::stringstream sstr;
    print_optimization_outcomes(sstr, results);
    LOG(LSL_INFO, sstr.str());
}


void  save_optimization_outcomes(
        std::filesystem::path const&  output_dir,
        std::string const&  benchmark,
        optimization_outcomes const&  results
        )
{
    std::filesystem::path const  test_file_path = output_dir / (benchmark + "_outcomes_opt.json");
    std::ofstream  ostr(test_file_path.c_str(), std::ios::binary);
    print_optimization_outcomes(ostr, results);
}


}
