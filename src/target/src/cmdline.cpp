#include <target/driver.hpp>
#include <com/execution_trace.hpp>
#include <utility/basic_numeric_types.hpp>

extern "C" {


unsigned char  __fizzer_private_io_model_cmdline_read_argc(void)
{
    std::lock_guard<std::mutex> const lock(mutex());
    unsigned char  argc;
    check(io_cmdline().on_argc(&argc, medium()));
    return argc;
}


char  __fizzer_private_io_model_cmdline_read_char(void)
{
    std::lock_guard<std::mutex> const lock(mutex());
    char  c;
    check(io_cmdline().on_char(&c, medium()));
    return c;
}


}
