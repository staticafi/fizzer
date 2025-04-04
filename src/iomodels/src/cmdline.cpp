#include <iomodels/cmdline.hpp>
#include <iomodels/parse_utils.hpp>
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
    natural_16_bit  max_num_options, max_option_size;
    return  read_bytes(max_num_options, src) &&
            read_bytes(max_option_size, src)
            ? create(max_num_options, max_option_size)
            : nullptr;
}


bool  cmdline::save_construction_data(connection::medium&  dst) const
{
    return append_bytes(dst, m_max_num_options) && append_bytes(dst, m_max_option_size);
}


natural_64_bit  cmdline::max_construction_data_in_medium() const
{
    return sizeof(m_max_num_options) + sizeof(m_max_option_size);
}


cmdline_ptr  cmdline::clone() const
{
    return create(m_max_num_options, m_max_option_size);
}


cmdline::cmdline(natural_16_bit const  max_num_options, natural_16_bit const  max_option_size)
    : iomodel{}
    , m_max_num_options{ max_num_options }
    , m_max_option_size{ max_option_size }
    , m_args{}
    , m_argv{}
{}


void  cmdline::clear()
{
    m_args.clear();
    m_argv.clear();
}


natural_64_bit  cmdline::max_data_in_medium() const
{
    return 1ULL + 2ULL * sizeof(natural_16_bit) + m_max_num_options * (sizeof(natural_16_bit) + 2ULL * (m_max_option_size + 1ULL));
}


bool  cmdline::parse_record(
        com::input_bytes::const_iterator&  it_bytes,
        com::input_types::const_iterator&  it_types,
        com::input_metadata::const_iterator&  it_metadata
        )
{
    if (!m_args.empty())
        return false;

    natural_16_bit  new_argc;
    if (!read_expected_bytes(&new_argc, it_bytes, it_types, com::data_type::UINT16))
        return false;
    new_argc = std::max((natural_16_bit)1U, std::min(new_argc, m_max_num_options));

    natural_16_bit  orig_argc; read_bytes(&orig_argc, it_metadata, com::data_type::UINT16);
    m_args.reserve(std::max(orig_argc, new_argc));
    for (natural_16_bit  i = 0U; i < orig_argc; ++i)
    {
        natural_16_bit  num_chars; read_bytes(&num_chars, it_metadata, com::data_type::UINT16);
        m_args.push_back({});
        m_args.back().reserve(num_chars + 1U);
        for (natural_16_bit  j = 0U; j < num_chars; ++j)
            if (!append_expected_bytes(m_args.back(), it_bytes, it_types, com::data_type::UINT8))
                return false;

        if (m_args.back().size() > m_max_option_size)
            m_args.back().resize(m_max_option_size);
        auto const  it{ std::find(m_args.back().begin(), m_args.back().end(), 0U) };
        if (it == m_args.back().end())
            m_args.back().push_back(0U);
        else
            m_args.back().resize(std::distance(m_args.back().begin(), it) + 1);
    }
    m_args.resize(new_argc, { 0 });

    return true;
}


bool  cmdline::parse_record(com::execution_results&  dst, connection::medium&  src) const
{
    append_metadata(dst, get_record_type());
    natural_16_bit  argc;
    if (!append_typed_bytes(dst, com::data_type::UINT16, src, &argc))
        return false;
    append_metadata(dst, argc);
    for (natural_16_bit  i = 0U; i < argc; ++i)
    {
        natural_16_bit  count;
        if (!append_metadata(dst, src, &count) ||
            !append_typed_bytes(dst, com::data_type::UINT8, count, src))
            return false;
    }
    return true;
}


com::target_termination  cmdline::on_arguments_requested(int&  argc, char**&  argv, connection::medium* const  dst)
{
    if (!m_argv.empty())
        return com::target_termination::ERROR_IN_DATA;

    if (m_args.empty())
        m_args.push_back({ 0U });
    for (vecu8&  arg : m_args)
        m_argv.push_back((char*)arg.data());
    m_argv.push_back(nullptr);
    argc = (int)m_args.size();
    argv = m_argv.data();

    if (dst == nullptr)
        return com::target_termination::NORMAL;

    if (!append_metadata(*dst, get_record_type()) ||
        !append_bytes(*dst, (natural_16_bit)argc))
        return com::target_termination::MEDIUM_OVERFLOW;
    for (vecu8&  arg : m_args)
        if (!append_bytes(*dst, (natural_16_bit)arg.size()) ||
            !append_bytes(*dst, arg.data(), arg.size()))
            return com::target_termination::MEDIUM_OVERFLOW;
    return com::target_termination::NORMAL;
}


}
