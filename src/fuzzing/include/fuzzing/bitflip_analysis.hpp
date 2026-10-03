#ifndef FUZZING_BITFLIP_ANALYSIS_HPP_INCLUDED
#   define FUZZING_BITFLIP_ANALYSIS_HPP_INCLUDED

#   include <fuzzing/basic_types.hpp>
#   include <fuzzing/branching_node.hpp>
#   include <utility/std_pair_hash.hpp>
#   include <utility/random.hpp>
#   include <unordered_set>
#   include <vector>

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

    void  start(
            std::unordered_set<branching_node*> const&  leaf_branchings,
            std::unordered_set<location_and_direction> const& uncovered_branchings
            );
    void  stop();

    bool  generate_next_input(vecb&  bits_ref, input_types_ptr&  types_ref, input_metadata_ptr&  metadata_ref);

    performance_statistics const&  get_statistics() const { return statistics; }

private:

    void  select_node(
        std::unordered_set<branching_node*> const&  leaf_branchings,
        std::unordered_set<location_and_direction> const& uncovered_branchings
        );
    void  generate_bit_flips();
    void  generate_bit_flips_sensitive();
    void  generate_value_changes();
    void  generate_value_changes_sensitive();

    template<typename T, int N>
    bool  write_bits(vecb&  bits_ref, T const  (&values)[N]);

    struct ValueChange
    {
        std::uint32_t  start_bit_index;
        vecb  bits;
    };

    using BitFlips = std::unordered_set<std::uint32_t>;

    STATE  state;
    branching_node*  node_ptr;
    typed_input_ptr  input_ptr;
    std::vector<BitFlips>  bit_flips;
    std::vector<ValueChange>  value_changes;
    random_generator_for_natural_32_bit  rnd_generator;

    performance_statistics  statistics;
};


}

#endif
