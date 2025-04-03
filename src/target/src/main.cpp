#include <target/driver.hpp>
#include <sys/resource.h>
#include <iostream>
#if PLATFORM() == PLATFORM_LINUX()
    #include <sys/prctl.h>
    #include <stdio.h>
#endif

extern "C" {
    void __fizzer_method_under_test();
    void __fizzer_method_under_test_with_params(int argc, char* argv[]);
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

    switch (mut())
    {
        case com::mut_type::RET_Y_ARGS_Y:
            {
                int argc_;
                char** argv_;
                check(io_cmdline().on_arguments_requested(argc_, argv_, medium()));
                __fizzer_method_under_test_with_params(argc_, argv_);
            }
            break;
        case com::mut_type::RET_Y_ARGS_N:
            __fizzer_method_under_test();
            break;
        case com::mut_type::RET_N_ARGS_Y: // TODO!
            set_termination(com::target_termination::ERROR_IN_DATA);
            return 2;
        case com::mut_type::RET_N_ARGS_N: // TODO!
            set_termination(com::target_termination::ERROR_IN_DATA);
            return 3;
        default:
            set_termination(com::target_termination::ERROR_IN_DATA);
            return 4;
    }

    set_termination(com::target_termination::NORMAL);

    return 0;
}
