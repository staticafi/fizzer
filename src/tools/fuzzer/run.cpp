#include <fuzzer/program_info.hpp>
#include <fuzzer/program_options.hpp>
#include <fuzzing/native_executor.hpp>
#include <fuzzing/sala_executor.hpp>
#include <fuzzing/fuzzing_outcomes.hpp>
#include <fuzzing/fuzzing_loop.hpp>
#include <fuzzing/test_suite_item_writer.hpp>
#include <fuzzing/optimization_outcomes.hpp>
#include <fuzzing/optimizer.hpp>
#include <fuzzing/progress_recorder.hpp>
#include <fuzzing/dump.hpp>
#include <fuzzing/dump_native.hpp>
#include <fuzzing/dump_testcomp.hpp>
#include <sala/program.hpp>
#include <sala/streaming.hpp>
#include <iostream>
#include <fstream>
#include <memory>


void run(int argc, char* argv[])
{
    std::chrono::system_clock::time_point const  start_time_point = std::chrono::system_clock::now();

    const std::string& test_type = get_program_options()->value("test_type");
    if (test_type != "native" && test_type != "testcomp") {
        std::cerr << "ERROR: unknown output type specified. Use native or testcomp.\n";
        return;
    }

    if (get_program_options()->value("output_dir").empty())
    {
        std::cerr << "ERROR: The output directory path is empty.\n";
        return;
    }
    std::filesystem::path output_dir = std::filesystem::absolute(get_program_options()->value("output_dir"));
    {
        std::error_code  ec;
        if (test_type == "testcomp") 
        {
            std::filesystem::create_directories(output_dir / "test-suite", ec);
        }
        else {
            std::filesystem::create_directories(output_dir, ec);
        }
        if (ec)
        {
            std::cerr << "ERROR: Failed to create/access the output directory:\n        " << output_dir << "\n";
            return;
        }
    }
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

    fuzzing::termination_info  terminator{
            .max_executions = (natural_32_bit)std::max(0UL, std::stoul(get_program_options()->value("max_executions"))),
            .max_seconds = (natural_32_bit)std::max(0UL, std::stoul(get_program_options()->value("max_seconds"))),
            };

    natural_32_bit  opt_max_seconds = (natural_32_bit)std::max(0, std::stoi(get_program_options()->value("opt_max_seconds")));

    if (get_program_options()->has("progress_recording")) {
        fuzzing::recorder().start(std::filesystem::absolute(get_program_options()->value("path_to_target")), output_dir);
    }

    std::string  target_name = std::filesystem::path(get_program_options()->value("path_to_target")).filename().string();
    {
        std::string const  target_suffix = "_target";
        std::string::size_type const  suffix_i = target_name.find(target_suffix);
        if (suffix_i != std::string::npos) {
            target_name.erase(suffix_i, target_suffix.length());
        }
    }

    fuzzing::native_executor  native_executor{
            get_program_options()->value("path_to_target"),
            (natural_16_bit)std::max(0UL, std::stoul(get_program_options()->value("max_exec_milliseconds"))),
            (natural_16_bit)std::max(0UL, std::stoul(get_program_options()->value("max_exec_megabytes"))),
            (natural_32_bit)std::max(0UL, std::stoul(get_program_options()->value("max_trace_length"))),
            iomodels::cmdline::create(),
            iomodels::simple::create(
                (natural_64_bit)std::max(0ULL, std::stoull(get_program_options()->value("max_bytes")))
                )
            };
    fuzzing::sala_executor  sala_executor{
            sala_program_ptr,
            (natural_16_bit)std::max(0UL, std::stoul(get_program_options()->value("max_exec_milliseconds"))),
            (natural_16_bit)std::max(0UL, std::stoul(get_program_options()->value("max_exec_megabytes"))),
            (natural_32_bit)std::max(0UL, std::stoul(get_program_options()->value("max_trace_length"))),
            iomodels::cmdline::create(),
            iomodels::simple::create(
                (natural_64_bit)std::max(0ULL, std::stoull(get_program_options()->value("max_bytes")))
                )
            };

    fuzzing::target_executor&   target_executor{
            get_program_options()->has("sala_executor") ? (fuzzing::target_executor&)sala_executor : (fuzzing::target_executor&)native_executor
            };

    fuzzing::local_search_analysis::configuration const  lsa_config{{
        .max_rounds = (std::uint32_t)std::stoi(get_program_options()->value("lsa_max_rounds")),
        .build_local_space = std::stoi(get_program_options()->value("lsa_build_local_space")) != 0,
        .build_constraints = std::stoi(get_program_options()->value("lsa_build_constraints")) != 0,
        .use_gradient_descent = std::stoi(get_program_options()->value("lsa_use_gradient_descent")) != 0,
        .use_bit_flips = std::stoi(get_program_options()->value("lsa_use_bit_flips")) != 0,
        .use_random_fuzzing = std::stoi(get_program_options()->value("lsa_use_random_fuzzing")) != 0,
    }};

    auto const startup_time = std::chrono::duration<float_64_bit>(std::chrono::system_clock::now() - start_time_point).count();

    {
        float_64_bit const  total_time{ std::max((float_64_bit)(terminator.max_seconds + opt_max_seconds), 1.0) };
        float_64_bit const  remaining_time{ std::max(total_time - startup_time, 0.0) };
        terminator.max_seconds = (natural_32_bit)(remaining_time * (terminator.max_seconds / total_time));
        opt_max_seconds = (natural_32_bit)(remaining_time * (opt_max_seconds / total_time));

        if (!get_program_options()->has("silent_mode"))
            std::cout << "\"fuzzing_startup\": {" << std::endl
                      << "    \"time\": " << startup_time << ',' << std::endl
                      << "    \"--max_seconds\": " << terminator.max_seconds << ',' << std::endl
                      << "    \"--opt_max_seconds\": " << opt_max_seconds << std::endl
                      << "}," << std::endl;
    }

    fuzzing::test_suite_item_writer  save_test{
            output_dir,
            target_name,
            get_program_version(),
            test_type == "native"
            };

    if (!get_program_options()->has("silent_mode"))
    {
        std::cout << "\"fuzzing_configuration\": ";
        fuzzing::print_fuzzing_configuration(std::cout, target_name, target_executor, terminator, lsa_config);
        std::cout << ',' << std::endl;
    }
    fuzzing::log_fuzzing_configuration(target_name, target_executor, terminator, lsa_config);
    fuzzing::save_fuzzing_configuration(output_dir, target_name, target_executor, terminator, lsa_config);

    std::vector<fuzzing::test_suite_item_ptr>  inputs_leading_to_boundary_violation;
    fuzzing::fuzzing_outcomes const results = fuzzing::run(
        target_executor,
        sala_program_ptr.get(),
        save_test,
        [&inputs_leading_to_boundary_violation, opt_max_seconds](fuzzing::test_suite_item_ptr const  item) {
                if (opt_max_seconds > 0)
                    inputs_leading_to_boundary_violation.push_back(item);
                },
        terminator,
        lsa_config,
        !get_program_options()->has("silent_mode") && get_program_options()->has("render")
        );

    if (!get_program_options()->has("silent_mode"))
    {
        std::cout << "\"fuzzing_results\": ";
        fuzzing::print_fuzzing_outcomes(std::cout, results);
        std::cout << ',' << std::endl;
    }
    fuzzing::log_fuzzing_outcomes(results);
    fuzzing::save_fuzzing_outcomes(output_dir, target_name, results);

    fuzzing::recorder().stop();

    if (!inputs_leading_to_boundary_violation.empty() && opt_max_seconds > 0)
    {
        native_executor.io_simple().set_max_bytes(
            (natural_64_bit)std::max(0ULL, std::stoull(get_program_options()->value("opt_max_bytes")))
            );
        native_executor.executor().set_max_exec_milliseconds(
            (natural_16_bit)std::max(0UL, std::stoul(get_program_options()->value("opt_max_exec_milliseconds")))
            );
        native_executor.set_max_exec_megabytes(
            (natural_16_bit)std::max(0UL, std::stoul(get_program_options()->value("opt_max_exec_megabytes")))
            );
        native_executor.set_max_trace_length(
            (natural_32_bit)std::max(0UL, std::stoul(get_program_options()->value("opt_max_trace_length")))
            );
        native_executor.get_medium().set_size(native_executor.compute_max_medium_size());

        if (!get_program_options()->has("silent_mode"))
        {
            std::cout << "\"optimization_configuration\": ";
            fuzzing::print_optimization_configuration(std::cout, target_name, native_executor, opt_max_seconds);
            std::cout << ',' << std::endl;
        }
        fuzzing::log_optimization_configuration(target_name, native_executor, opt_max_seconds);
        fuzzing::save_optimization_configuration(output_dir, target_name, native_executor, opt_max_seconds);

        fuzzing::optimizer  opt{};
        fuzzing::optimization_outcomes const  opt_results = opt.run(
                inputs_leading_to_boundary_violation,
                results.covered_branchings,
                results.uncovered_branchings,
                opt_max_seconds,
                native_executor,
                save_test
                );

        if (!get_program_options()->has("silent_mode"))
        {
            std::cout << "\"optimization_results\": ";
            fuzzing::print_optimization_outcomes(std::cout, opt_results);
        }
        fuzzing::log_optimization_outcomes(opt_results);
        fuzzing::save_optimization_outcomes(output_dir, target_name, opt_results);
    }
}
