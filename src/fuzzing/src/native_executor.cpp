#include <fuzzing/native_executor.hpp>
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


native_executor::native_executor(
        std::string const&  path_to_target,
        natural_16_bit const  max_exec_milliseconds,
        natural_16_bit const  max_exec_megabytes,
        natural_32_bit const  max_trace_length,
        iomodels::cmdline_ptr  io_cmdline,
        iomodels::simple_ptr  io_simple
        )
    : target_executor(max_exec_megabytes, max_trace_length, std::move(io_cmdline), std::move(io_simple))
    , m_executor{ path_to_target, max_exec_milliseconds }
    , m_shared_memory{ compute_max_medium_size() }
{}


native_executor::~native_executor()
{
    connection::shared_memory::shut_down();
}


natural_64_bit  native_executor::compute_max_medium_size() const
{
    natural_64_bit  num_to_target{ 0ULL };
    {
        num_to_target += sizeof(max_trace_length()) + sizeof(max_exec_megabytes()) + 1UL;
        num_to_target += io_cmdline().max_construction_data_in_medium();
        num_to_target += io_simple().max_construction_data_in_medium();
    }
    natural_64_bit  num_to_fuzzer{ 0ULL };
    {
        num_to_fuzzer += 2ULL; // Termination.
        num_to_fuzzer += max_trace_length() * (1ULL + sizeof(location_id) + 1ULL + sizeof(branching_value) + 2ULL);
   }
    natural_64_bit  num_to_both{ 0ULL };
    {
        num_to_both += io_cmdline().max_data_in_medium();
        num_to_both += io_simple().max_data_in_medium();
    }
    natural_64_bit const  safety_zone{ 64ULL * 1024ULL };
    return std::max(num_to_target, num_to_fuzzer) + num_to_both + safety_zone;
}


execution_results_ptr  native_executor::run(input_bytes const&  bytes, com::input_types const&  types, input_metadata const&  metadata)
{
    auto const error_result = [](){
        return std::make_shared<execution_results>(target_termination::ERROR_IN_DATA, make_shared_wrapper<com::input_metadata>());
    };
    auto const partial_result = [](execution_results_ptr const  results){
        results->get_termination() = target_termination::ERROR_IN_DATA;
        return results;
    };

    get_medium().clear();

    // Writing data to medium for the target.

    if (!get_medium().can_accept_bytes(sizeof(max_trace_length()) + sizeof(max_exec_megabytes()) + 1UL)) return error_result();
    get_medium() << max_trace_length() << max_exec_megabytes();

    if (!io_cmdline().save_construction_data(get_medium())) return error_result();
    if (!io_simple().save_construction_data(get_medium())) return error_result();

    if (!get_medium().can_accept_bytes(3ULL * sizeof(natural_64_bit) + bytes.size() + types.size() + metadata.size())) return error_result();
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

    execution_results_ptr const  results{ std::make_shared<execution_results>(termination, make_shared_wrapper<com::input_metadata>()) };
    while (!get_medium().exhausted())
    {
        if (!get_medium().can_deliver_bytes(1ULL)) return partial_result(results);
        natural_8_bit  rec_id;
        get_medium() >> rec_id;
        switch (com::from_record_id(rec_id))
        {
            case com::record_type::TRACE: if (!parse_trace_record(*results, get_medium())) return partial_result(results); break;
            case com::record_type::CMDLINE: if (!io_cmdline().parse_record(*results, get_medium())) return partial_result(results); break;
            case com::record_type::SIMPLE: if (!io_simple().parse_record(*results, get_medium())) return partial_result(results); break;
            default: return partial_result(results);
        }
    }

    return results;
}


}
