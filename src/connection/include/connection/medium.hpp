#ifndef CONNECTION_MEDIUM_HPP_INCLUDED
#   define CONNECTION_MEDIUM_HPP_INCLUDED

#   include <utility/basic_numeric_types.hpp>
#   include <string>
#   include <type_traits>

namespace  connection {


struct  medium
{
    static std::size_t constexpr  default_size{ 1ULL * (1024ULL*1024ULL*1024ULL) };

    virtual ~medium() {}
    virtual void clear() {}
    virtual bool exhausted() const { return false; }
    virtual bool can_accept_bytes(std::size_t n) const { return true; }
    virtual bool can_deliver_bytes(std::size_t n) const { return true; }
    virtual void accept_bytes(const void* src, std::size_t n) {}
    virtual void deliver_bytes(void* dest, std::size_t n) {}
    virtual natural_8_bit*  get_address() const { return nullptr; }
    virtual std::size_t  get_size() const { return 0ULL; }
    virtual void set_size(std::size_t bytes) {}
    virtual natural_64_bit  get_num_stored() const { return 0U; }
    virtual natural_64_bit  get_cursor() const { return 0U; }
    virtual void  set_cursor(natural_64_bit const  c) {}

    template<typename T, typename std::enable_if<std::is_trivially_copyable<T>::value, int>::type = 0>
    medium& operator<<(const T& src)
    {
        accept_bytes(&src, sizeof(T));
        return *this;
    }

    medium& operator<<(const std::string&  src)
    {
        *this << (natural_32_bit) src.size();
        accept_bytes(src.data(), (natural_32_bit) src.size());
        return *this;
    }

    template<typename T, typename std::enable_if<std::is_trivially_copyable<T>::value, int>::type = 0>
    medium& operator>>(T& dest)
    {
        deliver_bytes(&dest, sizeof(T));
        return *this;
    }

    medium& operator>>(std::string& dest)
    {
        natural_32_bit size;
        *this >> size;
        dest.resize(size);
        deliver_bytes(dest.data(), (size));
        return *this;
    }
};


}

#endif