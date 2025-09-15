#include <cpseval/program_options.hpp>
#include <cpseval/program_info.hpp>
#include <fuzzing/target_executor.hpp>
#include <iomodels/cmdline.hpp>
#include <connection/target_executor.hpp>
#include <fuzzing/termination_info.hpp>
#include <fuzzing/optimizer.hpp>
#include <utility/assumptions.hpp>

program_options::program_options(int argc, char* argv[])
    : program_options_default(argc, argv)
{
    add_option("path_to_target", "Path to target executable.", "1");
    add_option("path_to_sala", "Path to sala program (semantically equivalent to the target executable).", "1");
    add_option("path_to_tests", "Path to test-suite in Test-Comp format to be used for detection of coverage problems.", "1");
    add_option("max_exec_milliseconds", "Max number of milliseconds for target execution during fuzzing.", "1");
        add_value("max_exec_milliseconds", std::to_string(connection::target_executor::default_max_exec_milliseconds));
    add_option("max_exec_megabytes", "Max number of mega bytes the target can allocate during execution.", "1");
        add_value("max_exec_megabytes", std::to_string(fuzzing::target_executor::default_max_exec_megabytes));
    add_option("max_trace_length", "Max number of branchings in a trace during execution.", "1");
        add_value("max_trace_length", std::to_string(fuzzing::target_executor::default_max_trace_length));
    add_option("max_bytes", "Max number of input bytes produced by the 'simple' IO model during execution.", "1");
        add_value("max_bytes", std::to_string(iomodels::simple::default_max_bytes));
}

static program_options_ptr  global_program_options;

void initialise_program_options(int argc, char* argv[])
{
    ASSUMPTION(!global_program_options.operator bool());
    global_program_options = program_options_ptr(new program_options(argc,argv));
}

program_options_ptr get_program_options()
{
    ASSUMPTION(global_program_options.operator bool());
    return global_program_options;
}

std::ostream& operator<<(std::ostream& ostr, program_options_ptr const& options)
{
    ASSUMPTION(options.operator bool());
    options->operator<<(ostr);
    return ostr;
}
