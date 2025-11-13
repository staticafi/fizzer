#ifndef FUZZER_TARGET_EXECUTOR_HPP_INCLUDED
#   define FUZZER_TARGET_EXECUTOR_HPP_INCLUDED

#   include <fuzzing/basic_types.hpp>
#   include <connection/target_executor.hpp>
#   include <connection/shared_memory.hpp>
#   include <iomodels/cmdline.hpp>
#   include <iomodels/simple.hpp>
#   include <string>

namespace fuzzing {


struct  target_executor final
{
    static constexpr natural_16_bit  default_max_exec_megabytes { 1024 };
    static constexpr natural_32_bit  default_max_trace_length { 10000 };

    static constexpr natural_16_bit  default_opt_max_exec_megabytes { 2048 };
    static constexpr natural_32_bit  default_opt_max_trace_length { 10000000 };

    target_executor(
        std::string const&  path_to_target,
        natural_16_bit  max_exec_milliseconds,
        natural_16_bit  max_exec_megabytes,
        natural_32_bit  max_trace_length,
        iomodels::cmdline_ptr  io_cmdline,
        iomodels::simple_ptr  io_simple
        );
    ~target_executor();

    execution_results_ptr  run(input_bytes const&  bytes, com::input_types const&  types, input_metadata const&  metadata);

    connection::target_executor const&  executor() const { return m_executor; }
    connection::target_executor&  executor() { return m_executor; }

    connection::medium const&  get_medium() const { return m_shared_memory; }
    connection::medium&  get_medium() { return m_shared_memory; }

    natural_16_bit  max_exec_megabytes() const { return m_max_exec_megabytes; }
    natural_32_bit  max_trace_length() const { return m_max_trace_length; }

    void  set_max_exec_megabytes(natural_16_bit const  count) { m_max_exec_megabytes = count; }
    void  set_max_trace_length(natural_32_bit const  count) { m_max_trace_length = count; }

    iomodels::cmdline const&  io_cmdline() const { return *m_io_cmdline; }
    iomodels::cmdline&  io_cmdline() { return *m_io_cmdline; }

    iomodels::simple const&  io_simple() const { return *m_io_simple; }
    iomodels::simple&  io_simple() { return *m_io_simple; }

    natural_64_bit  compute_max_medium_size() const;

private:

    natural_16_bit  m_max_exec_megabytes;
    natural_32_bit  m_max_trace_length;
    iomodels::cmdline_ptr  m_io_cmdline;
    iomodels::simple_ptr  m_io_simple;
    connection::target_executor  m_executor;
    connection::shared_memory  m_shared_memory;
};


}

#endif
