#ifndef COM_ATOMIC_PREDICATE_HPP_INCLUDED
#   define COM_ATOMIC_PREDICATE_HPP_INCLUDED

#   include <utility/basic_numeric_types.hpp>

namespace  com {


enum struct atomic_predicate : natural_8_bit
{
    EQUAL           = 0,
    UNEQUAL         = 1,
    LESS            = 2,
    LESS_EQUAL      = 3,
    GREATER         = 4,
    GREATER_EQUAL   = 5
};

atomic_predicate opposite_predicate(atomic_predicate  predicate);

inline natural_8_bit  to_predicate_id(atomic_predicate const  type) { return (natural_8_bit)type; }
atomic_predicate  from_predicate_id(natural_8_bit  id);


}

#endif
