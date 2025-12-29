#ifndef FUZZING_STRATEGY_NAVIGATOR_AUTOMATON_HPP_INCLUDED
#   define FUZZING_STRATEGY_NAVIGATOR_AUTOMATON_HPP_INCLUDED

#   include <fuzzing/strategy/value_and_node.hpp>
#   include <fuzzing/strategy/extrapolation.hpp>
#   include <fuzzing/basic_types.hpp>
#   include <utility/std_pair_hash.hpp>
#   include <unordered_map>
#   include <unordered_set>
#   include <vector>
#   include <array>
#   include <cstdint>

namespace  fuzzing {


struct  branching_node;


struct  navigator_automaton
{
    using  edge_type = std::pair<location_id, location_id>;
    using  edge_counters = std::unordered_map<edge_type, natural_32_bit>;
    using  edge_counters_constraint = std::pair<edge_type, edge_type>;

    navigator_automaton(std::vector<value_and_node> const&  values_and_nodes);
    bool  valid() const { return true; }
    branching_node*  run(branching_node*  root, float_64_bit  value);

    // These methods are here for progress recording.
    std::unordered_map<edge_type, extrapolation_line> const&  get_extrapolations() const { return extrapolations; }
    std::unordered_map<edge_type, float_64_bit> const&  get_errors() const { return errors; }
    std::unordered_set<edge_counters_constraint> const&  get_constraints() const { return constraints; }
    edge_counters const&  get_target_counters() const { return target_counters; }
    edge_counters const&  get_best_counters() const { return best_counters; }

private:

    void  generate_constraints(std::vector<edge_counters>&  counters_vector);
    void  apply_constraints(edge_counters&  counters);

    std::unordered_map<edge_type, extrapolation_line>  extrapolations;
    std::unordered_map<edge_type, float_64_bit>  errors;
    std::unordered_set<edge_counters_constraint>  constraints;
    // Data below are here only for progress recording
    edge_counters  target_counters;
    edge_counters  best_counters;
};


}

#endif
