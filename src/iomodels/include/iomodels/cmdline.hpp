#ifndef IOMODELS_CMDLINE_HPP_INCLUDED
#   define IOMODELS_CMDLINE_HPP_INCLUDED

#   include <iomodels/iomodel.hpp>
#   include <vector>

namespace  iomodels {


struct  cmdline;
using  cmdline_ptr = std::unique_ptr<cmdline>;


struct  cmdline final : public iomodel
{
    // This value must be equal to enum value MAX_CHARS in data/fizzer_entry_function.c,
    static constexpr natural_16_bit  MAX_NUM_CHARS{ 4095U };

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
    static bool  parse_record(com::execution_results&  dst, connection::medium&  src);
    static bool  parse_value(com::execution_results&  dst, com::data_type  type, connection::medium&&  src);

    void  on_load_complete() override;
    com::target_termination  on_argc(natural_8_bit*  argc, connection::medium*  dst = nullptr);
    com::target_termination  on_char(char*  c, connection::medium*  dst = nullptr);

private:
    std::vector<veci8>  m_args;
    natural_8_bit  m_option;
    natural_16_bit  m_character;
    natural_16_bit  m_count;
    bool  m_ended;
};


}

#endif
