#include <fuzzer/program_info.hpp>

std::string  get_program_name()
{
    return "Fuzzer";
}

std::string  get_program_version()
{
    return "0.1";
}

std::string  get_program_description()
{
    return "Executes target binary with generated inputs.";
}
