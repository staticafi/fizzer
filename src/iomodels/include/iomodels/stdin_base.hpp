#ifndef IOMODELS_STDIN_BASE_HPP_INCLUDED
#   define IOMODELS_STDIN_BASE_HPP_INCLUDED

#   include <instrumentation/instrumentation_types.hpp>
#   include <connection/message.hpp>
#   include <connection/shared_memory.hpp>
#   include <utility/math.hpp>
#   include <memory>

namespace  iomodels {

struct  stdin_base
{
    using  byte_count_type = natural_32_bit;
    using  type_of_input_bits = instrumentation::type_of_input_bits;
    using  input_types_vector = std::vector<type_of_input_bits>;

    explicit stdin_base(byte_count_type const  max_bytes_) : m_max_bytes{ max_bytes_ } {}
    virtual ~stdin_base() = default;

    virtual void  clear() = 0;
    virtual void  save(connection::message&  dest) const = 0;
    virtual void  save(connection::shared_memory&  dest) const = 0;
    virtual void  load(connection::message&  src) = 0;
    virtual void  load(connection::shared_memory&  src) = 0;
    virtual bool  load_record(connection::message&  src) = 0;
    virtual bool  load_record(connection::shared_memory&  src) = 0;
    virtual std::size_t min_flattened_size() const = 0;
    void  read(natural_8_bit*  ptr, type_of_input_bits  type, connection::medium&  dest) { if (!read_bytes(ptr, type, dest)) exit(0); }
    virtual bool  read_bytes(natural_8_bit*  ptr, type_of_input_bits  type, connection::medium&  dest) = 0;

    virtual vecu8 const&  get_bytes() const = 0;
    virtual input_types_vector const&  get_types() const = 0;
    virtual byte_count_type  num_bytes_read() const = 0;

    virtual void  set_bytes(vecu8 const&  bytes) = 0;

    byte_count_type  max_bytes() const { return m_max_bytes; }

private:
    byte_count_type  m_max_bytes;
};


using  stdin_base_ptr = std::unique_ptr<stdin_base>;


}

#endif
