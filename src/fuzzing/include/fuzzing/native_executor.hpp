#ifndef FUZZER_NATIVE_EXECUTOR_HPP_INCLUDED
#   define FUZZER_NATIVE_EXECUTOR_HPP_INCLUDED

#   include <fuzzing/target_executor.hpp>
#   include <connection/target_executor.hpp>
#   include <connection/shared_memory.hpp>
#   include <string>

namespace fuzzing {


struct  native_executor final : public target_executor
{
    native_executor(
        std::string const&  path_to_target,
        natural_16_bit  max_exec_milliseconds,
        natural_16_bit  max_exec_megabytes,
        natural_32_bit  max_trace_length,
        iomodels::cmdline_ptr  io_cmdline,
        iomodels::simple_ptr  io_simple
        );
    ~native_executor() override;

    execution_results_ptr  run(input_bytes const&  bytes, com::input_types const&  types, input_metadata const&  metadata) override;
    natural_16_bit  max_exec_milliseconds() const override { return executor().get_max_exec_milliseconds(); }

    connection::target_executor const&  executor() const { return m_executor; }
    connection::target_executor&  executor() { return m_executor; }

    connection::medium const&  get_medium() const { return m_shared_memory; }
    connection::medium&  get_medium() { return m_shared_memory; }

    natural_64_bit  compute_max_medium_size() const;

private:

    connection::target_executor  m_executor;
    connection::shared_memory  m_shared_memory;
};


}

#endif
