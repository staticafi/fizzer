#include <target/driver.hpp>
#include <iomodels/loader.hpp>
#include <com/record_type.hpp>

namespace target {


driver& driver::instance()
{
    static driver drv{};
    return drv;
}


driver::driver()
    : m_valid{ true }
    , m_shared_memory{}
    , m_mutex{}
    , m_trace_length{ 0U }
    , m_max_trace_length{}
    , m_max_exec_megabytes{}
    , m_io_cmdline{ nullptr }
    , m_io_simple{ nullptr }
{
    // Read data from the medium.

    natural_8_bit uchr;
    natural_64_bit  num_bytes;

    if (!m_shared_memory.can_deliver_bytes(sizeof(m_max_trace_length) + sizeof(m_max_exec_megabytes) + 1UL)) { set_invalid(); return; }
    m_shared_memory >> m_max_trace_length >> m_max_exec_megabytes;

    m_io_cmdline = iomodels::cmdline::create(m_shared_memory);
    if (m_io_cmdline == nullptr) { set_invalid(); return; }
    m_io_simple = iomodels::simple::create(m_shared_memory);
    if (m_io_simple == nullptr) { set_invalid(); return; }

    com::input_bytes  bytes;
    if (!m_shared_memory.can_deliver_bytes(sizeof(natural_64_bit))) { set_invalid(); return; }
    m_shared_memory >> num_bytes;
    if (!m_shared_memory.can_deliver_bytes(num_bytes)) { set_invalid(); return; }
    bytes.resize(num_bytes, 0U);
    m_shared_memory.deliver_bytes(bytes.data(), num_bytes);

    com::input_types  types;
    if (!m_shared_memory.can_deliver_bytes(sizeof(natural_64_bit))) { set_invalid(); return; }
    m_shared_memory >> num_bytes;
    if (!m_shared_memory.can_deliver_bytes(num_bytes)) { set_invalid(); return; }
    types.resize(num_bytes, com::data_type::UNTYPED8);
    m_shared_memory.deliver_bytes(types.data(), num_bytes);

    com::input_metadata  metadata;
    if (!m_shared_memory.can_deliver_bytes(sizeof(natural_64_bit))) { set_invalid(); return; }
    m_shared_memory >> num_bytes;
    if (!m_shared_memory.can_deliver_bytes(num_bytes)) { set_invalid(); return; }
    metadata.resize(num_bytes, 0U);
    m_shared_memory.deliver_bytes(metadata.data(), num_bytes);

    // Feed data to IO models

    iomodels::load_models(bytes, types, metadata, {
        m_io_cmdline.get(),
        m_io_simple.get()
        });

    // Prepare the medium for writing data.

    m_shared_memory.clear();

    if (!m_shared_memory.can_accept_bytes(2ULL)) { set_invalid(); return; }
    m_shared_memory << com::to_record_id(com::record_type::TERMINATION) << com::to_termination_id(com::target_termination::PENDING);
}


void driver::set_invalid()
{
    m_valid = false;
    m_shared_memory.clear();
}


bool  driver::set_termination(com::target_termination const termination)
{
    if (!valid())
        return false;
    natural_8_bit* const  termination_ptr{ m_shared_memory.get_address() + 1ULL };
    if (com::from_termination_id(*termination_ptr) >= termination)
        return false;
    *termination_ptr = com::to_termination_id(termination);
    return true;
}


com::target_termination  driver::on_location_hit(
    com::location_id const  loc_id,
    bool const  direction,
    com::branching_value const  value,
    bool const  xor_like_branching_function,
    com::atomic_predicate const  predicate
    )
{
    natural_8_bit uchr;

    if (m_shared_memory.get_num_stored() <= 2ULL)
        return com::target_termination::NORMAL;
    if (m_trace_length >= m_max_trace_length)
        return com::target_termination::BOUNDARY_CONDITION_VIOLATION;
    
    if (!m_shared_memory.can_accept_bytes(1ULL + sizeof(com::location_id) + 1ULL + sizeof(com::branching_value) + 2ULL))
        return com::target_termination::MEDIUM_OVERFLOW;
    m_shared_memory << com::to_record_id(com::record_type::TRACE);
    m_shared_memory << loc_id;
    uchr = direction ? 1U : 0U; m_shared_memory << uchr;
    m_shared_memory << value;
    uchr = xor_like_branching_function ? 1U : 0U; m_shared_memory << uchr;
    m_shared_memory << com::to_predicate_id(predicate);

    ++m_trace_length;    

    return com::target_termination::NORMAL;
}


}


void  check(com::target_termination const  termination)
{
    if (termination > com::target_termination::NORMAL)
    {
        set_termination(termination);
        exit(0);
    }
}
