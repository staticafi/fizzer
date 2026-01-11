#include <iomodels/cmdline.hpp>
#include <iomodels/parse_utils.hpp>
#include <connection/medium.hpp>
#include <com/record_type.hpp>
#include <utility/development.hpp>
#include <algorithm>
#include <cstring>

namespace  iomodels {


static_assert(sizeof(int) == sizeof(std::int32_t));
static_assert(sizeof(char) == 1 && (int)std::numeric_limits<char>::min() == -128);


cmdline_ptr  cmdline::create()
{
    return std::make_unique<cmdline>();
}


cmdline_ptr  cmdline::create(connection::medium&  src)
{
    return create();
}


bool  cmdline::save_construction_data(connection::medium&  dst) const
{
    return true;
}


natural_64_bit  cmdline::max_construction_data_in_medium() const
{
    return 0ULL;
}


cmdline_ptr  cmdline::clone() const
{
    return create();
}


cmdline::cmdline()
    : iomodel{}
    , m_args{}
    , m_option{ 0U }
    , m_character{ 0U }
    , m_count{ 0U }
{
}


void  cmdline::clear()
{
    m_args.clear();
    m_option = 0U;
    m_character = 0U;
    m_count = 0U;
}


natural_64_bit  cmdline::max_data_in_medium() const
{
    return
        max_construction_data_in_medium() +
        // ARGC
        sizeof(get_record_type()) + sizeof(natural_8_bit) +
        // CHARS
        MAX_NUM_CHARS * (sizeof(get_record_type()) + sizeof(natural_8_bit) + sizeof(char))
        ;
}


bool  cmdline::parse_record(
        com::input_bytes::const_iterator&  it_bytes,
        com::input_types::const_iterator&  it_types,
        com::input_metadata::const_iterator&  it_metadata
        )
{
    if (*it_types == com::data_type::UINT8)
    {
        natural_8_bit  argc;
        if (!read_bytes(&argc, it_bytes, com::data_type::UINT8)) return false;
        m_args.resize(argc, { '\0' });
        m_count += argc;
    }
    else
    {
        char  orig_c, new_c;
        if (!read_bytes(&orig_c, it_metadata, com::data_type::SINT8)) return false;
        if (!read_bytes(&new_c, it_bytes, com::data_type::SINT8)) return false;
        if (m_option < m_args.size())
        {
            if (new_c != '\0' && !m_ended && m_count < MAX_NUM_CHARS)
            {
                m_args.at(m_option).back() = new_c;
                m_args.at(m_option).push_back('\0');
                ++m_count;
            }
            else
                m_ended = true;
            if (orig_c == '\0')
            {
                ++m_option;
                m_ended = false;
            }
        }
    }
    ++it_types;
    return true;
}


bool  cmdline::parse_record(com::execution_results&  dst, connection::medium&  src)
{
    return  append_metadata(dst, com::record_type::CMDLINE)  &&
            append_typed_bytes(dst, src) &&
            (dst.get_types()->back() != com::data_type::SINT8 || append_metadata(dst, sizeof(char),src));
}


bool  cmdline::parse_value(com::execution_results&  dst, com::data_type const  type, connection::medium&&  src)
{
    return  append_metadata(dst, com::record_type::CMDLINE)  &&
            append_typed_bytes(dst, type, 1ULL, src) &&
            (type != com::data_type::SINT8 || append_metadata(dst, sizeof(char),src));
}


void  cmdline::on_load_complete()
{
    m_option = 0U;
    m_character = 0U;
    m_count = 0U;
}


com::target_termination  cmdline::on_argc(natural_8_bit* const  argc, connection::medium*  dst)
{
    *argc = (natural_8_bit)m_args.size();

    if (dst == nullptr)
        return com::target_termination::NORMAL;

    return  append_metadata(*dst, get_record_type()) &&
            append_typed_bytes(*dst, com::data_type::UINT8, argc)
            ? com::target_termination::NORMAL
            : com::target_termination::MEDIUM_OVERFLOW;
}


com::target_termination  cmdline::on_char(char* const  c, connection::medium*  dst)
{
    if (m_option >= m_args.size())
    {
        *c = (natural_8_bit)0;
        return com::target_termination::BOUNDARY_CONDITION_VIOLATION;
    }

    *c = (char)m_args.at(m_option).at(m_character);

    ++m_character;
    if (m_character == m_args.at(m_option).size())
    {
        ++m_option;
        m_character = 0U;
    }

    if (dst == nullptr)
        return com::target_termination::NORMAL;

    return  append_metadata(*dst, get_record_type()) &&
            append_typed_bytes(*dst, com::data_type::SINT8, c) &&
            append_metadata(*dst, *c)
            ? com::target_termination::NORMAL
            : com::target_termination::MEDIUM_OVERFLOW;
}


}
