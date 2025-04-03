#include <fuzzing/optimizer.hpp>
#include <fuzzing/optimization_outcomes.hpp>
#include <utility/std_pair_hash.hpp>
#include <utility/assumptions.hpp>
#include <utility/invariants.hpp>
#include <utility/timeprof.hpp>
#include <vector>
#include <unordered_set>

namespace  fuzzing {


optimizer::optimizer()
    : time_point_start{}
    , time_point_current{}
    , statistics{}
{}


optimization_outcomes  optimizer::run(
        std::vector<test_suite_item_ptr> const&  inputs_leading_to_boundary_violation,
        std::vector<location_id> const&  already_covered_branchings,
        std::vector<location_and_direction> const&  already_uncovered_branchings,
        natural_32_bit const  max_seconds,
        target_executor&  executor,
        test_suite_item_writer&  save_test
    )
{
    TMPROF_BLOCK();

    time_point_start = std::chrono::steady_clock::now();
    time_point_current = time_point_start;

    optimization_outcomes  outcomes;
    outcomes.termination_type = optimization_outcomes::TERMINATION_TYPE::NORMAL;
    outcomes.termination_reason = TERMINATION_REASON::ALL_TESTS_WERE_PROCESSED;

    std::unordered_set<natural_64_bit>  hashes_of_crashes;

    if (!inputs_leading_to_boundary_violation.empty())
    {
        std::unordered_set<location_id>  covered_branchings{
                already_covered_branchings.begin(), already_covered_branchings.end()
                };
        std::unordered_set<location_and_direction>  uncovered_branchings{
                already_uncovered_branchings.begin(), already_uncovered_branchings.end()
                };

        std::unordered_set<location_id>  extra_covered_branchings;
        std::unordered_set<location_and_direction>  extra_uncovered_branchings;

        for (test_suite_item_ptr const&  item_ptr : inputs_leading_to_boundary_violation)
        {
            time_point_current = std::chrono::steady_clock::now();
            if (get_elapsed_seconds() >= max_seconds)
            {
                outcomes.termination_reason = TERMINATION_REASON::TIME_BUDGET_DEPLETED;
                break;
            }

            execution_results_ptr  results;
            {
                TMPROF_BLOCK();
                results = executor.run(*item_ptr->results->get_bytes(), *item_ptr->results->get_types(), *item_ptr->results->get_metadata());
            }

            ++statistics.num_executions;

            bool  trace_any_location_discovered = false;
            std::unordered_set<location_id>  trace_covered_branchings;
            {
                for (trace_item const&  info : *results->get_trace())
                {
                    if (!covered_branchings.contains(info.id))
                    {
                        auto const  it_along = uncovered_branchings.find({ info.id, info.direction });
                        if (it_along == uncovered_branchings.end())
                        {
                            auto const  it_escape = uncovered_branchings.find({ info.id, !info.direction });
                            if (it_escape == uncovered_branchings.end())
                            {
                                extra_uncovered_branchings.insert({ info.id, !info.direction });
                                trace_any_location_discovered = true;

                                uncovered_branchings.insert({ info.id, !info.direction });
                            }
                        }
                        else
                        {
                            extra_uncovered_branchings.erase(*it_along);
                            extra_covered_branchings.insert(info.id);

                            trace_covered_branchings.insert(info.id);

                            uncovered_branchings.erase(it_along);
                            covered_branchings.insert(info.id);
                        }
                    }
                }
            }

            test_suite_item_ptr const  test_ptr{ std::make_shared<test_suite_item>() };
            test_ptr->results = results;
            test_ptr->any_location_discovered = trace_any_location_discovered;
            test_ptr->covered_locations.assign(trace_covered_branchings.begin(), trace_covered_branchings.end());
            test_ptr->analysis_name = "OPTIMIZER";

            if (test_ptr->any_location_discovered || !test_ptr->covered_locations.empty())
            {
                save_test(*test_ptr);
                ++statistics.num_extended_tests;
                if (results->get_termination() == target_termination::CRASH)
                    hashes_of_crashes.insert(com::compute_path_hash(*results->get_trace()));
            }
            else if (results->get_termination() == target_termination::CRASH)
            {
                if (hashes_of_crashes.insert(com::compute_path_hash(*results->get_trace())).second)
                {
                    save_test(*test_ptr);
                    ++statistics.num_extended_tests;
                }
            }
        }

        outcomes.covered_branchings.assign(extra_covered_branchings.begin(), extra_covered_branchings.end());
        std::sort(outcomes.covered_branchings.begin(),outcomes.covered_branchings.end());
        outcomes.uncovered_branchings.assign(extra_uncovered_branchings.begin(), extra_uncovered_branchings.end());
        std::sort(outcomes.uncovered_branchings.begin(),outcomes.uncovered_branchings.end());
    }

    time_point_current = std::chrono::steady_clock::now();
    statistics.num_seconds = get_elapsed_seconds();

    outcomes.statistics = statistics;

    return outcomes;
}


}
