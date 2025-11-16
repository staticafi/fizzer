#ifndef FUZZING_BITFLIP_ANALYSIS_HPP_INCLUDED
#   define FUZZING_BITFLIP_ANALYSIS_HPP_INCLUDED

#   include <fuzzing/basic_types.hpp>
#   include <fuzzing/branching_node.hpp>
#   include <unordered_set>
#   include <map>

namespace  fuzzing {


struct  bitflip_analysis
{
    enum  STATE
    {
        READY,
        BUSY
    };

    struct  performance_statistics
    {
        std::size_t  generated_inputs{ 0 };
        std::size_t  max_bits{ 0 };
        std::size_t  start_calls{ 0 };
    };

    bitflip_analysis();

    bool  is_ready() const { return state == READY; }
    bool  is_busy() const { return state == BUSY; }

    void  start();
    void  stop();

    void  on_any_execution_results(branching_node*  leaf);

    bool  generate_next_input(vecb&  bits_ref, input_types_ptr&  types_ref, input_metadata_ptr&  metadata_ref);
    void  process_execution_results(natural_32_bit  num_discovered, natural_32_bit  num_covered);

    performance_statistics const&  get_statistics() const { return statistics; }

private:

    struct input_generator
    {
        explicit  input_generator(typed_input_ptr  input_);

        bool  generate_next_input(vecb&  bits_ref, input_types_ptr&  types_ref, input_metadata_ptr&  metadata_ref);

        bool  is_mutated_bit_index_valid() const;
        bool  is_mutated_type_index_valid() const;
        template<typename T, int N> bool  write_bits(vecb&  bits_ref, T const  (&values)[N]);
        bool  generate_next_typed_value(vecb&  bits_ref);

        typed_input_ptr  get_input() const { return input; }

    private:
        typed_input_ptr  input;
        natural_32_bit  mutated_bit_index;
        natural_32_bit  mutated_type_index;
        natural_32_bit  mutated_value_index;
        natural_32_bit  probed_bit_start_index;
        natural_32_bit  probed_bit_end_index;
    };

    struct task
    {
        explicit task(typed_input_ptr  input_);
        input_generator  generator;
        natural_32_bit  turn_buffer;
    };

    using  tasks_map = std::map<branching_node*, task>;
    using  tasks_iterator = std::map<branching_node*, task>::iterator;

    STATE  state;
    tasks_map  tasks;
    tasks_iterator  current;
    std::unordered_set<branching_node*>  seen_nodes;

    performance_statistics  statistics;
};


}

#endif
