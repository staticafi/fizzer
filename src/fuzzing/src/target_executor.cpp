#include <fuzzing/target_executor.hpp>
#include <com/record_type.hpp>
#include <com/target_termination.hpp>
#include <com/atomic_predicate.hpp>

namespace fuzzing {


static bool  parse_trace_record(com::execution_results&  results, connection::medium&  medium)
{
    if (!medium.can_deliver_bytes(sizeof(location_id) + 1ULL + sizeof(branching_value) + 2ULL))
        return false;

    natural_8_bit uchr;

    location_id  id;
    medium >> id;

    bool  direction;
    medium >> uchr; direction = (uchr & 1U) != 0U;

    branching_value  value;
    medium >> value;

    bool xor_like_branching_function;
    medium >> uchr; xor_like_branching_function = (uchr & 1U) != 0U;

    atomic_predicate predicate;
    medium >> uchr; predicate = com::from_predicate_id(uchr);

    results.get_trace()->push_back(trace_item{
        id,
        direction,
        value,
        xor_like_branching_function,
        predicate,
        results.get_bytes()->size()
    });

    return true;
}


target_executor::target_executor(
        std::string const&  path_to_target,
        natural_16_bit const  max_exec_milliseconds,
        natural_16_bit const  max_exec_megabytes,
        natural_32_bit const  max_trace_length,
        com::mut_type const  mut,
        iomodels::cmdline_ptr  io_cmdline,
        iomodels::simple_ptr  io_simple
        )
    : m_max_exec_megabytes{ max_exec_megabytes }
    , m_max_trace_length{ max_trace_length }
    , m_mut{ mut }
    , m_io_cmdline{ io_cmdline.release() }
    , m_io_simple{ io_simple.release() }
    , m_executor{ path_to_target, max_exec_milliseconds }
    , m_shared_memory{ compute_max_medium_size() }
{}


target_executor::~target_executor()
{
    connection::shared_memory::shut_down();
}


natural_64_bit  target_executor::compute_max_medium_size() const
{
    natural_64_bit  num_to_target{ 0ULL };
    {
        num_to_target += sizeof(m_max_trace_length) + sizeof(m_max_exec_megabytes) + 1UL;
        num_to_target += m_io_cmdline->max_construction_data_in_medium();
        num_to_target += m_io_simple->max_construction_data_in_medium();
    }
    natural_64_bit  num_to_fuzzer{ 0ULL };
    {
        num_to_fuzzer += 2ULL; // Termination.
        num_to_fuzzer += m_max_trace_length * (1ULL + sizeof(location_id) + 1ULL + sizeof(branching_value) + 2ULL);
   }
    natural_64_bit  num_to_both{ 0ULL };
    {
        num_to_both += m_io_cmdline->max_data_in_medium();
        num_to_both += m_io_simple->max_data_in_medium();
    }
    natural_64_bit const  safety_zone{ 64ULL * 1024ULL };
    return std::max(num_to_target, num_to_fuzzer) + num_to_both + safety_zone;
}


execution_results_ptr  target_executor::run(input_bytes const&  bytes, com::input_types const&  types, input_metadata const&  metadata)
{
    auto const error_result = [](){
        return std::make_shared<execution_results>(target_termination::ERROR_IN_DATA, std::make_shared<com::input_metadata>());
    };

    get_medium().clear();

    // Writing data to medium for the target.

    if (!get_medium().can_accept_bytes(sizeof(m_max_trace_length) + sizeof(m_max_exec_megabytes) + 1UL)) return error_result();
    get_medium() << m_max_trace_length << m_max_exec_megabytes << com::to_mut_id(m_mut);

    if (!m_io_cmdline->save_construction_data(get_medium())) return error_result();
    if (!m_io_simple->save_construction_data(get_medium())) return error_result();

    if (!get_medium().can_accept_bytes(3ULL * sizeof(std::size_t) + bytes.size() + types.size() + metadata.size())) return error_result();
    get_medium() << bytes.size();
    get_medium().accept_bytes(bytes.data(), bytes.size());
    get_medium() << types.size();
    get_medium().accept_bytes(types.data(), types.size());
    get_medium() << metadata.size();
    get_medium().accept_bytes(metadata.data(), metadata.size());

    // Executing the target.

    connection::process_termination const  process_termination{ m_executor.run() };

    // Reading data from the medium (written to by the target).

    target_termination  termination;
    {
        if (!get_medium().can_deliver_bytes(2ULL)) return error_result();
        natural_8_bit  rec_id, ter_id;
        get_medium() >> rec_id >> ter_id;
        if (com::from_record_id(rec_id) != com::record_type::TERMINATION) return error_result();
        termination = com::from_termination_id(ter_id);
        if (!com::valid_termination(termination)) return error_result();
        if (process_termination.killed)
            termination = target_termination::TIMEOUT;
        else if (termination == com::target_termination::PENDING)
        {
            if (process_termination.exit_code == 0)
                termination = target_termination::NORMAL;
            else
                termination = target_termination::CRASH;
        }
    }

    execution_results_ptr const  results{ std::make_shared<execution_results>(termination, std::make_shared<com::input_metadata>()) };
    while (!get_medium().exhausted())
    {
        if (!get_medium().can_deliver_bytes(1ULL))
            return error_result();
        natural_8_bit  rec_id;
        get_medium() >> rec_id;
        switch (com::from_record_id(rec_id))
        {
            case com::record_type::TRACE: if (!parse_trace_record(*results, get_medium())) return error_result(); break;
            case com::record_type::CMDLINE: if (!m_io_cmdline->parse_record(*results, get_medium())) return error_result(); break;
            case com::record_type::SIMPLE: if (!m_io_simple->parse_record(*results, get_medium())) return error_result(); break;
            default: return error_result();
        }
    }

    return results;
}


}
