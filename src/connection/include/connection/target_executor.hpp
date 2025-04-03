#ifndef CONNECTION_TARGET_EXECUTOR_HPP_INCLUDED
#   define CONNECTION_TARGET_EXECUTOR_HPP_INCLUDED

#   include <utility/basic_numeric_types.hpp>
#   include <string>

namespace connection {


struct process_termination
{
    int exit_code;
    bool killed;
};


struct target_executor
{
    static natural_16_bit constexpr  default_max_exec_milliseconds{ 250U };
    static natural_16_bit constexpr  default_opt_max_exec_milliseconds{ 3000U };

    target_executor(std::string const&  path_to_target, natural_16_bit  max_exec_milliseconds);
    ~target_executor();

    process_termination  run();

    natural_16_bit  get_max_exec_milliseconds() const { return m_max_exec_milliseconds; }
    void  set_max_exec_milliseconds(natural_16_bit const  ms) { m_max_exec_milliseconds = ms; }

private:
    std::string  m_path_to_target;
    natural_16_bit  m_max_exec_milliseconds;
};


}

#endif




    // void init_shared_memory(std::size_t size);
    // void set_timeout(natural_16_bit timeout_ms_);
    // void execute_target();


// #ifndef CONNECTION_BENCHMARK_EXECUTOR_HPP_INCLUDED
// #   define CONNECTION_BENCHMARK_EXECUTOR_HPP_INCLUDED

// #   include <connection/target_executor.hpp>
// #   include <utility/basic_numeric_types.hpp>
// #   include <memory>
// #   include <string>


// namespace connection {


// struct  benchmark_executor_via_shared_memory
// {
//     benchmark_executor_via_shared_memory(std::string const&  path_to_target);
//     ~benchmark_executor_via_shared_memory();
//     void  operator()();
//     void  on_io_config_changed();

// private:
//     std::unique_ptr<target_executor>  executor;
// };


// }

// #endif
