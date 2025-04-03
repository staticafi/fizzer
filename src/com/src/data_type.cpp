#include <com/data_type.hpp>
#include <utility/invariants.hpp>
#include <ostream>
#include <iomanip>

namespace com {


data_type  from_type_id(natural_8_bit const  id)
{
    switch (id)
    {
        case  0U: return data_type::BOOLEAN;

        case  1U: return data_type::UINT8;
        case  2U: return data_type::SINT8;

        case  3U: return data_type::UINT16;
        case  4U: return data_type::SINT16;

        case  5U: return data_type::UINT32;
        case  6U: return data_type::SINT32;

        case  7U: return data_type::UINT64;
        case  8U: return data_type::SINT64;

        case  9U: return data_type::FLOAT32;
        case 10U: return data_type::FLOAT64;

        case 11U: return data_type::UNTYPED8;
        case 12U: return data_type::UNTYPED16;
        case 13U: return data_type::UNTYPED32;
        case 14U: return data_type::UNTYPED64;

        default: { UNREACHABLE(); return data_type::UINT8; }
    }
}


bool  is_known_type(data_type const  type)
{
    switch (type)
    {
        case data_type::BOOLEAN:
        case data_type::UINT8:
        case data_type::SINT8:
        case data_type::UINT16:
        case data_type::SINT16:
        case data_type::UINT32:
        case data_type::SINT32:
        case data_type::FLOAT32:
        case data_type::UINT64:
        case data_type::SINT64:
        case data_type::FLOAT64:
            return true;
        case data_type::UNTYPED8:
        case data_type::UNTYPED16:
        case data_type::UNTYPED32:
        case data_type::UNTYPED64:
            return false;
        default: { UNREACHABLE(); return false; }
    }
}


bool  is_numeric_type(data_type const  type)
{
    switch (type)
    {
        case data_type::UINT8:
        case data_type::SINT8:
        case data_type::UINT16:
        case data_type::SINT16:
        case data_type::UINT32:
        case data_type::SINT32:
        case data_type::FLOAT32:
        case data_type::UINT64:
        case data_type::SINT64:
        case data_type::FLOAT64:
            return true;
        case data_type::BOOLEAN:
        case data_type::UNTYPED8:
        case data_type::UNTYPED16:
        case data_type::UNTYPED32:
        case data_type::UNTYPED64:
            return false;
        default: { UNREACHABLE(); return false; }
    }
}


bool  is_floating_point_type(data_type const  type)
{
    switch (type)
    {
        case data_type::FLOAT32:
        case data_type::FLOAT64:
            return true;
        default:
            return false;
    }
}


std::string  to_string(data_type  type)
{
    switch (type)
    {
        case data_type::BOOLEAN: return "BOOLEAN";
        case data_type::UINT8: return "UINT8";
        case data_type::SINT8: return "SINT8";
        case data_type::UINT16: return "UINT16";
        case data_type::SINT16: return "SINT16";
        case data_type::UINT32: return "UINT32";
        case data_type::SINT32: return "SINT32";
        case data_type::FLOAT32: return "FLOAT32";
        case data_type::UINT64: return "UINT64";
        case data_type::SINT64: return "SINT64";
        case data_type::FLOAT64: return "FLOAT64";
        case data_type::UNTYPED8: return "UNTYPED8";
        case data_type::UNTYPED16: return "UNTYPED16";
        case data_type::UNTYPED32: return "UNTYPED32";
        case data_type::UNTYPED64: return "UNTYPED64";
        default: { UNREACHABLE(); return "ERROR"; }
    }
}


std::string  to_c_type_string(data_type  type)
{
    switch (type)
    {
        case data_type::BOOLEAN: return "bool";
        case data_type::UINT8: return "unsigned char";
        case data_type::SINT8: return "char";
        case data_type::UINT16: return "unsigned short";
        case data_type::SINT16: return "short";
        case data_type::UINT32: return "unsigned int";
        case data_type::SINT32: return "int";
        case data_type::FLOAT32: return "float";
        case data_type::UINT64: return "unsigned long";
        case data_type::SINT64: return "long";
        case data_type::FLOAT64: return "double";
        case data_type::UNTYPED8: return "unsigned char";
        case data_type::UNTYPED16: return "unsigned short";
        case data_type::UNTYPED32: return "unsigned int";
        case data_type::UNTYPED64: return "unsigned long";
        default: { UNREACHABLE(); return "ERROR"; }
    }
}


natural_8_bit  num_bytes(data_type const  type)
{
    switch (type)
    {
        case data_type::BOOLEAN:
        case data_type::UINT8:
        case data_type::SINT8:
        case data_type::UNTYPED8:
            return 1U;
        case data_type::UINT16:
        case data_type::SINT16:
        case data_type::UNTYPED16:
            return 2U;
        case data_type::UINT32:
        case data_type::SINT32:
        case data_type::FLOAT32:
        case data_type::UNTYPED32:
            return 4U;
        case data_type::UINT64:
        case data_type::SINT64:
        case data_type::FLOAT64:
        case data_type::UNTYPED64:
            return 8U;
        default: { UNREACHABLE(); return 0U; }
    }
}


std::ostream&  save_value(std::ostream&  ostr, data_type const  type, void const* const  value_ptr)
{
    ostr << std::dec;
    switch (type)
    {
        case data_type::BOOLEAN: ostr << (*(natural_8_bit const*)value_ptr == 0 ? 0 : 1); break;

        case data_type::UINT8: ostr << (natural_32_bit)*(natural_8_bit const*)value_ptr; break;
        case data_type::SINT8: ostr << (integer_32_bit)*(integer_8_bit const*)value_ptr; break;

        case data_type::UINT16: ostr << *(natural_16_bit const*)value_ptr; break;
        case data_type::SINT16: ostr << *(integer_16_bit const*)value_ptr; break;

        case data_type::UINT32: ostr << *(natural_32_bit const*)value_ptr; break;
        case data_type::SINT32: ostr << *(integer_32_bit const*)value_ptr; break;

        case data_type::UINT64: ostr << *(natural_64_bit const*)value_ptr; break;
        case data_type::SINT64: ostr << *(integer_64_bit const*)value_ptr; break;

        case data_type::FLOAT32: ostr << std::setprecision(std::numeric_limits<long double>::digits10 + 1)
                                               << (long double)*(float_32_bit const*)value_ptr; break;
        case data_type::FLOAT64: ostr << std::setprecision(std::numeric_limits<long double>::digits10 + 1)
                                               << (long double)*(float_64_bit const*)value_ptr; break;

        case data_type::UNTYPED8: ostr << (natural_32_bit)*(natural_8_bit const*)value_ptr; break;
        case data_type::UNTYPED16: ostr << *(natural_16_bit const*)value_ptr; break;
        case data_type::UNTYPED32: ostr << *(natural_32_bit const*)value_ptr; break;
        case data_type::UNTYPED64: ostr << *(natural_64_bit const*)value_ptr; break;

        default: { UNREACHABLE(); }
    }
    return ostr;
}


}