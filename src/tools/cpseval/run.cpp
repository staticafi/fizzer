#include <cpseval/program_info.hpp>
#include <cpseval/program_options.hpp>
#include <fuzzing/target_executor.hpp>
#include <sala/program.hpp>
#include <sala/streaming.hpp>
#include <com/mut_type.hpp>
#include <iostream>
#include <filesystem>
#include <fstream>
#include <memory>


void run(int argc, char* argv[])
{
    if (!get_program_options()->has("path_to_target")) {
        std::cerr << "ERROR: The path to target is empty.\n";
        return;
    }
    if (!std::filesystem::is_regular_file(get_program_options()->value("path_to_target")))
    {
        std::cerr << "ERROR: The passed target path '"
                    << get_program_options()->value("path_to_target")
                    << "' does not reference a regular file.\n";
        return;
    }
    std::filesystem::perms const perms = std::filesystem::status(get_program_options()->value("path_to_target")).permissions();
    if ((perms & std::filesystem::perms::owner_exec) == std::filesystem::perms::none)
    {
        std::cerr << "ERROR: The passed target path '"
                    << get_program_options()->value("path_to_target")
                    << "' references a file which is NOT executable.\n";
        return;
    }

    std::shared_ptr<sala::Program> sala_program_ptr;
    {
        std::filesystem::path  sala_program_path;
        if (get_program_options()->has("path_to_sala"))
            sala_program_path = get_program_options()->value("path_to_sala");
        else if (get_program_options()->value("path_to_target").ends_with("_target"))
            sala_program_path = get_program_options()->value("path_to_target").substr(0,
                    get_program_options()->value("path_to_target").rfind("_target")
                    ) + "_instrumented.json";
        if (sala_program_path.empty())
            std::cerr << "WARNING: The path to sala program is empty.\n";
        else if (!std::filesystem::is_regular_file(sala_program_path))
        {
            if (get_program_options()->has("path_to_sala"))
                std::cerr << "WARNING: The passed sala program '" << sala_program_path << "' does not reference a regular file.\n";
        }
        else
        {
            sala_program_ptr = std::make_shared<sala::Program>();
            std::ifstream istr(sala_program_path.c_str(), std::ios_base::binary);
            istr >> *sala_program_ptr;
        }
    }

    com::mut_type  mut_type;
    {
        std::string const mut_name{ sala_program_ptr->functions().at(sala_program_ptr->entry_function()).name() };
        if (mut_name == "__fizzer_private_entry_function")
            mut_type = com::mut_type::NO_ARGS;
        else if (mut_name == "__fizzer_private_entry_function_with_params")    
            mut_type = com::mut_type::WITH_ARGS;
        else
        {
            std::cerr << "ERROR: Unsupported format of program's entry function.\n";
            return;
        }
    }

    std::string  target_name = std::filesystem::path(get_program_options()->value("path_to_target")).filename().string();
    {
        std::string const  target_suffix = "_target";
        std::string::size_type const  suffix_i = target_name.find(target_suffix);
        if (suffix_i != std::string::npos) {
            target_name.erase(suffix_i, target_suffix.length());
        }
    }

    fuzzing::target_executor  target_executor{
            get_program_options()->value("path_to_target"),
            (natural_16_bit)std::max(0UL, std::stoul(get_program_options()->value("max_exec_milliseconds"))),
            (natural_16_bit)std::max(0UL, std::stoul(get_program_options()->value("max_exec_megabytes"))),
            (natural_32_bit)std::max(0UL, std::stoul(get_program_options()->value("max_trace_length"))),
            mut_type,
            iomodels::cmdline::create(),
            iomodels::simple::create(
                (natural_64_bit)std::max(0ULL, std::stoull(get_program_options()->value("max_bytes")))
                )
            };

    // TODO!
}
