#ifndef FUZZER_SALA_EXECUTOR_HPP_INCLUDED
#   define FUZZER_SALA_EXECUTOR_HPP_INCLUDED

#   include <fuzzing/target_executor.hpp>

namespace fuzzing {


struct  sala_executor : public target_executor
{
    sala_executor(
        natural_16_bit  max_exec_milliseconds,
        natural_16_bit  max_exec_megabytes,
        natural_32_bit  max_trace_length,
        iomodels::cmdline_ptr  io_cmdline,
        iomodels::simple_ptr  io_simple
        );
    ~sala_executor() override;

    execution_results_ptr  run(input_bytes const&  bytes, com::input_types const&  types, input_metadata const&  metadata) override;
    natural_16_bit  max_exec_milliseconds() const override;

private:

};


}

#endif
