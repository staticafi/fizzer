#include <fuzzer/program_info.hpp>

std::string  get_program_name()
{
    return "squirrel";
}

std::string  get_program_version()
{
    return "0.1";
}

std::string  get_program_description()
{
    return "Searches for a feasible path in CFG reaching given basic block.";
}
