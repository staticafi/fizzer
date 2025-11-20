#ifndef FUZZING_BITFLIP_ANALYSIS_HPP_INCLUDED
#   define FUZZING_BITFLIP_ANALYSIS_HPP_INCLUDED

#   include <fuzzing/basic_types.hpp>
#   include <fuzzing/branching_node.hpp>
#   include <utility/random.hpp>
#   include <unordered_set>

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

    branching_node*  get_node() const { return node_ptr; }

    void  start(branching_node*  root_node);
    void  stop();

    bool  generate_next_input(vecb&  bits_ref, input_types_ptr&  types_ref, input_metadata_ptr&  metadata_ref);

    performance_statistics const&  get_statistics() const { return statistics; }

private:
    branching_node*  search_for_current_input(branching_node* const  root);

    bool  is_mutated_bit_index_valid() const;
    bool  is_mutated_type_index_valid() const;
    bool  generate_next_typed_value(vecb&  bits_ref);

    template<typename T, int N>
    bool  write_bits(vecb&  bits_ref, T const  (&values)[N]);

    STATE  state;
    branching_node*  node_ptr;
    typed_input_ptr  current_input;
    natural_32_bit  mutated_bit_index;
    natural_32_bit  mutated_type_index;
    natural_32_bit  mutated_value_index;
    natural_32_bit  probed_bit_start_index;
    natural_32_bit  probed_bit_end_index;
    natural_32_bit  counter;
    std::unordered_set<typed_input const*>  processed_inputs;
    random_generator_for_natural_32_bit  rnd_generator;

    performance_statistics  statistics;
};


}

#endif
