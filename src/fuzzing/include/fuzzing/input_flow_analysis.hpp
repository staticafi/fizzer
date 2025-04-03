#ifndef FUZZING_INPUT_FLOW_ANALYSIS_HPP_INCLUDED
#   define FUZZING_INPUT_FLOW_ANALYSIS_HPP_INCLUDED

#   include <fuzzing/basic_types.hpp>
#   include <fuzzing/branching_node.hpp>
#   include <iomodels/cmdline.hpp>
#   include <iomodels/simple.hpp>
#   include <sala/program.hpp>
#   include <unordered_set>
#   include <map>
#   include <set>
#   include <memory>

namespace  fuzzing {


struct target_executor;


struct  input_flow_analysis
{
    struct  computation_io_data
    {
        // Input
        typed_input_ptr  input_ptr{ nullptr };
        execution_trace_ptr  trace_ptr{ nullptr };
        trace_index_type  trace_size{ 0U };

        // Output
        std::vector<std::unordered_set<natural_32_bit> >  sensitive_bits{};
    };

    struct  performance_statistics
    {
        std::size_t  num_successes{ 0 };
        std::size_t  num_failures{ 0 };
        std::unordered_set<std::string>  errors{};
        std::unordered_set<std::string>  warnings{};
        std::map<std::pair<trace_index_type,natural_32_bit>, std::set<float_64_bit> >  complexity{};
    };

    input_flow_analysis(sala::Program const* sala_program_ptr, target_executor const* const  tgt_exec);

    void  run(computation_io_data*  data_ptr_, std::function<bool(std::string&)> const&  terminator);

    computation_io_data const&  data() const { return *data_ptr; }
    computation_io_data&  data() { return *data_ptr; }

    performance_statistics const&  get_statistics() const { return statistics; }

private:

    struct input_flow;

    sala::Program const* program_ptr;
    natural_32_bit  m_max_trace_length;
    natural_16_bit  m_max_exec_megabytes;
    iomodels::cmdline_ptr  m_io_cmdline;
    iomodels::simple_ptr  m_io_simple;
    computation_io_data*  data_ptr;

    performance_statistics  statistics;
};


}

#endif
