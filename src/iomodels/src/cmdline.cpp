#include <iomodels/cmdline.hpp>
#include <connection/medium.hpp>
#include <com/record_type.hpp>
#include <utility/development.hpp>
#include <algorithm>

namespace  iomodels {


static_assert(sizeof(int) == sizeof(std::int32_t));


cmdline_ptr  cmdline::create(natural_16_bit const  max_num_options, natural_16_bit const  max_option_size)
{
    return std::make_unique<cmdline>(max_num_options, max_option_size);
}


cmdline_ptr  cmdline::create(connection::medium&  src)
{
    if (!src.can_deliver_bytes(sizeof(m_max_num_options) + sizeof(m_max_option_size)))
        return nullptr;
    natural_16_bit  max_num_options, max_option_size;
    src >> max_num_options >> max_option_size;
    return create(max_num_options, max_option_size);
}


cmdline_ptr  cmdline::clone() const
{
    return create(m_max_num_options, m_max_option_size);
}


cmdline::cmdline(natural_16_bit const  max_num_options, natural_16_bit const  max_option_size)
    : iomodel{}
    , m_max_num_options{ max_num_options }
    , m_max_option_size{ max_option_size }
{}


void  cmdline::clear()
{
    // TODO!
}


bool  cmdline::save_construction_data(connection::medium&  dst) const
{
    if (!dst.can_accept_bytes(max_construction_data_in_medium()))
        return false;
    dst << m_max_num_options << m_max_option_size;
    return true;
}


bool  cmdline::parse_record(
        com::input_bytes::const_iterator const  it_bytes,
        com::data_type const  type,
        com::input_metadata::const_iterator&
        )
{
    NOT_IMPLEMENTED_YET();
}


bool  cmdline::parse_record(com::execution_results&  dst, connection::medium&  src) const
{
    NOT_IMPLEMENTED_YET();
}


natural_64_bit  cmdline::max_construction_data_in_medium() const
{
    return sizeof(m_max_num_options) + sizeof(m_max_option_size);
}


natural_64_bit  cmdline::max_data_in_medium() const
{
    return 1ULL + sizeof(int) + m_max_num_options * (sizeof(natural_16_bit) + m_max_option_size);
}


com::target_termination  cmdline::on_arguments_requested(int&  argc, char**&  argv, connection::medium* const  dst)
{
    static char c = '\0';
    static char* v[] = { &c };
    argc = 1;
    argv = v;
    return com::target_termination::NORMAL;
}


}
