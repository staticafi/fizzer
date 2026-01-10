#include <fuzzing/sala_executor.hpp>
#include <com/record_type.hpp>
#include <com/target_termination.hpp>
#include <com/atomic_predicate.hpp>

namespace fuzzing {


sala_executor::sala_executor(
        natural_16_bit const  max_exec_milliseconds,
        natural_16_bit const  max_exec_megabytes,
        natural_32_bit const  max_trace_length,
        iomodels::cmdline_ptr  io_cmdline,
        iomodels::simple_ptr  io_simple
        )
    : target_executor(max_exec_megabytes, max_trace_length, std::move(io_cmdline), std::move(io_simple))
{}


sala_executor::~sala_executor()
{
}


execution_results_ptr  sala_executor::run(input_bytes const&  bytes, com::input_types const&  types, input_metadata const&  metadata)
{
    return {};
}


natural_16_bit  sala_executor::max_exec_milliseconds() const
{
    return 0U;
}


}
