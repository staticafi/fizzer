#include <target/driver.hpp>
#include <com/execution_trace.hpp>
#include <utility/basic_numeric_types.hpp>

extern "C" {


unsigned char  __fizzer_io_model_cmdline_read_argc()
{
    std::lock_guard<std::mutex> const lock(mutex());
    unsigned char  argc;
    check(io_cmdline().on_argc((natural_8_bit*)&argc, medium()));
    return argc;
}


unsigned short  __fizzer_io_model_cmdline_read_len(unsigned char const  i)
{
    std::lock_guard<std::mutex> const lock(mutex());
    unsigned short  len;
    check(io_cmdline().on_len((natural_16_bit*)&len, i, medium()));
    return len;
}


char  __fizzer_io_model_cmdline_read_char(unsigned char const  i, unsigned short const  j)
{
    std::lock_guard<std::mutex> const lock(mutex());
    char  c;
    check(io_cmdline().on_char((natural_8_bit*)&c, i, j, medium()));
    return c;
}


}
