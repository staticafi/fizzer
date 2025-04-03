#ifndef CONNECTION_BENCHMARK_EXECUTOR_HPP_INCLUDED
#   define CONNECTION_BENCHMARK_EXECUTOR_HPP_INCLUDED

#   include <connection/target_executor.hpp>
#   include <utility/basic_numeric_types.hpp>
#   include <memory>
#   include <string>


namespace connection {


struct  benchmark_executor_via_shared_memory
{
    benchmark_executor_via_shared_memory(std::string const&  path_to_target);
    ~benchmark_executor_via_shared_memory();
    void  operator()();
    void  on_io_config_changed();

private:
    std::unique_ptr<target_executor>  executor;
};


}

#endif
