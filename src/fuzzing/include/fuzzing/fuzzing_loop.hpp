#ifndef FUZZING_FUZZING_LOOP_HPP_INCLUDED
#   define FUZZING_FUZZING_LOOP_HPP_INCLUDED

#   include <fuzzing/termination_info.hpp>
#   include <fuzzing/fuzzing_outcomes.hpp>
#   include <fuzzing/test_suite_item_writer.hpp>
#   include <fuzzing/target_executor.hpp>
#   include <sala/program.hpp>
#   include <functional>

namespace  fuzzing {


fuzzing_outcomes  run(
        target_executor&  executor,
        sala::Program const*  sala_program_ptr,
        test_suite_item_writer&  save_test,
        std::function<void(test_suite_item_ptr)> const&  collector_of_boundary_violations,
        fuzzing::termination_info const&  info,
        local_search_analysis::configuration const&  lsa_config,
        bool  render
        );


}

#endif
