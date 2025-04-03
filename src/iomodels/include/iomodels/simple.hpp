#ifndef IOMODELS_SIMPLE_HPP_INCLUDED
#   define IOMODELS_SIMPLE_HPP_INCLUDED

#   include <iomodels/iomodel.hpp>
#   include <memory>

namespace  iomodels {


struct  simple;
using  simple_ptr = std::unique_ptr<simple>;


struct  simple final : public iomodel
{
    static natural_64_bit constexpr  default_max_bytes { 1800 }; // Standard page: 60 * 30 chars.
    static natural_64_bit constexpr  default_opt_max_bytes { 128U*1024U*1024U };

    static simple_ptr  create(natural_64_bit  max_bytes);
    static simple_ptr  create(connection::medium&  src);

    simple_ptr  clone() const;

    explicit simple(natural_64_bit  max_bytes);

    natural_64_bit  max_bytes() const { return m_max_bytes; }
    void set_max_bytes(natural_64_bit const  count) { m_max_bytes = count; }

    void  clear() override;
    bool  save_construction_data(connection::medium&  dst) const override;
    bool  parse_record(
            com::input_bytes::const_iterator  it_bytes,
            com::data_type  type,
            com::input_metadata::const_iterator&  it_metadata
            ) override;
    bool  parse_record(com::execution_results&  dst, connection::medium&  src) const override;
    com::record_type  get_record_type() const override { return com::record_type::SIMPLE; }
    natural_64_bit  max_construction_data_in_medium() const override;
    natural_64_bit  max_data_in_medium() const override;

    com::target_termination  on_bytes_requested(natural_8_bit*  ptr, com::data_type  type, connection::medium*  dst = nullptr);

private:
    natural_64_bit  m_max_bytes;
    natural_64_bit  m_cursor;
    com::input_bytes  m_bytes;
};


}

#endif



    // vecu8 const&  get_bytes() const override { return bytes; }
    // input_types_vector const&  get_types() const override { return types; }
    // byte_count_type  num_bytes_read() const override { return cursor; }

    // void  set_bytes(vecu8 const&  bytes_) override { bytes = bytes_; }

// #ifndef IOMODELS_STDIN_BASE_HPP_INCLUDED
// #   define IOMODELS_STDIN_BASE_HPP_INCLUDED

// #   include <instrumentation/instrumentation_types.hpp>
// #   include <connection/shared_memory.hpp>
// #   include <utility/math.hpp>
// #   include <memory>

// namespace  iomodels {

// struct  stdin_base
// {
//     using  byte_count_type = natural_32_bit;
//     using  data_type = instrumentation::data_type;
//     using  input_types_vector = std::vector<data_type>;

//     explicit stdin_base(byte_count_type const  max_bytes_) : m_max_bytes{ max_bytes_ } {}
//     virtual ~stdin_base() = default;

//     virtual void  clear() = 0;
//     virtual void  save(connection::shared_memory&  dest) const = 0;
//     virtual void  load(connection::shared_memory&  src) = 0;
//     virtual bool  load_record(connection::shared_memory&  src) = 0;
//     virtual std::size_t min_flattened_size() const = 0;
//     void  read(natural_8_bit*  ptr, data_type  type, connection::medium&  dest) { if (!read_bytes(ptr, type, dest)) exit(0); }
//     virtual bool  read_bytes(natural_8_bit*  ptr, data_type  type, connection::medium&  dest) = 0;

//     virtual vecu8 const&  get_bytes() const = 0;
//     virtual input_types_vector const&  get_types() const = 0;
//     virtual byte_count_type  num_bytes_read() const = 0;

//     virtual void  set_bytes(vecu8 const&  bytes) = 0;

//     byte_count_type  max_bytes() const { return m_max_bytes; }

// private:
//     byte_count_type  m_max_bytes;
// };


// using  stdin_base_ptr = std::unique_ptr<stdin_base>;


// }

// #endif
