#ifndef IOMODELS_IOMANAGER_HPP_INCLUDED
#   define IOMODELS_IOMANAGER_HPP_INCLUDED

#   include <iomodels/configuration.hpp>
#   include <instrumentation/target_termination.hpp>
#   include <iomodels/stdin_base.hpp>
#   include <iomodels/stdout_base.hpp>
#   include <instrumentation/instrumentation_types.hpp>
#   include <utility/basic_numeric_types.hpp>
#   include <vector>
#   include <string>
#   include <unordered_map>
#   include <unordered_set>
#   include <functional>

namespace  iomodels {


struct  iomanager
{
    static iomanager&  instance();

    configuration const&  get_config() const { return config; }
    void  set_config(configuration const&  cfg);

    instrumentation::target_termination  get_termination() const { return termination; }

    void  load_results(connection::shared_memory& src);
    bool  load_trace_record(connection::shared_memory& src);

    std::vector<instrumentation::branching_coverage_info> const&  get_trace() const { return trace; }
    void  clear_trace();

    stdin_base*  get_stdin() const;
    stdout_base*  get_stdout() const;

    stdin_base_ptr  clone_stdin() const;
    stdout_base_ptr  clone_stdout() const;

private:
    iomanager();

    configuration config;
    instrumentation::target_termination  termination;
    std::vector<instrumentation::branching_coverage_info>  trace;
    mutable stdin_base_ptr  stdin_ptr;
    mutable stdout_base_ptr  stdout_ptr;
};


}

#endif
