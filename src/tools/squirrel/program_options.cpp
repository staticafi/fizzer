#include <squirrel/program_options.hpp>
#include <squirrel/program_info.hpp>
#include <utility/assumptions.hpp>

program_options::program_options(int argc, char* argv[])
    : program_options_default(argc, argv)
{
    add_option("sala", "Path to input sala program to be analyzed.", "1");
    add_value("sala", "./in/a_sala.json");
    add_option("fn", "Name of the target function.", "1");
    add_value("fn", "__target__");
    add_option("bb", "Index of the basic block in the target function to be reached.", "1");
    add_value("bb", "0");
    add_option("out", "A directory where to store results.", "1");
    add_value("out", "./out/");
    add_option("tmp", "A directory where to store results.", "1");
    add_value("tmp", "./tmp/");
    add_option("timeout", "Total number of seconds (integer) available for the analysis.", "1");
    add_value("timeout", std::to_string(5ULL * 60ULL)); // 5 minutes
    add_option("memout", "Total number of bytes (integer) available for the analysis.", "1");
    add_value("memout", std::to_string(5ULL * 1024ULL * 1024ULL * 1024ULL)); // 5 GB
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
