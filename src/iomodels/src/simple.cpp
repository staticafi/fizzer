#include <iomodels/simple.hpp>
#include <iomodels/parse_utils.hpp>
#include <connection/medium.hpp>
#include <com/data_type.hpp>
#include <com/record_type.hpp>
#include <utility/assumptions.hpp>
#include <utility/invariants.hpp>
#include <cstring>

namespace  iomodels {


simple_ptr  simple::create(natural_64_bit const  max_bytes)
{
    return std::make_unique<simple>(max_bytes);
}


simple_ptr  simple::create(connection::medium&  src)
{
    natural_64_bit  max_bytes;
    return read_bytes(max_bytes, src) ? create(max_bytes) : nullptr;
}


bool  simple::save_construction_data(connection::medium&  dst) const
{
    return append_bytes(dst, m_max_bytes);
}


natural_64_bit  simple::max_construction_data_in_medium() const
{
    return sizeof(m_max_bytes);
}


simple_ptr  simple::clone() const
{
    return create(m_max_bytes);
}


simple::simple(natural_64_bit const max_bytes)
    : iomodel{}
    , m_max_bytes{ max_bytes }
    , m_cursor{ 0ULL }
    , m_bytes{}
{}


void  simple::clear()
{
    m_cursor = 0ULL;
    m_bytes.clear();
}


natural_64_bit  simple::max_data_in_medium() const
{
    return 3ULL * m_max_bytes;
}


bool  simple::parse_record(
        com::input_bytes::const_iterator&  it_bytes,
        com::input_types::const_iterator&  it_types,
        com::input_metadata::const_iterator&
        )
{
    return append_typed_bytes(m_bytes, it_bytes, it_types);
}


bool  simple::parse_record(com::execution_results&  dst, connection::medium&  src)
{
    return append_metadata(dst, com::record_type::SIMPLE) && append_typed_bytes(dst, src);
}


bool  simple::parse_value(com::execution_results&  dst, com::data_type const  type, connection::medium&&  src)
{
    return append_metadata(dst, com::record_type::SIMPLE) && append_typed_bytes(dst, type, 1ULL, src);
}


com::target_termination  simple::on_bytes_requested(natural_8_bit* const  ptr, com::data_type const  type, connection::medium* const  dst)
{
    natural_8_bit const num_bytes{ com::num_bytes(type) };
    if (m_cursor + num_bytes > m_max_bytes)
        return com::target_termination::BOUNDARY_CONDITION_VIOLATION;

    if (m_cursor + num_bytes > m_bytes.size())
        m_bytes.resize(m_cursor + num_bytes, 0U);
    std::memcpy(ptr, m_bytes.data() + m_cursor, num_bytes);

    m_cursor += num_bytes;

    if (dst == nullptr)
        return com::target_termination::NORMAL;

    return  append_metadata(*dst, get_record_type()) && append_typed_bytes(*dst, type, ptr)
            ? com::target_termination::NORMAL
            : com::target_termination::MEDIUM_OVERFLOW;
}


}
