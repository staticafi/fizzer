#ifndef COM_EXECUTION_TRACE_HPP_INCLUDED
#   define COM_EXECUTION_TRACE_HPP_INCLUDED

#   include <com/atomic_predicate.hpp>
#   include <utility/basic_numeric_types.hpp>
#   include <utility/smart_ptr_wrapper.hpp>
#   include <unordered_set>
#   include <vector>
#   include <memory>

namespace  com {


using  location_id = natural_32_bit;
using  branching_value = float_64_bit;


struct  trace_item
{
    explicit  trace_item(
        location_id const  id_,
        bool  direction_,
        branching_value  value_,
        bool xor_like_branching_function_,
        atomic_predicate predicate_,
        natural_64_bit  num_input_bytes_
        );

    location_id  id;
    bool  direction;
    branching_value  value;
    bool xor_like_branching_function;
    atomic_predicate predicate;
    natural_64_bit  num_input_bytes;
    unique_ptr_wrapper<std::unordered_set<natural_32_bit> >  sensitive_bits_ptr;
};


using  execution_trace = std::vector<trace_item>;
using  execution_trace_ptr = shared_ptr_wrapper<execution_trace>;


inline location_id  invalid_location_id() { return 0U; }
bool  equivalent(trace_item const&  l, trace_item const&  r);
natural_64_bit  compute_path_hash(execution_trace const&  trace);
natural_64_bit  compute_weak_path_hash(execution_trace const&  trace);
natural_64_bit  compute_weakest_path_hash(execution_trace const&  trace);


}

#endif
