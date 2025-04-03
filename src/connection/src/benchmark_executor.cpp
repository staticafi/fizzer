#include <connection/benchmark_executor.hpp>
#include <iomodels/iomanager.hpp>

namespace connection {


benchmark_executor_via_shared_memory::benchmark_executor_via_shared_memory(std::string const&  path_to_target)
    : executor{ nullptr }
{
    executor = std::make_unique<target_executor>(path_to_target);
    executor->set_timeout(iomodels::iomanager::instance().get_config().max_exec_milliseconds);
    executor->init_shared_memory(iomodels::iomanager::instance().get_config().required_shared_memory_size());
}


benchmark_executor_via_shared_memory::~benchmark_executor_via_shared_memory()
{
    executor = nullptr;
    shared_memory::remove();
}


void benchmark_executor_via_shared_memory::operator()()
{
    executor->get_shared_memory().clear();
    iomodels::iomanager::instance().get_config().save_target_config(executor->get_shared_memory());
    iomodels::iomanager::instance().get_stdin()->save(executor->get_shared_memory());
    iomodels::iomanager::instance().get_stdout()->save(executor->get_shared_memory());
    executor->execute_target();
    iomodels::iomanager::instance().clear_trace();
    iomodels::iomanager::instance().get_stdin()->clear();
    iomodels::iomanager::instance().get_stdout()->clear();
    iomodels::iomanager::instance().load_results(executor->get_shared_memory());
}


void benchmark_executor_via_shared_memory::on_io_config_changed()
{
    executor->get_shared_memory().clear();
    executor->init_shared_memory(iomodels::iomanager::instance().get_config().required_shared_memory_size());
    executor->set_timeout(iomodels::iomanager::instance().get_config().max_exec_milliseconds);
}


}
