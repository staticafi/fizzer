#include <cpseval/program_info.hpp>

std::string  get_program_name()
{
    return "CPSeval";
}

std::string  get_program_version()
{
    return "0.1";
}

std::string  get_program_description()
{
    return "Applies CPS to problems detected in target binary based on its test-suite in Test-Comp format.";
}
