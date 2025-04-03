#include <connection/shared_memory.hpp>

namespace  connection {


shared_memory::shared_memory(std::size_t const  size)
    : medium()
    , m_object{}
    , m_region{}
    , m_cursor{ 0ULL }
    , m_memory{ nullptr }
    , m_saved{ nullptr }
{
    set_size(size);
}


void  shared_memory::shut_down()
{
    boost::interprocess::shared_memory_object::remove(segment_name);
}


void  shared_memory::clear()
{
    m_cursor = 0ULL;
    *m_saved = 0ULL;
    //std::memset(get_address(), 0xCD, get_size());
}


bool  shared_memory::can_accept_bytes(std::size_t const n) const
{
    return m_memory != nullptr && get_size() >= *m_saved + n;
}


bool  shared_memory::can_deliver_bytes(std::size_t const n) const
{
    return m_memory != nullptr && *m_saved >= m_cursor + n;
}


void  shared_memory::accept_bytes(const void* src, std::size_t n)
{
    std::memcpy(m_memory + *m_saved, src, n);
    *m_saved += (natural_32_bit)n;
}


void  shared_memory::deliver_bytes(void* dest, std::size_t n)
{
    std::memcpy(dest, m_memory + m_cursor, n);
    m_cursor += (natural_32_bit)n;
}


bool  shared_memory::exhausted() const
{
    return m_cursor >= *m_saved;
}


std::size_t  shared_memory::get_size() const
{
    std::size_t size = m_region.get_size();
    if (size != 0ULL)
        return size - sizeof(*m_saved);
    return size;
}


void  shared_memory::set_size(std::size_t const  size)
{
    m_object = boost::interprocess::shared_memory_object(
                    boost::interprocess::open_or_create,
                    segment_name,
                    boost::interprocess::read_write
                    );
    if (size > 0ULL)
        m_object.truncate(size + sizeof(*m_saved));
    m_region = boost::interprocess::mapped_region(m_object, boost::interprocess::read_write);
    m_saved = static_cast<natural_64_bit*>(m_region.get_address());
    m_memory = static_cast<natural_8_bit*>(m_region.get_address()) + sizeof(*m_saved);
    if (size > 0ULL)
        clear();
}


}
