#ifndef COM_DATA_TYPE_HPP_INCLUDED
#   define COM_DATA_TYPE_HPP_INCLUDED

#   include <utility/basic_numeric_types.hpp>
#   include <string>
#   include <iosfwd>

namespace  com {


enum struct  data_type : natural_8_bit
{
    // Known types:

    BOOLEAN = 0U,

    UINT8 = 1U,
    SINT8 = 2U,

    UINT16 = 3U,
    SINT16 = 4U,

    UINT32 = 5U,
    SINT32 = 6U,

    UINT64 = 7U,
    SINT64 = 8U,

    FLOAT32 = 9U,
    FLOAT64 = 10U,

    // Unknown types:

    UNTYPED8 = 11U,
    UNTYPED16 = 12U,
    UNTYPED32 = 13U,
    UNTYPED64 = 14U
};

inline natural_8_bit  to_type_id(data_type const  type) { return (natural_8_bit)type; }
data_type  from_type_id(natural_8_bit  id);

bool  is_known_type(data_type  type);
bool  is_numeric_type(data_type  type);
bool  is_floating_point_type(data_type  type);

std::string  to_string(data_type  type);
std::string  to_c_type_string(data_type  type);

natural_8_bit  num_bytes(data_type  type);
inline natural_8_bit  num_bits(data_type const  type) { return (natural_8_bit)(8U * num_bytes(type)); }
inline natural_8_bit  min_num_bits(data_type const  type) { return type == data_type::BOOLEAN ? 1U : num_bits(type); }

std::ostream&  save_value(std::ostream&  ostr, data_type  type, void const*  value_ptr);


}

#endif
