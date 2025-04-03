#ifndef IOMODELS_CMDLINE_HPP_INCLUDED
#   define IOMODELS_CMDLINE_HPP_INCLUDED

#   include <iomodels/iomodel.hpp>

namespace  iomodels {


struct  cmdline;
using  cmdline_ptr = std::unique_ptr<cmdline>;


struct  cmdline final : public iomodel
{
    static constexpr natural_16_bit  default_max_num_options { 255 };
    static constexpr natural_16_bit  default_max_option_size { 1024 };

    static constexpr natural_16_bit  default_opt_max_num_options { default_max_num_options };
    static constexpr natural_16_bit  default_opt_max_option_size { default_max_option_size };

    static cmdline_ptr  create(natural_16_bit  max_num_options, natural_16_bit  max_option_size);
    static cmdline_ptr  create(connection::medium&  src);

    cmdline_ptr  clone() const;

    cmdline(natural_16_bit  max_num_options, natural_16_bit  max_option_size);

    natural_16_bit  max_num_options() const { return m_max_num_options; }
    natural_16_bit  max_option_size() const { return m_max_option_size; }

    void  set_max_num_options(natural_16_bit const count) { m_max_num_options = count; }
    void  set_max_option_size(natural_16_bit const size) { m_max_option_size = size; }

    void  clear() override;
    bool  save_construction_data(connection::medium&  dst) const override;
    bool  parse_record(
            com::input_bytes::const_iterator  it_bytes,
            com::data_type  type,
            com::input_metadata::const_iterator&  it_metadata
            ) override;
    bool  parse_record(com::execution_results&  dst, connection::medium&  src) const override;
    com::record_type  get_record_type() const override { return com::record_type::CMDLINE; }
    natural_64_bit  max_construction_data_in_medium() const override;
    natural_64_bit  max_data_in_medium() const override;

    com::target_termination  on_arguments_requested(int&  argc, char**&  argv, connection::medium*  dst = nullptr);

private:
    natural_16_bit  m_max_num_options;
    natural_16_bit  m_max_option_size;
};


}

#endif
