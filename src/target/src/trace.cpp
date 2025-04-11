#include <target/driver.hpp>
#include <com/execution_trace.hpp>
#include <utility/basic_numeric_types.hpp>

extern "C" {


void __fizzer_process_condition(
        com::location_id const  id,
        bool const  direction,
        com::branching_value const  value,
        bool const  xor_like_branching_function,
        natural_8_bit const  predicate
        )
{
    std::lock_guard<std::mutex> const lock(mutex());
    check(driver().on_location_hit(
            id,
            direction,
            value,
            xor_like_branching_function,
            com::from_predicate_id(predicate)
        ));
}


}
