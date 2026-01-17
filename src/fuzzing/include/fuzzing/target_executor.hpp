#ifndef FUZZER_TARGET_EXECUTOR_HPP_INCLUDED
#   define FUZZER_TARGET_EXECUTOR_HPP_INCLUDED

#   include <fuzzing/basic_types.hpp>
#   include <iomodels/cmdline.hpp>
#   include <iomodels/simple.hpp>

namespace fuzzing {


struct  target_executor
{
    static constexpr natural_16_bit  default_max_exec_megabytes { 1024 };
    static constexpr natural_32_bit  default_max_trace_length { 10000 };

    static constexpr natural_16_bit  default_opt_max_exec_megabytes { 2048 };
    static constexpr natural_32_bit  default_opt_max_trace_length { 10000000 };

    target_executor(
        natural_16_bit  max_exec_megabytes,
        natural_32_bit  max_trace_length,
        iomodels::cmdline_ptr  io_cmdline,
        iomodels::simple_ptr  io_simple
        )
        : m_max_exec_megabytes{ max_exec_megabytes }
        , m_max_trace_length{ max_trace_length }
        , m_io_cmdline{ io_cmdline.release() }
        , m_io_simple{ io_simple.release() }
    {}
    virtual ~target_executor() {}

    virtual execution_results_ptr  run(input_bytes const&  bytes, com::input_types const&  types, input_metadata const&  metadata) = 0;

    virtual natural_16_bit  max_exec_milliseconds() const = 0;
    natural_16_bit  max_exec_megabytes() const { return m_max_exec_megabytes; }
    natural_32_bit  max_trace_length() const { return m_max_trace_length; }

    virtual void  set_remaining_seconds_callback(std::function<float_64_bit()> const&  remaining_seconds) {}
    void  set_max_exec_megabytes(natural_16_bit const  count) { m_max_exec_megabytes = count; }
    void  set_max_trace_length(natural_32_bit const  count) { m_max_trace_length = count; }

    virtual bool  tracks_input_flow() const { return false; }

    iomodels::cmdline const&  io_cmdline() const { return *m_io_cmdline; }
    iomodels::cmdline&  io_cmdline() { return *m_io_cmdline; }

    iomodels::simple const&  io_simple() const { return *m_io_simple; }
    iomodels::simple&  io_simple() { return *m_io_simple; }

private:

    natural_16_bit  m_max_exec_megabytes;
    natural_32_bit  m_max_trace_length;
    iomodels::cmdline_ptr  m_io_cmdline;
    iomodels::simple_ptr  m_io_simple;
};


}

#endif
