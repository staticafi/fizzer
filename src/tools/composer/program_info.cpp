#include <composer/program_info.hpp>

std::string  get_program_name()
{
    return "composer";
}

std::string  get_program_version()
{
    return "0.1";
}

std::string  get_program_description()
{
    return "Composes the passed .ll file of the analyzed program\n"
           "with Fizzer's models of standard functions. The output\n"
           "is another .ll file.\n";
}
