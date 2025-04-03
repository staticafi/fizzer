#include <com/atomic_predicate.hpp>
#include <utility/invariants.hpp>

namespace com {


atomic_predicate opposite_predicate(atomic_predicate  predicate)
{
    switch (predicate)
    {
        case atomic_predicate::EQUAL: return atomic_predicate::UNEQUAL;
        case atomic_predicate::UNEQUAL: return atomic_predicate::EQUAL;
        case atomic_predicate::LESS: return atomic_predicate::GREATER_EQUAL;
        case atomic_predicate::LESS_EQUAL: return atomic_predicate::GREATER;
        case atomic_predicate::GREATER: return atomic_predicate::LESS_EQUAL;
        case atomic_predicate::GREATER_EQUAL: return atomic_predicate::LESS;
        default: UNREACHABLE();
    }
}


atomic_predicate  from_predicate_id(natural_8_bit const  id)
{
    switch (id)
    {
        case 0U: return atomic_predicate::EQUAL;
        case 1U: return atomic_predicate::UNEQUAL;
        case 2U: return atomic_predicate::LESS;
        case 3U: return atomic_predicate::LESS_EQUAL;
        case 4U: return atomic_predicate::GREATER;
        case 5U: return atomic_predicate::GREATER_EQUAL;
        default: { UNREACHABLE(); return atomic_predicate::EQUAL; }
    }
}


}
