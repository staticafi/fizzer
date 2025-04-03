#ifndef CONNECTION_SHARED_MEMORY_HPP_INCLUDED
#   define CONNECTION_SHARED_MEMORY_HPP_INCLUDED

#   include <connection/medium.hpp>
#   include <boost/interprocess/shared_memory_object.hpp>
#   include <boost/interprocess/mapped_region.hpp>

namespace  connection {


struct  shared_memory final : public medium
{
    explicit  shared_memory(std::size_t  size = 0ULL);
    static void  shut_down();

    void  clear() override;
    bool  can_accept_bytes(std::size_t  n) const override;
    bool  can_deliver_bytes(std::size_t  n) const override;
    void  accept_bytes(const void*  src, std::size_t  n) override;
    void  deliver_bytes(void*  dest, std::size_t  n) override;
    bool  exhausted() const override;
    natural_8_bit*  get_address() const override { return m_memory; }
    std::size_t get_size() const override;
    void set_size(std::size_t  bytes) override;
    natural_64_bit  get_num_stored() const override { return *m_saved; }
    natural_64_bit  get_cursor() const override { return m_cursor; }
    void  set_cursor(natural_64_bit const  c) override { m_cursor = c; }

private:

    inline static const char* segment_name = "Fizzer_Shared_Memory";

    boost::interprocess::shared_memory_object  m_object;
    boost::interprocess::mapped_region  m_region;
    natural_64_bit  m_cursor;
    natural_8_bit*  m_memory;
    natural_64_bit*  m_saved;
};


}


#endif