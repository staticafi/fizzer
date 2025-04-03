#include <com/execution_trace.hpp>
#include <utility/hash_combine.hpp>

namespace com {


trace_item::trace_item(
        location_id const  id_,
        bool  direction_,
        branching_value  value_,
        bool xor_like_branching_function_,
        atomic_predicate predicate_,
        natural_64_bit  num_input_bytes_
        )
    : id{ id_ }
    , direction{ direction_ }
    , value{ value_ }
    , xor_like_branching_function{ xor_like_branching_function_ }
    , predicate{ predicate_ }
    , num_input_bytes{ num_input_bytes_ } 
{}


bool  equivalent(trace_item const&  l, trace_item const&  r)
{
    return l.id == r.id && l.direction == r.direction;
}


natural_64_bit  compute_path_hash(execution_trace const&  trace)
{
    natural_64_bit  result{ 0UL };
    for (auto const&  item : trace)
 {
        hash_combine(result, (natural_64_bit)item.id);
        hash_combine(result, (natural_64_bit)(item.direction ? 1033UL : 7919UL));
    }
    return result;
}


}
