#ifndef COM_RECORD_TYPE_HPP_INCLUDED
#   define COM_RECORD_TYPE_HPP_INCLUDED

#   include <utility/basic_numeric_types.hpp>

namespace com {


enum struct  record_type : natural_8_bit
{
    INVALID         = 0,
    TERMINATION     = 1,
    TRACE           = 2,
    CMDLINE         = 3,
    SIMPLE          = 4,
};

static_assert(sizeof(record_type) == 1);

inline natural_8_bit  to_record_id(record_type const  type) { return (natural_8_bit)type; }
record_type  from_record_id(natural_8_bit  id);


}

#endif
