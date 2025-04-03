#include <com/mut_type.hpp>
#include <utility/invariants.hpp>

namespace com {


mut_type  from_mut_id(natural_8_bit const  id)
{
    switch (id)
    {
        case 0U: return mut_type::RET_Y_ARGS_Y;
        case 1U: return mut_type::RET_Y_ARGS_N;
        case 2U: return mut_type::RET_N_ARGS_Y;
        case 3U: return mut_type::RET_N_ARGS_N;
        default: { UNREACHABLE(); return mut_type::RET_N_ARGS_N; }
    }
}


}
