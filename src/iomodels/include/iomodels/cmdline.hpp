#ifndef IOMODELS_CMDLINE_HPP_INCLUDED
#   define IOMODELS_CMDLINE_HPP_INCLUDED

#   include <iomodels/iomodel.hpp>
#   include <vector>

namespace  iomodels {


struct  cmdline;
using  cmdline_ptr = std::unique_ptr<cmdline>;


struct  cmdline final : public iomodel
{
    static inline constexpr natural_8_bit  max_num_options() { return 64; }
    static inline constexpr natural_16_bit  max_num_chars() { return 4096; }

    static cmdline_ptr  create();
    static cmdline_ptr  create(connection::medium&  src);

    cmdline_ptr  clone() const;

    cmdline();

    void  clear() override;

    com::record_type  get_record_type() const override { return com::record_type::CMDLINE; }
    natural_64_bit  max_data_in_medium() const override;
    natural_64_bit  max_construction_data_in_medium() const override;

    bool  save_construction_data(connection::medium&  dst) const override;
    bool  parse_record(
            com::input_bytes::const_iterator&  it_bytes,
            com::input_types::const_iterator&  it_types,
            com::input_metadata::const_iterator&  it_metadata
            ) override;
    bool  parse_record(com::execution_results&  dst, connection::medium&  src) const override;

    com::target_termination  on_argc(natural_8_bit*  argc, connection::medium*  dst = nullptr);
    com::target_termination  on_len(natural_16_bit*  len, natural_8_bit  i, connection::medium*  dst = nullptr);
    com::target_termination  on_char(natural_8_bit*  c, natural_8_bit  i, natural_16_bit  j, connection::medium*  dst = nullptr);

private:
    std::vector<vecu8>  m_args;
    natural_16_bit  m_num_chars;
};


}

#endif
