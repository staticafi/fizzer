#include <utility/basic_numeric_types.hpp>
#include <instrumentation/instrumentation_types.hpp>
#include <instrumentation/fuzz_target.hpp>
#include <utility/invariants.hpp>
#include <cmath>

using namespace instrumentation;

extern "C" {

void __fizzer_process_condition(
        location_id const  id,
        bool const  direction,
        branching_function_value_type const   value,
        bool const  xor_like_branching_function,
        natural_8_bit const  predicate
        ) {
    fizzer_target->process_condition(id, direction, value, xor_like_branching_function, predicate);
}

}