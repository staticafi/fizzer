#include <com/record_type.hpp>
#include <utility/invariants.hpp>

namespace com {


record_type  from_record_id(natural_8_bit const  id)
{
    switch (id)
    {
        case 0U: return record_type::INVALID;
        case 1U: return record_type::TERMINATION;
        case 2U: return record_type::TRACE;
        case 3U: return record_type::CMDLINE;
        case 4U: return record_type::SIMPLE;
        default: { UNREACHABLE(); return record_type::INVALID; }
    }
}


}
