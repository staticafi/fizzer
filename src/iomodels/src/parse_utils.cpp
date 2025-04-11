#include <iomodels/parse_utils.hpp>
#include <connection/medium.hpp>
#include <algorithm>

namespace  iomodels {


bool  read_bytes(void* const  bytes, natural_64_bit const  count, connection::medium&  src)
{
    if (!src.can_deliver_bytes(count))
        return false;
    src.deliver_bytes(bytes, count);
    return true;
}


bool  append_bytes(connection::medium&  dst, void* const  bytes, natural_64_bit const  count)
{
    if (!dst.can_accept_bytes(count))
        return false;
    dst.accept_bytes(bytes, count);
    return true;

}


vecu8::const_iterator&  increment(vecu8::const_iterator&  it, com::data_type const  type)
{
    it += com::num_bytes(type);
    return it;
}


bool  append_typed_bytes(
        vecu8&  destination,
        vecu8::const_iterator&  it,
        com::input_types::const_iterator&  it_types
        )
{
    destination.insert(destination.end(), it, it + com::num_bytes(*it_types));
    increment(it, *it_types);
    ++it_types;
    return true;
}


bool  append_expected_bytes(
        vecu8&  destination,
        vecu8::const_iterator&  it,
        com::input_types::const_iterator&  it_types,
        com::data_type const  expected_type
        )
{
    if (*it_types != expected_type)
        return false;
    append_typed_bytes(destination, it, it_types);
    return true;
}


bool read_bytes(void* const  destination, vecu8::const_iterator&  it, com::data_type const  type)
{
    std::copy(it, it + com::num_bytes(type), (natural_8_bit*)destination);
    it += com::num_bytes(type);
    return true;
}


bool read_expected_bytes(
    void* const  destination,
    vecu8::const_iterator&  it,
    com::input_types::const_iterator&  it_types,
    com::data_type const  expected_type
    )
{
    if (*it_types != expected_type)
        return false;
    ++it_types;
    read_bytes(destination, it, expected_type);
    return true;
}
    

bool  append_typed_bytes(com::execution_results&  dst, connection::medium&  src)
{
    if (!src.can_deliver_bytes(sizeof(natural_8_bit)))
        return false;
    natural_8_bit  type_id;
    src >> type_id;
    com::data_type const type{ com::from_type_id(type_id) };
    return append_typed_bytes(dst, type, src);
}


bool  append_typed_bytes(com::execution_results&  dst, com::data_type const  type, natural_64_bit const  count, connection::medium&  src)
{
    natural_64_bit const num_bytes{ count * com::num_bytes(type) };
    if (!src.can_deliver_bytes(num_bytes))
        return false;
    natural_64_bit const  byte_index{ dst.get_bytes()->size() };
    dst.get_bytes()->resize(byte_index + num_bytes, 0xCDU);
    src.deliver_bytes(dst.get_bytes()->data() + byte_index, num_bytes);
    dst.get_types()->resize(dst.get_types()->size() + count, type);
    return true;

}


bool  append_typed_bytes(com::execution_results&  dst, com::data_type const  type, connection::medium&  src, void* const  dst2)
{
    if (!append_typed_bytes(dst, type, 1ULL, src))
        return false;
    if (dst2 != nullptr)
    {
        auto const  end{ dst.get_bytes()->data() + dst.get_bytes()->size() };
        std::copy(end - com::num_bytes(type), end, (natural_8_bit*)dst2);
    }
    return true;
}


bool  append_metadata(com::execution_results&  dst, com::record_type const  rec_type)
{
    dst.get_metadata()->push_back(com::to_record_id(rec_type));
    return true;
}


bool  append_metadata(com::execution_results&  dst, natural_64_bit const  count, connection::medium&  src, void* const  dst2)
{
    if (!src.can_deliver_bytes(count))
        return false;
    natural_64_bit const  byte_index{ dst.get_metadata()->size() };
    dst.get_metadata()->resize(byte_index + count, 0xCDU);
    src.deliver_bytes(dst.get_metadata()->data() + byte_index, count);
    if (dst2 != nullptr)
        std::copy(dst.get_metadata()->data() + byte_index, dst.get_metadata()->data() + byte_index + count, (natural_8_bit*)dst2);
    return true;
}


bool  append_metadata(connection::medium&  dst, void* const  data, natural_64_bit const  count)
{
    if (!dst.can_accept_bytes(count))
        return false;
    dst.accept_bytes((natural_8_bit*)data, count);
    return true;
}


bool  append_typed_bytes(connection::medium&  dst, com::data_type const  type, void* const  bytes)
{
    natural_8_bit const num_bytes{ com::num_bytes(type) };
    if (!dst.can_accept_bytes(sizeof(natural_8_bit) + num_bytes))
        return false;
    natural_8_bit const type_id{ com::to_type_id(type) };
    dst.accept_bytes(&type_id, sizeof(type_id));
    dst.accept_bytes(bytes, num_bytes);
    return true;
}


}
