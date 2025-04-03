#include <iomodels/stdin_replay_bytes_then_repeat_byte.hpp>
#include <utility/assumptions.hpp>
#include <utility/invariants.hpp>
#include <instrumentation/data_record_id.hpp>
#include <instrumentation/target_termination.hpp>

using namespace connection;
using namespace instrumentation;

namespace  iomodels {


stdin_replay_bytes_then_repeat_byte::stdin_replay_bytes_then_repeat_byte(byte_count_type const  max_bytes_, natural_8_bit repeat_byte)
    : stdin_base{ max_bytes_ }
    , cursor(0U)
    , bytes()
    , types()
    , repeat_byte(repeat_byte)
{}


void  stdin_replay_bytes_then_repeat_byte::clear()
{
    cursor = 0U;
    bytes.clear();
    types.clear();
}

void  stdin_replay_bytes_then_repeat_byte::save(connection::shared_memory& dest) const
{
    INVARIANT(bytes.size() <= max_bytes());

    dest << (byte_count_type)bytes.size();
    dest.accept_bytes(bytes.data(),(byte_count_type)bytes.size());

    dest << (byte_count_type)types.size();
    dest.accept_bytes(types.data(), (byte_count_type)types.size());
}

void  stdin_replay_bytes_then_repeat_byte::load(connection::shared_memory&  src)
{
    byte_count_type  num_bytes;
    src >> num_bytes;
    bytes.resize(num_bytes);
    src.deliver_bytes(bytes.data(), num_bytes);

    ASSUMPTION(bytes.size() <= max_bytes());

    byte_count_type  num_types;
    src >> num_types;
    types.resize(num_types);
    src.deliver_bytes(types.data(), num_types);
}

bool  stdin_replay_bytes_then_repeat_byte::load_record(connection::shared_memory& src) {
    if (!src.can_deliver_bytes(1))
        return false;
    natural_8_bit type_id;
    src >> type_id;
    type_of_input_bits const type = from_id(type_id);
    natural_8_bit const count = num_bytes(type);
    if (!src.can_deliver_bytes(count))
        return false;
    types.push_back(type);
    std::size_t old_size = bytes.size();
    bytes.resize(old_size + count);
    src.deliver_bytes(bytes.data() + old_size, count);
    return true;
}


std::size_t stdin_replay_bytes_then_repeat_byte::min_flattened_size() const {
    return sizeof(input_types_vector::value_type) + 1;
}


bool  stdin_replay_bytes_then_repeat_byte::read_bytes(
    natural_8_bit*  ptr, type_of_input_bits const  type, medium&  dest
    )
{
    natural_8_bit const count = num_bytes(type);
    if (cursor + count > max_bytes()) {
        dest.set_termination(target_termination::boundary_condition_violation);
        return false;
    }
    if (!dest.can_accept_bytes(count + 2)) {
        dest.set_termination(target_termination::medium_overflow);
        return false;
    }
    if (cursor + count > bytes.size()) {
        bytes.resize(cursor + count, repeat_byte);
    }
    memcpy(ptr, bytes.data() + cursor, count);
    {
        auto const rec_type{ data_record_id::stdin_bytes };
        dest.accept_bytes(&rec_type, sizeof(rec_type));
        auto const type_id{ to_id(type) };
        dest.accept_bytes(&type_id, sizeof(type_id));
    }
    dest.accept_bytes(bytes.data() + cursor, count);
    cursor += count;
    types.push_back(type);
    return true;
}


}
