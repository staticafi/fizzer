#ifndef FUZZER_SALA_EXECUTOR_HPP_INCLUDED
#   define FUZZER_SALA_EXECUTOR_HPP_INCLUDED

#   include <fuzzing/target_executor.hpp>
#   include <sala/program.hpp>
#   include <functional>
#   include <memory>

namespace fuzzing {


struct  sala_executor final : public target_executor
{
    sala_executor(
        std::shared_ptr<sala::Program>  program_ptr,
        natural_16_bit  max_exec_milliseconds,
        natural_16_bit  max_exec_megabytes,
        natural_32_bit  max_trace_length,
        iomodels::cmdline_ptr  io_cmdline,
        iomodels::simple_ptr  io_simple
        );

    execution_results_ptr  run(input_bytes const&  bytes, com::input_types const&  types, input_metadata const&  metadata) override final;
    natural_16_bit  max_exec_milliseconds() const override final { return max_exec_milliseconds_; }
    void  set_remaining_seconds_callback(std::function<float_64_bit()> const&  remaining_seconds) override { remaining_seconds_ = remaining_seconds; }
    bool  tracks_input_flow() const override { return true; }

private:

    std::shared_ptr<sala::Program>  program_ptr_;
    natural_16_bit  max_exec_milliseconds_;
    std::function<float_64_bit()>  remaining_seconds_;
};


}

#endif
