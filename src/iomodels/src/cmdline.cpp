#include <iomodels/cmdline.hpp>
#include <connection/medium.hpp>
#include <com/record_type.hpp>
#include <utility/development.hpp>
#include <algorithm>
#include <cstring>

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
    , m_arg_idx{ 0U }
    , m_chr_idx{ 0U }
    , m_args{}
    , m_argc{ 1U }
    , m_argv{}
{}


void  cmdline::clear()
{
    m_arg_idx = 0U;
    m_chr_idx = 0U;
    m_args.clear();
    m_argc = 1U;
    m_argv.clear();
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
        com::input_metadata::const_iterator&  it_metadata
        )
{
    if (m_args.empty())
    {
        if (type != com::data_type::UINT16)
            return false;
        std::copy(it_bytes, it_bytes + com::num_bytes(type), &m_argc);
        m_argc = std::max((natural_16_bit)1U, std::min(m_argc, m_max_num_options));
        std::copy(it_metadata, it_metadata + com::num_bytes(type), &m_arg_idx);
        it_metadata += com::num_bytes(type);
        if (m_arg_idx < 1U || m_arg_idx > m_max_num_options)
            return false;
        m_args.reserve(m_arg_idx);
        while (m_args.size() < m_arg_idx)
        {
            m_args.push_back({});
            std::copy(it_metadata, it_metadata + com::num_bytes(type), &m_chr_idx);
            it_metadata += com::num_bytes(type);
            if (m_chr_idx > m_max_option_size)
                return false;
            m_args.back().reserve(m_chr_idx + 1U);
            m_args.back().resize(m_chr_idx, '\0');
        }
        m_arg_idx = 0U;
        m_chr_idx = 0U;
        while (m_arg_idx < m_args.size() && m_args.at(m_arg_idx).empty())
            ++m_arg_idx;
        return true;
    }

    if (type != com::data_type::UINT8)
        return false;
    if (m_arg_idx >= m_args.size())
        return false;

    m_args.at(m_arg_idx).at(m_chr_idx) = *it_bytes;

    ++m_chr_idx;
    if (m_chr_idx == m_args.at(m_arg_idx).size())
    {
        do { ++m_arg_idx; } while (m_arg_idx < m_args.size() && m_args.at(m_arg_idx).empty());
        m_chr_idx = 0U;
    }

    return true;
}


bool  cmdline::parse_record(com::execution_results&  dst, connection::medium&  src) const
{
    if (!src.can_deliver_bytes(sizeof(natural_16_bit)))
        return false;
    natural_16_bit  argc;
    src >> argc;
    push_back(*dst.get_bytes(), argc);
    dst.get_types()->push_back(com::data_type::UINT16);
    push_back(*dst.get_metadata(), argc);
    for (natural_16_bit  i = 0U; i < argc; ++i)
    {
        if (!src.can_deliver_bytes(sizeof(natural_16_bit)))
            return false;
        natural_16_bit  count;
        src >> count;
        push_back(*dst.get_metadata(), count);
        if (!src.can_deliver_bytes(count * sizeof(natural_16_bit)))
            return false;
        for (natural_16_bit  j = 0U; j < count; ++j)
        {
            natural_8_bit  chr;
            src >> chr;
            push_back(*dst.get_bytes(), chr);
            dst.get_types()->push_back(com::data_type::UINT8);
        }
    }
    return true;
}


natural_64_bit  cmdline::max_construction_data_in_medium() const
{
    return sizeof(m_max_num_options) + sizeof(m_max_option_size);
}


natural_64_bit  cmdline::max_data_in_medium() const
{
    return 1ULL + 2ULL * sizeof(natural_16_bit) + m_max_num_options * (sizeof(natural_16_bit) + m_max_option_size + 1U);
}


com::target_termination  cmdline::on_arguments_requested(int&  argc, char**&  argv, connection::medium* const  dst)
{
    if (m_arg_idx != m_args.size() || !m_argv.empty())
        return com::target_termination::ERROR_IN_DATA;
    m_args.resize(m_argc, {});
    for (std::string&  arg : m_args)
        arg.push_back('\0');
    for (std::string&  arg : m_args)
        m_argv.push_back(arg.data());
    argc = (int)m_argc;
    argv = m_argv.data();

    if (dst == nullptr)
        return com::target_termination::NORMAL;

    if (!dst->can_accept_bytes(sizeof(natural_8_bit) + sizeof(natural_16_bit)))
        return com::target_termination::MEDIUM_OVERFLOW;
    natural_8_bit const record_id{ com::to_record_id(com::record_type::CMDLINE) };
    dst->accept_bytes(&record_id, sizeof(record_id));
    dst->accept_bytes(&m_argc, sizeof(m_argc));
    for (std::string&  arg : m_args)
    {
        natural_16_bit  len{ (natural_16_bit)std::strlen(arg.c_str()) };
        if (len < m_max_option_size)
            ++len;
        if (!dst->can_accept_bytes(sizeof(natural_16_bit) + len * sizeof(natural_8_bit)))
            return com::target_termination::MEDIUM_OVERFLOW;
        dst->accept_bytes(&len, sizeof(len));
        dst->accept_bytes(arg.data(), len);
    }

    return com::target_termination::NORMAL;
}


}
