#ifndef FUZZING_BITSHARE_ANALYSIS_HPP_INCLUDED
#   define FUZZING_BITSHARE_ANALYSIS_HPP_INCLUDED

#   include <fuzzing/basic_types.hpp>
#   include <fuzzing/branching_node.hpp>
#   include <unordered_map>
#   include <array>
#   include <deque>


namespace  fuzzing {


struct  bitshare_analysis
{
    enum  STATE
    {
        READY,
        BUSY
    };

    struct cache_item
    {
        vecb  bits;
        input_types_ptr  types;
        input_metadata_ptr  metadata;
    };

    struct  performance_statistics
    {
        std::size_t  generated_inputs{ 0 };
        std::size_t  hits{ 0 };
        std::size_t  misses{ 0 };
        std::size_t  start_calls{ 0 };
        std::size_t  stop_calls_regular{ 0 };
        std::size_t  stop_calls_early{ 0 };
        std::size_t  stop_calls_instant{ 0 };
        std::size_t  num_locations{ 0 };
        std::size_t  num_insertions{ 0 };
        std::size_t  num_deletions{ 0 };
    };

    bitshare_analysis();

    bool  is_ready() const { return state == READY; }
    bool  is_busy() const { return state == BUSY; }

    branching_node*  get_node() const { return processed_node; }

    void  start(branching_node*  node_ptr, natural_32_bit  execution_id_);
    void  stop();

    bool  generate_next_input(vecb&  bits_ref, input_types_ptr&  types_ref, input_metadata_ptr&  metadata_ref);
    void  process_execution_results(execution_trace_ptr  trace_ptr);

    void  bits_available_for_branching(branching_node*  node_ptr, execution_trace_ptr  trace, typed_input_ptr  current_input);

    performance_statistics const&  get_statistics() const { return statistics; }

private:

    static constexpr std::size_t  max_deque_size = 10;

    STATE  state;
    std::unordered_map<location_id, std::array<std::deque<cache_item>, 2> >  cache;
    branching_node*  processed_node;
    std::deque<cache_item>*  samples_ptr;
    std::size_t  sample_index;
    natural_32_bit  execution_id;
    performance_statistics  statistics;
};


}

#endif
