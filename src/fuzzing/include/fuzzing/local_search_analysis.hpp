#ifndef FUZZING_LOCAL_SEARCH_ANALYSIS_HPP_INCLUDED
#   define FUZZING_LOCAL_SEARCH_ANALYSIS_HPP_INCLUDED

#   include <fuzzing/basic_types.hpp>
#   include <fuzzing/branching_node.hpp>
#   include <cps/solver.hpp>
#   include <vector>
#   include <memory>

namespace  fuzzing {


struct  local_search_analysis
{
    enum  STATE
    {
        READY,
        BUSY
    };

    struct configuration : public cps::Config {};

    struct  performance_statistics
    {
        std::size_t  generated_inputs{ 0 };
        std::size_t  start_calls{ 0 };
        std::size_t  stop_calls_regular{ 0 };
        std::size_t  stop_calls_early{ 0 };
        std::size_t  stop_calls_failed{ 0 };
    };

    local_search_analysis();

    bool  is_ready() const { return state == READY; }
    bool  is_busy() const { return state == BUSY; }

    void  start(branching_node*  node_ptr, natural_32_bit  execution_id_);
    void  stop();

    bool  generate_next_input(vecb&  bits_ref, input_types_ptr&  types_ref, input_metadata_ptr&  metadata_ref);
    void  process_execution_results(execution_trace_ptr  trace_ptr, typed_input_ptr  current_input_ptr);

    branching_node*  get_node() const { return node; }

    std::string  get_progress_message() const;
    performance_statistics const&  get_statistics() const { return statistics; }

private:

    STATE  state;
    configuration config;
    branching_node*  node;
    typed_input_ptr  current_input;
    natural_32_bit  execution_id;
    std::vector<natural_32_bit> type_indices;
    std::unique_ptr<cps::Solver> solver;
    performance_statistics  statistics;
};


}

#endif
