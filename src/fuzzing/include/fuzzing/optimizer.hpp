#ifndef FUZZING_OPTIMIZER_HPP_INCLUDED
#   define FUZZING_OPTIMIZER_HPP_INCLUDED

#   include <fuzzing/target_executor.hpp>
#   include <fuzzing/test_suite_item_writer.hpp>
#   include <fuzzing/basic_types.hpp>
#   include <utility/math.hpp>
#   include <chrono>
#   include <functional>

namespace  fuzzing {


struct optimization_outcomes;


struct  optimizer final
{
    static natural_32_bit constexpr  default_opt_max_seconds{ 30 };

    enum struct TERMINATION_REASON
    {
        ALL_TESTS_WERE_PROCESSED,
        TIME_BUDGET_DEPLETED
    };

    struct  performance_statistics
    {
        natural_32_bit  num_executions{ 0 };
        float_64_bit  num_seconds{ 0.0 };
        natural_32_bit  num_extended_tests{ 0 };
    };

    optimizer();

    float_64_bit  get_elapsed_seconds() const { return std::chrono::duration<float_64_bit>(time_point_current - time_point_start).count(); }

    optimization_outcomes  run(
            std::vector<test_suite_item_ptr> const&  inputs_leading_to_boundary_violation,
            std::vector<location_id> const&  already_covered_branchings,
            std::vector<location_and_direction> const&  already_uncovered_branchings,
            natural_32_bit  max_seconds,
            target_executor&  executor,
            test_suite_item_writer&  save_test
            );

    performance_statistics const&  get_statistics() const { return statistics; }

private:

    std::chrono::steady_clock::time_point  time_point_start;
    std::chrono::steady_clock::time_point  time_point_current;

    performance_statistics  statistics;
};


}

#endif
