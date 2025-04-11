#include <com/mut_type.hpp>
#include <utility/invariants.hpp>

namespace com {


mut_type  from_mut_id(natural_8_bit const  id)
{
    switch (id)
    {
        case 0U: return mut_type::WITH_ARGS;
        case 1U: return mut_type::NO_ARGS;
        default: { UNREACHABLE(); return mut_type::NO_ARGS; }
    }
}


}
