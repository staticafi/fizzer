#include <target/driver.hpp>
#include <sys/resource.h>
#include <iostream>
#if PLATFORM() == PLATFORM_LINUX()
    #include <sys/prctl.h>
    #include <stdio.h>
#endif

extern "C" {
    int  __fizzer_private_entry_function();
}

int main(int argc, char* argv[])
{
    struct rlimit rl;
    const rlim_t stack_size = 64L * 1024L * 1024L;
    if (getrlimit(RLIMIT_STACK, &rl) == 0 && rl.rlim_cur < stack_size)
    {
        rl.rlim_cur = stack_size;
        setrlimit(RLIMIT_STACK, &rl);
    }

    /* disable core dumps as this significantly slows down the termination 
    in case of a crash */
    #if PLATFORM() == PLATFORM_LINUX()
        if (prctl(PR_SET_DUMPABLE, 0) != 0) {
            std::cerr << "Failed to set dumpable flag\n";
        }
    #endif

    if (!driver().valid())
        return 1;

    int retval = __fizzer_private_entry_function();

    set_termination(com::target_termination::NORMAL);

    return retval;
}
