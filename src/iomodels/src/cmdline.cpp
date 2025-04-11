#include <iomodels/cmdline.hpp>
#include <iomodels/parse_utils.hpp>
#include <connection/medium.hpp>
#include <com/record_type.hpp>
#include <utility/development.hpp>
#include <algorithm>
#include <cstring>

namespace  iomodels {


static_assert(sizeof(int) == sizeof(std::int32_t));


enum struct Meta : natural_8_bit
{
    ARGC    = 0,
    LEN     = 1,
    CHAR    = 2
};
static_assert(sizeof(Meta) == sizeof(natural_8_bit));

natural_8_bit  to_meta_id(Meta const  meta) { return (natural_8_bit)meta; }
Meta  from_meta_id(natural_8_bit const  id) { return id == 0 ? Meta::ARGC : ( id == 1 ? Meta::LEN : Meta::CHAR); }


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
    , m_num_chars{ 0U }
{}


void  cmdline::clear()
{
    m_args.clear();
    m_num_chars = 0U;
}


natural_64_bit  cmdline::max_data_in_medium() const
{
    return
        max_construction_data_in_medium() +
        // ARGC
        sizeof(get_record_type()) + 2ULL * sizeof(natural_8_bit) +
        // LEN
        max_num_options() * (sizeof(get_record_type()) + 2ULL * sizeof(natural_8_bit) + sizeof(natural_16_bit)) +
        // CHARS
        max_num_chars() * (sizeof(get_record_type()) + 2ULL * sizeof(natural_8_bit) + sizeof(natural_16_bit) + sizeof(natural_8_bit))
        ;
}


bool  cmdline::parse_record(
        com::input_bytes::const_iterator&  it_bytes,
        com::input_types::const_iterator&  it_types,
        com::input_metadata::const_iterator&  it_metadata
        )
{
    natural_8_bit  meta_id; if (!read_bytes(&meta_id, it_metadata, com::data_type::UINT8)) return false;
    switch (from_meta_id(meta_id))
    {
        case Meta::ARGC:
            {
                natural_8_bit  argc; if (!read_expected_bytes(&argc, it_bytes, it_types, com::data_type::UINT8)) return false;
                argc = std::min(argc, max_num_options());
                m_args.resize(argc, { 0 });
                m_num_chars += argc;
            }
            return true;
        case Meta::LEN:
            {
                natural_8_bit  i; if (!read_bytes(&i, it_metadata, com::data_type::UINT8)) return false;
                if (i < m_args.size())
                {
                    natural_16_bit  len; if (!read_expected_bytes(&len, it_bytes, it_types, com::data_type::UINT16)) return false;
                    len = std::max((natural_16_bit)1U, len);
                    natural_16_bit const  old_len{ (natural_16_bit)m_args.at(i).size() };
                    if (len < old_len)
                    {
                        m_args.at(i).resize(len);
                        m_num_chars -= old_len - len;
                    }
                    else
                    {
                        natural_16_bit const  delta{ (natural_16_bit)std::min(len - old_len, max_num_chars() - m_num_chars) };
                        m_args.at(i).resize(old_len + delta, ' ');
                        m_num_chars += delta;
                    }
                    m_args.at(i).back() = '\0';    
                }
            }
            return true;
        case Meta::CHAR:
            {
                natural_8_bit  i; if (!read_bytes(&i, it_metadata, com::data_type::UINT8)) return false;
                if (i < m_args.size())
                {
                    natural_16_bit  j; if (!read_bytes(&j, it_metadata, com::data_type::UINT16)) return false;
                    if (j < m_args.at(i).size())
                    {
                        if (!read_expected_bytes(&at(m_args, i, j), it_bytes, it_types, com::data_type::UINT8)) return false;
                        m_args.at(i).back() = '\0';
                    }
                }
            }
            return true;
        default: { UNREACHABLE(); return  false; }
    }
}


bool  cmdline::parse_record(com::execution_results&  dst, connection::medium&  src) const
{
    append_metadata(dst, get_record_type());
    natural_8_bit  meta_id;
    if (!append_metadata(dst, src, &meta_id))
        return false;
    switch (from_meta_id(meta_id))
    {
        case Meta::ARGC:
            return  append_typed_bytes(dst, com::data_type::UINT8, src);
        case Meta::LEN:
            return  append_metadata(dst, sizeof(natural_8_bit), src) &&
                    append_typed_bytes(dst, com::data_type::UINT16, src);
        case Meta::CHAR:
            return  append_metadata(dst, sizeof(natural_8_bit), src) &&
                    append_metadata(dst, sizeof(natural_16_bit), src) &&
                    append_typed_bytes(dst, com::data_type::UINT8, src);
        default: { UNREACHABLE(); return  false; }
    }
}


com::target_termination  cmdline::on_argc(natural_8_bit* const  argc, connection::medium*  dst)
{
    *argc = (natural_8_bit)m_args.size();

    if (dst == nullptr)
        return com::target_termination::NORMAL;

    return  append_metadata(*dst, get_record_type()) &&
            append_metadata(*dst, to_meta_id(Meta::ARGC)) &&
            append_bytes(*dst, *argc)
            ? com::target_termination::NORMAL
            : com::target_termination::MEDIUM_OVERFLOW;
}


com::target_termination  cmdline::on_len(natural_16_bit* const  len, natural_8_bit const  i, connection::medium*  dst)
{
    *len = (natural_16_bit)(i < m_args.size() ? m_args.at(i).size() : 0ULL);

    if (dst == nullptr)
        return com::target_termination::NORMAL;

    return  append_metadata(*dst, get_record_type()) &&
            append_metadata(*dst, to_meta_id(Meta::LEN)) &&
            append_metadata(*dst, i) &&
            append_bytes(*dst, *len)
            ? com::target_termination::NORMAL
            : com::target_termination::MEDIUM_OVERFLOW;
}


com::target_termination  cmdline::on_char(natural_8_bit* const  c, natural_8_bit const  i, natural_16_bit const  j, connection::medium*  dst)
{
    *c = i < m_args.size() && j < m_args.at(i).size() ? at(m_args.at(i), j)  : (natural_8_bit)0;

    if (dst == nullptr)
        return com::target_termination::NORMAL;

    return  append_metadata(*dst, get_record_type()) &&
            append_metadata(*dst, to_meta_id(Meta::CHAR)) &&
            append_metadata(*dst, i) &&
            append_metadata(*dst, j) &&
            append_bytes(*dst, *c)
            ? com::target_termination::NORMAL
            : com::target_termination::MEDIUM_OVERFLOW;
}


}
