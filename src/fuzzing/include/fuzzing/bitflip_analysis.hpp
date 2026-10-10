#ifndef FUZZING_BITFLIP_ANALYSIS_HPP_INCLUDED
#   define FUZZING_BITFLIP_ANALYSIS_HPP_INCLUDED

#   include <fuzzing/basic_types.hpp>
#   include <fuzzing/branching_node.hpp>
#   include <utility/random.hpp>
#   include <unordered_map>

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
        std::size_t  num_bitflips_regular{ 0 };
        std::size_t  num_value_changes_regular{ 0 };
        std::size_t  num_bitflips_random{ 0 };
        std::size_t  num_value_changes_random{ 0 };
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

    struct ValueChange
    {
        std::uint32_t  start_bit_index;
        vecb  bits;
    };

    using BitFlips = std::unordered_set<std::uint32_t>;

    branching_node*  search_for_current_input(branching_node* const  root);
    void  generate_bit_flips_regular();
    void  generate_bit_flips_random();
    void  generate_value_changes_regular();
    void  generate_value_changes_random();

    STATE  state;
    branching_node*  node_ptr;
    typed_input_ptr  current_input;
    std::vector<BitFlips>  bit_flips;
    std::vector<ValueChange>  value_changes;
    std::unordered_map<typed_input_ptr, natural_32_bit>  processed_inputs;
    random_generator_for_natural_32_bit  rnd_generator;

    performance_statistics  statistics;
};


}

#endif
