#ifndef FUZZING_DUMP_HPP_INCLUDED
#   define FUZZING_DUMP_HPP_INCLUDED

#   include <fuzzing/fuzzing_outcomes.hpp>
#   include <fuzzing/optimization_outcomes.hpp>
#   include <fuzzing/termination_info.hpp>
#   include <string>
#   include <iosfwd>
#   include <filesystem>

namespace  fuzzing {


void  print_fuzzing_configuration(
        std::ostream&  ostr,
        std::string const&  benchmark,
        target_executor const&  executor,
        termination_info const&  terminator,
        local_search_analysis::configuration const&  lsa_config
        );
void  log_fuzzing_configuration(
        std::string const&  benchmark,
        target_executor const&  executor,
        termination_info const&  terminator,
        local_search_analysis::configuration const&  lsa_config
        );
void  save_fuzzing_configuration(
        std::filesystem::path const&  output_dir,
        std::string const&  benchmark,
        target_executor const&  executor,
        termination_info const&  terminator,
        local_search_analysis::configuration const&  lsa_config
        );

void  print_fuzzing_outcomes(std::ostream&  ostr, fuzzing_outcomes const&  results);
void  log_fuzzing_outcomes(fuzzing_outcomes const&  results);
void  save_fuzzing_outcomes(
        std::filesystem::path const&  output_dir,
        std::string const&  benchmark,
        fuzzing_outcomes const&  results
        );

void  print_optimization_configuration(
        std::ostream&  ostr,
        std::string const&  benchmark,
        target_executor const&  executor,
        natural_32_bit  opt_max_num_seconds
        );
void  log_optimization_configuration(
        std::string const&  benchmark,
        target_executor const&  executor,
        natural_32_bit  opt_max_num_seconds
        );
void  save_optimization_configuration(
        std::filesystem::path const&  output_dir,
        std::string const&  benchmark,
        target_executor const&  executor,
        natural_32_bit  opt_max_num_seconds
        );
void  print_optimization_outcomes(std::ostream&  ostr, optimization_outcomes const&  results);
void  log_optimization_outcomes(optimization_outcomes const&  results);
void  save_optimization_outcomes(
        std::filesystem::path const&  output_dir,
        std::string const&  benchmark,
        optimization_outcomes const&  results
        );


}

#endif
