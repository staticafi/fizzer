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

    com::record_type  get_record_type() const override { return com::record_type::SIMPLE; }
    natural_64_bit  max_data_in_medium() const override;
    natural_64_bit  max_construction_data_in_medium() const override;

    bool  save_construction_data(connection::medium&  dst) const override;
    bool  parse_record(
            com::input_bytes::const_iterator&  it_bytes,
            com::input_types::const_iterator&  it_types,
            com::input_metadata::const_iterator&  it_metadata
            ) override;
    static bool  parse_record(com::execution_results&  dst, connection::medium&  src);
    static bool  parse_value(com::execution_results&  dst, com::data_type  type, connection::medium&&  src);

    com::target_termination  on_bytes_requested(natural_8_bit*  ptr, com::data_type  type, connection::medium*  dst = nullptr);

private:
    natural_64_bit  m_max_bytes;
    natural_64_bit  m_cursor;
    com::input_bytes  m_bytes;
};


}

#endif
