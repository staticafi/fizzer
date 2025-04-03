#include <iomodels/simple.hpp>
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
    if (!src.can_deliver_bytes(sizeof(m_max_bytes)))
        return nullptr;
    natural_64_bit  max_bytes;
    src >> max_bytes;
    return create(max_bytes);
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


bool  simple::save_construction_data(connection::medium&  dst) const
{
    if (!dst.can_accept_bytes(max_construction_data_in_medium()))
        return false;
    dst << m_max_bytes;
    return true;
}


bool  simple::parse_record(
        com::input_bytes::const_iterator const  it_bytes,
        com::data_type const  type,
        com::input_metadata::const_iterator&
        )
{
    m_bytes.insert(m_bytes.end(), it_bytes, it_bytes + com::num_bytes(type));
    return true;
}


bool  simple::parse_record(com::execution_results&  dst, connection::medium&  src) const
{
    if (!src.can_deliver_bytes(sizeof(natural_8_bit)))
        return false;
    natural_8_bit  type_id;
    src >> type_id;
    com::data_type const type{ com::from_type_id(type_id) };
    dst.get_types()->push_back(type);

    natural_8_bit const num_bytes{ com::num_bytes(type) };
    if (!src.can_deliver_bytes(num_bytes))
        return false;
    natural_64_bit const  byte_index{ dst.get_bytes()->size() };
    dst.get_bytes()->resize(byte_index + num_bytes, 0U);
    src.deliver_bytes(dst.get_bytes()->data() + byte_index, num_bytes);

    dst.get_metadata()->push_back(com::to_record_id(com::record_type::SIMPLE));

    return true;
}


natural_64_bit  simple::max_construction_data_in_medium() const
{
    return sizeof(m_max_bytes);
}


natural_64_bit  simple::max_data_in_medium() const
{
    return 3ULL * m_max_bytes;
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

    if (!dst->can_accept_bytes(2UL * sizeof(natural_8_bit) + num_bytes))
        return com::target_termination::MEDIUM_OVERFLOW;
    natural_8_bit const record_id{ com::to_record_id(com::record_type::SIMPLE) };
    dst->accept_bytes(&record_id, sizeof(record_id));
    natural_8_bit const type_id{ com::to_type_id(type) };
    dst->accept_bytes(&type_id, sizeof(type_id));
    dst->accept_bytes(m_bytes.data() + m_cursor - num_bytes, num_bytes);

    return com::target_termination::NORMAL;
}


}
