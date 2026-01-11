#ifndef FUZZER_SALA_EXECUTOR_HPP_INCLUDED
#   define FUZZER_SALA_EXECUTOR_HPP_INCLUDED

#   include <fuzzing/target_executor.hpp>
#   include <sala/program.hpp>
#   include <functional>

namespace fuzzing {


struct  sala_executor final : public target_executor
{
    sala_executor(
        sala::Program const*  program_ptr,
        natural_16_bit  max_exec_milliseconds,
        natural_16_bit  max_exec_megabytes,
        natural_32_bit  max_trace_length,
        iomodels::cmdline_ptr  io_cmdline,
        iomodels::simple_ptr  io_simple,
        std::function<float_64_bit()> const&  remaining_seconds
        );

    execution_results_ptr  run(input_bytes const&  bytes, com::input_types const&  types, input_metadata const&  metadata) override final;
    natural_16_bit  max_exec_milliseconds() const override final { return 0U; }

private:

    sala::Program const*  program_ptr_;
    std::function<float_64_bit()>  remaining_seconds_;
};


}

#endif
