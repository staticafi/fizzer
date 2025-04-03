#include <fuzzing/fuzzing_loop.hpp>
#include <fuzzing/fuzzer.hpp>
#include <fuzzing/test_suite_item.hpp>
#include <utility/timeprof.hpp>
#include <utility/config.hpp>
#include <algorithm>
#include <tuple>

namespace  fuzzing {


fuzzing_outcomes  run(
        target_executor&  executor,
        sala::Program const* const  sala_program_ptr,
        test_suite_item_writer&  save_test,
        std::function<void(test_suite_item_ptr)> const&  collector_of_boundary_violations,
        fuzzing::termination_info const&  info,
        bool const  render
        )
{
    TMPROF_BLOCK();

    fuzzing_outcomes  outcomes;
    std::unordered_set<natural_64_bit>  hashes_of_crashes{ 0ULL };
    std::unordered_set<location_id>  exit_locations_of_boundary_violations;
    bool  any_test_saved{ false };

    fuzzer  analyzer{ info, sala_program_ptr, &executor };
    analyzer.enable_renderer(render);
    analyzer.render();

    try
    {
        while (true)
        {
            input_bytes  bytes;
            input_types_ptr  types;
            input_metadata_ptr  metadata;
            if (!analyzer.round_begin(outcomes.termination_reason, bytes, types, metadata))
            {
                outcomes.termination_type = fuzzing_outcomes::TERMINATION_TYPE::NORMAL;
                break;
            }

            execution_results_ptr  results;
            {
                TMPROF_BLOCK();
                results = executor.run(bytes, *types, *metadata);
            }

            test_suite_item_ptr const  test_ptr{ std::make_shared<test_suite_item>() };
            bool const is_valid_valid{ analyzer.round_end(*test_ptr, results) };
            analyzer.render();

            if (test_ptr->any_location_discovered || !test_ptr->covered_locations.empty() || any_test_saved == false)
            {
                save_test(*test_ptr);
                any_test_saved = true;
                ++outcomes.output_statistics[test_ptr->analysis_name].num_generated_tests;

                if (results->get_termination() == target_termination::CRASH)
                    ++outcomes.output_statistics[test_ptr->analysis_name].num_crashes;
                else if (results->get_termination() == target_termination::BOUNDARY_CONDITION_VIOLATION)
                {
                    if (!results->get_trace()->empty())
                        exit_locations_of_boundary_violations.insert(results->get_trace()->back().id);
                    collector_of_boundary_violations(test_ptr);
                    ++outcomes.output_statistics[test_ptr->analysis_name].num_boundary_violations;
                }
            }
            else if (results->get_termination() == target_termination::CRASH)
            {
                if (hashes_of_crashes.insert(com::compute_weakest_path_hash(*results->get_trace())).second)
                {
                    save_test(*test_ptr);
                    any_test_saved = true;
                    ++outcomes.output_statistics[test_ptr->analysis_name].num_generated_tests;
                    ++outcomes.output_statistics[test_ptr->analysis_name].num_crashes;
                }
            }
            else if (results->get_termination() == target_termination::BOUNDARY_CONDITION_VIOLATION)
            {
                if (exit_locations_of_boundary_violations.insert(results->get_trace()->back().id).second)
                {
                    collector_of_boundary_violations(test_ptr);
                    ++outcomes.output_statistics[test_ptr->analysis_name].num_boundary_violations;
                }
            }
        }
    }
    catch (std::exception const&  e)
    {
        outcomes.termination_type = fuzzing_outcomes::TERMINATION_TYPE::SERVER_INTERNAL_ERROR;
        outcomes.error_message = e.what();
    }

    if (outcomes.termination_type != fuzzing_outcomes::TERMINATION_TYPE::NORMAL)
    {
        try { analyzer.terminate(); } catch (...) {}
    }

    outcomes.num_executions = analyzer.get_performed_driver_executions();
    outcomes.num_elapsed_seconds = analyzer.get_elapsed_seconds();
    outcomes.covered_branchings.assign(analyzer.get_covered_branchings().begin(), analyzer.get_covered_branchings().end());
    std::sort(outcomes.covered_branchings.begin(),outcomes.covered_branchings.end());
    outcomes.uncovered_branchings.assign(analyzer.get_uncovered_branchings().begin(), analyzer.get_uncovered_branchings().end());
    std::sort(outcomes.uncovered_branchings.begin(),outcomes.uncovered_branchings.end());
    outcomes.input_flow_statistics = analyzer.get_input_flow_statistics();
    outcomes.bitshare_statistics = analyzer.get_bitshare_statistics();
    outcomes.local_search_statistics = analyzer.get_local_search_statistics();
    outcomes.bitflip_statistics = analyzer.get_bitflip_statistics();
    outcomes.fuzzer_statistics = analyzer.get_fuzzer_statistics();

    return  outcomes;
}


}
