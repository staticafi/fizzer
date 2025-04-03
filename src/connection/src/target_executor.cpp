#include <connection/target_executor.hpp>
#include <boost/process.hpp>


/* boost process wait_for waits for the full duration if the process exited 
before wait_for (https://github.com/boostorg/process/issues/69) 
the wrapper is a workaround for this issue */
template <typename Rep, typename Period>
static bool wait_for_wrapper(boost::process::child& process, const std::chrono::duration<Rep, Period>& rel_time)
{
    if (process.running()) {
        return process.wait_for(rel_time);
    }
    return true;
}


namespace connection {


target_executor::target_executor(std::string const&  path_to_target, natural_16_bit const  max_exec_milliseconds)
    : m_path_to_target{ path_to_target }
    , m_max_exec_milliseconds{ max_exec_milliseconds }
{}


target_executor::~target_executor()
{}


process_termination  target_executor::run()
{
    process_termination  info;
    {
        namespace bp = boost::process;
        using namespace std::chrono_literals;
        bp::child target = bp::child(m_path_to_target, bp::std_out > bp::null, bp::std_err > bp::null);
        if (!wait_for_wrapper(target, std::chrono::milliseconds(m_max_exec_milliseconds)))
        {
            target.terminate();
            info.killed = true;
        }
        else
            info.killed = false;
        info.exit_code = target.exit_code();
    }
    return info;
}


}
