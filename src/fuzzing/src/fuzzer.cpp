#include <fuzzing/fuzzer.hpp>
#include <fuzzing/progress_recorder.hpp>
#include <utility/assumptions.hpp>
#include <utility/invariants.hpp>
#include <utility/development.hpp>
#include <utility/timeprof.hpp>
#include <map>

namespace  fuzzing {


static natural_32_bit count_calls_to_function(sala::Program const& program, std::string const& func_name)
{
    std::uint32_t const end{ (std::uint32_t)program.functions().size() };
    std::uint32_t func_index{ 0U };
    for ( ; func_index != end; ++func_index)
        if (program.functions().at(func_index).name() == func_name)
            break;
    if (func_index == end)
        return 0U;
    natural_32_bit count{ 0U };
    for (sala::Function const& function : program.functions())
        for (sala::BasicBlock const& block : function.basic_blocks())
            for (sala::Instruction const& instruction : block.instructions())
            {
                if (instruction.opcode() != sala::Instruction::Opcode::CALL)
                    continue;
                if (instruction.descriptors().front() != sala::Instruction::Descriptor::FUNCTION)
                    continue;
                if (instruction.operands().front() != func_index)
                    continue;
                ++count;
            }
    return count;
}


fuzzer::input_flow_analysis_thread::input_flow_analysis_thread(
        sala::Program const* sala_program_ptr,
        target_executor const* const  tgt_exec
        )
    : state{ READY }
    , request{}
    , input_flow{ sala_program_ptr, tgt_exec }
    , worker_stop_flag{ false }
    , mutex{}
    , worker{ std::thread(&input_flow_analysis_thread::worker_thread_procedure, this) }
{}


bool  fuzzer::input_flow_analysis_thread::is_ready() const
{
    std::lock_guard<std::mutex> const lock(mutex);
    return state == READY;
}


bool  fuzzer::input_flow_analysis_thread::is_busy() const
{
    std::lock_guard<std::mutex> const lock(mutex);
    return state == STEADY || state == WORKING;
}


bool  fuzzer::input_flow_analysis_thread::is_finished() const
{
    std::lock_guard<std::mutex> const lock(mutex);
    return state == FINISHED;
}


bool  fuzzer::input_flow_analysis_thread::is_terminated() const
{
    std::lock_guard<std::mutex> const lock(mutex);
    return state == TERMINATED;
}


void  fuzzer::input_flow_analysis_thread::start(
        branching_node* const  node_ptr,
        natural_32_bit const  execution_id,
        float_64_bit const  remaining_seconds
        )
{
    ASSUMPTION(is_ready());

    std::lock_guard<std::mutex> const lock(mutex);

    request.data.input_ptr = node_ptr->get_best_stdin();
    request.data.trace_ptr = node_ptr->get_best_trace();
    request.data.trace_size = node_ptr->get_trace_index() + 1U;
    request.data.sensitive_bits.clear();
    request.changed_nodes.clear();
    request.last_node = nullptr;
    request.execution_id = execution_id;
    request.remaining_seconds = remaining_seconds;

    state = STEADY;
}


void  fuzzer::input_flow_analysis_thread::stop()
{
    {
        std::lock_guard<std::mutex> const lock(mutex);
        worker_stop_flag = true;
    }
    if (worker.joinable())
        worker.join();
    state = TERMINATED;
}


branching_node*  fuzzer::input_flow_analysis_thread::get_node() const
{
    ASSUMPTION(is_ready());
    return request.last_node;
}


std::unordered_set<branching_node*> const&  fuzzer::input_flow_analysis_thread::get_changed_nodes()
{
    ASSUMPTION(is_ready());
    return request.changed_nodes;
}


void  fuzzer::input_flow_analysis_thread::apply_results(branching_node* const  entry_node)
{
    ASSUMPTION(is_finished());

    request.changed_nodes.clear();
    request.last_node = nullptr;

    branching_node*  node{ entry_node };
    std::size_t  trace_index{ 0ULL };
    while (node != nullptr && trace_index < request.data.trace_size)
    {
        ASSUMPTION(node->get_trace_index() == trace_index);

        auto const&  info{ request.data.trace_ptr->at(trace_index) };
        if (node->get_location_id() != info.id)
            break;

        request.last_node = node;
        if (trace_index < request.data.sensitive_bits.size())
            for (auto const  bit_idx : request.data.sensitive_bits.at(trace_index))
                if (node->insert_sensitive_stdin_bit(bit_idx))
                    request.changed_nodes.insert(node);
        if (!node->was_sensitivity_performed())
            request.changed_nodes.insert(node);

        node->set_sensitivity_performed(request.execution_id);

        node = node->successor(info.direction).pointer;
        ++trace_index;
    }

    {
        std::lock_guard<std::mutex> const lock(mutex);
        state = READY;
    }
}

input_flow_analysis::performance_statistics const&  fuzzer::input_flow_analysis_thread::get_statistics() const
{
    ASSUMPTION(!is_busy() || is_terminated());
    return input_flow.get_statistics();
}


void fuzzer::input_flow_analysis_thread::worker_thread_procedure()
{
    while (true)
    {
        input_flow_analysis::computation_io_data*  data_ptr{ nullptr };
        {
            std::lock_guard<std::mutex> const lock(mutex);
            if (worker_stop_flag)
                break;
            if (state == STEADY)
            {
                data_ptr = &request.data;
                state = WORKING;
            }
        }
        if (data_ptr == nullptr)
        {
            //std::this_thread::yield();
            using namespace std::chrono_literals;
            std::this_thread::sleep_for(10ms);
            continue;
        }

        std::chrono::system_clock::time_point const  start_time = std::chrono::system_clock::now();
        input_flow.run(data_ptr, [this, start_time](std::string& error_message) {
            double const num_seconds = std::chrono::duration<double>(std::chrono::system_clock::now() - start_time).count();
            if (num_seconds >= request.remaining_seconds)
            {
                error_message = "[TIME OUT] The time budget " + std::to_string(request.remaining_seconds) + "s for the execution was exhausted.";
                return true;
            }
            bool do_stop;
            {
                std::lock_guard<std::mutex> const lock(mutex);
                do_stop = worker_stop_flag;
            }
            if (do_stop)
            {
                error_message = "[FORCE STOP] The computation was stopped forcefully by the signalled flag.";
                return true;
            }
            return false;
        });

        {
            std::lock_guard<std::mutex> const lock(mutex);
            state = FINISHED;
        }
    }
}


std::string const&  fuzzer::get_analysis_name_from_state(STATE state)
{
    static std::unordered_map<STATE, std::string> const  map {
        { STARTUP, "STARTUP" },
        { BITSHARE, "bitshare" },
        { LOCAL_SEARCH, "local_search" },
    };
    return map.at(state);
}


void  fuzzer::update_close_flags_from(branching_node* const  node)
{
    if (node->is_closed() || node->is_pending())
        return;
    branching_node::successor_pointer const&  left = node->successor(false);
    if (left.pointer != nullptr && !left.pointer->is_closed())
        return;
    branching_node::successor_pointer const&  right = node->successor(true);
    if (right.pointer != nullptr && !right.pointer->is_closed())
        return;

    node->set_closed();

    recorder().on_post_node_closed(node);

    if (node->get_predecessor() != nullptr)
        update_close_flags_from(node->get_predecessor());
}


fuzzer::fuzzer(
        termination_info const&  info,
        sala::Program const* const  sala_program_ptr_,
        target_executor const* const  tgt_exec,
        local_search_analysis::configuration const& local_search_config
        )
    : sala_program_ptr{ sala_program_ptr_ }

    , termination_props{ info }

    , num_branchings_to_cover{ count_calls_to_function(*sala_program_ptr, "__fizzer_process_condition") }

    , num_driver_executions{ 0U }
    , time_point_start{ std::chrono::steady_clock::now() }
    , time_point_current{ time_point_start }

    , entry_branching{}
    , leaf_branchings{}

    , covered_branchings{}
    , uncovered_branchings{}
    , branchings_to_crashes{}

    , strategy{}

    , dead_nodes_buffer{}

    , state{ STARTUP }
    , input_flow_thread{ sala_program_ptr, tgt_exec }
    , bitshare{}
    , local_search{ local_search_config }

    , render_state{ RENDER_STATE::DISABLED }
    , statistics{}
{}


fuzzer::~fuzzer()
{
    terminate();
}


void  fuzzer::terminate()
{
    stop_all_analyzes();

    while (!leaf_branchings.empty())
        remove_leaf_branching_node(*leaf_branchings.begin());
}


void  fuzzer::stop_all_analyzes()
{
    input_flow_thread.stop();
    bitshare.stop();
    local_search.stop();
}


bool  fuzzer::round_begin(
    TERMINATION_REASON&  termination_reason,
    input_bytes&  bytes,
    input_types_ptr&  types,
    input_metadata_ptr&  metadata
    )
{
    TMPROF_BLOCK();

    vecb  bits;
    if (!generate_next_input(bits, types, metadata, termination_reason))
        return false;
    bits_to_bytes(bits, bytes);

    return true;
}


bool  fuzzer::round_end(test_suite_item&  test, execution_results_ptr  results)
{
    TMPROF_BLOCK();

    bool const retval{ process_execution_results(test, results) };
    ++num_driver_executions;
    return retval;
}


bool  fuzzer::generate_next_input(
    vecb&  stdin_bits,
    input_types_ptr&  types,
    input_metadata_ptr&  metadata,
    TERMINATION_REASON&  termination_reason
    )
{
    auto const  find_backup_target = [this](bool const  sensitive) -> branching_node* {
        recorder().on_strategy("Backup_" + std::to_string(sensitive));
        for (auto it = strategy.get_locations_map().begin(); it != strategy.get_locations_map().end(); ++it)
            for (auto dit = it->second.begin(); dit != it->second.end(); ++dit)
                if (strategy.is_valid_target(*dit, sensitive))
                    return *dit;
        recorder().on_strategy();
        return nullptr;
    };

    while (true)
    {
        if (get_performed_driver_executions() > 0U)
        {
            if ((natural_32_bit)covered_branchings.size() == num_branchings_to_cover)
            {
                terminate();
                termination_reason = TERMINATION_REASON::ALL_REACHABLE_BRANCHINGS_COVERED;
                return false;
            }
        }

        time_point_current = std::chrono::steady_clock::now();
        if (num_remaining_seconds() <= 0.0)
        {
            terminate();
            termination_reason = TERMINATION_REASON::TIME_BUDGET_DEPLETED;
            return false;
        }

        if (num_remaining_driver_executions() <= 0U)
        {
            terminate();
            termination_reason = TERMINATION_REASON::EXECUTIONS_BUDGET_DEPLETED;
            return false;
        }

        switch (state)
        {
            case STARTUP:
                if (get_performed_driver_executions() == 0U)
                {
                    types = make_shared_wrapper<input_types>();
                    metadata = make_shared_wrapper<input_metadata>();
                    return true;
                }
                break;

            case BITSHARE:
                if (bitshare.generate_next_input(stdin_bits, types, metadata))
                    return true;
                break;

            case LOCAL_SEARCH:
                if (local_search.generate_next_input(stdin_bits, types, metadata))
                    return true;
                break;

            default: { UNREACHABLE(); break; }
        }

        do_cleanup();

        if (input_flow_thread.is_finished())
        {
            input_flow_thread.apply_results(entry_branching);

            recording_send_taint_response(input_flow_thread.get_node());

            for (branching_node*  node = input_flow_thread.get_node(); node != nullptr; node = node->get_predecessor())
                if (!node->is_closed())
                {
                    update_close_flags_from(node);
                    break;
                }
        }

        if (state == BITSHARE && strategy.is_valid_target(bitshare.get_node(), true))
        {
            recorder().on_strategy();
            local_search.start(bitshare.get_node(), num_driver_executions);
            state = LOCAL_SEARCH;
        }
        else
        {
            branching_node*  target{ strategy.choose_target(entry_branching, true) };
            if (target != nullptr)
            {
                bitshare.start(target, num_driver_executions);
                state = BITSHARE;
            }
        }

        if (input_flow_thread.is_ready())
        {
            branching_node*  target{ strategy.choose_target(entry_branching, false) };
            if (target != nullptr)
            {
                input_flow_thread.start(target, num_driver_executions, num_remaining_seconds());
                recording_send_taint_request(target);
            }
        }

        if (input_flow_thread.is_ready() && bitshare.is_ready() && local_search.is_ready())
        {
            terminate();
            termination_reason = TERMINATION_REASON::FUZZING_STRATEGY_DEPLETED;
            return false;
        }

        stdin_bits.clear();
    }

    UNREACHABLE();
}


bool  fuzzer::process_execution_results(test_suite_item&  test, execution_results_ptr const  results)
{
    test.results = results;
    test.any_location_discovered = false;
    test.covered_locations.clear();
    test.analysis_name = get_analysis_name_from_state(state);

    typed_input_ptr const  current_input{
            std::make_shared<typed_input>(results->get_bytes(), results->get_types(), results->get_metadata())
            };
    execution_trace_ptr const  trace = results->get_trace();

    leaf_branching_construction_props  construction_props;

    if (!trace->empty())
    {
        if (entry_branching == nullptr)
        {
            entry_branching = new branching_node(
                    trace->front().id,
                    0,
                    trace->front().num_input_bytes,
                    trace->front().xor_like_branching_function,
                    trace->front().predicate,
                    nullptr,
                    current_input,
                    trace,
                    num_driver_executions
                    );
            construction_props.diverging_node = entry_branching;

            ++statistics.nodes_created;
        }

        construction_props.leaf = entry_branching;

        trace_index_type  trace_index = 0;
        for (; true; ++trace_index)
        {
            trace_item const&  info = trace->at(trace_index);

            INVARIANT(construction_props.leaf->get_location_id() == info.id);

            if (covered_branchings.count(info.id) == 0)
            {
                auto const  it_along = uncovered_branchings.find({ info.id, info.direction });
                if (it_along == uncovered_branchings.end())
                {
                    auto const  it_escape = uncovered_branchings.find({ info.id, !info.direction });
                    if (it_escape == uncovered_branchings.end())
                    {
                        uncovered_branchings.insert({ info.id, !info.direction });
                        construction_props.any_location_discovered = true;

                        // coverage_control.increment_num_covered_branchings();
                    }

                    construction_props.uncovered_locations[info.id].insert(construction_props.leaf);
                }
                else
                {
                    uncovered_branchings.erase(it_along);
                    covered_branchings.insert(info.id);

                    construction_props.uncovered_locations.erase(info.id);
                    construction_props.covered_locations.insert(info.id);

                    strategy.on_location_covered(info.id);
                    // coverage_control.increment_num_covered_branchings();
                }
            }

            // Here we try to remove bad float (INF, NaN) from 'info.value'.
            // It would be better, if fuzzer and analyses could deal with bad floats, but that is complicated. 
            if (!std::isfinite(info.value) || std::isnan(info.value))
            {
                branching_value&  value_ref{ const_cast<branching_value&>(info.value) };
                switch (info.predicate)
                {
                    case atomic_predicate::EQUAL:
                        value_ref = info.direction ? 0.0 : std::numeric_limits<branching_value>::max();
                        break;
                    case atomic_predicate::UNEQUAL:
                        value_ref = info.direction ? std::numeric_limits<branching_value>::max() : 0.0;
                        break;
                    case atomic_predicate::LESS_EQUAL:
                    case atomic_predicate::LESS:
                        value_ref = (info.direction ? -1.0 : 1.0) * std::numeric_limits<branching_value>::max();
                        break;
                        break;
                    case atomic_predicate::GREATER:
                    case atomic_predicate::GREATER_EQUAL:
                        value_ref = (info.direction ? 1.0 : -1.0) * std::numeric_limits<branching_value>::max();
                        break;
                    default: UNREACHABLE(); break;
                }
            }

            if (!construction_props.leaf->is_direction_unexplored(false) && !construction_props.leaf->is_direction_unexplored(true))
            {
                construction_props.leaf->release_best_data(false);
                dead_nodes_buffer.insert(construction_props.leaf);
            }
            else if (std::fabs(info.value) < std::fabs(construction_props.leaf->get_best_value()))
                construction_props.leaf->update_best_data(current_input, trace, num_driver_executions);

            construction_props.leaf->set_max_successors_trace_index(std::max(
                    construction_props.leaf->get_max_successors_trace_index(),
                    (trace_index_type)(trace->size() - 1)
                    ));

            if (trace_index + 1 == trace->size())
                break;

            if (construction_props.leaf->successor(info.direction).pointer == nullptr)
            {
                for (branching_node*  node = construction_props.leaf; node != nullptr && node->is_closed(); node = node->get_predecessor())
                    node->set_closed(false);

                trace_item const&  succ_info = trace->at(trace_index + 1);
                construction_props.leaf->set_successor(info.direction, {
                    branching_node::successor_pointer::VISITED,
                    new branching_node(
                        succ_info.id,
                        trace_index + 1,
                        succ_info.num_input_bytes,
                        succ_info.xor_like_branching_function,
                        succ_info.predicate,
                        construction_props.leaf,
                        current_input,
                        trace,
                        num_driver_executions
                        )
                });

                ++statistics.nodes_created;

                if (construction_props.diverging_node == nullptr)
                    construction_props.diverging_node = construction_props.leaf->successor(info.direction).pointer;
            }

            construction_props.leaf = construction_props.leaf->successor(info.direction).pointer;
        }

        construction_props.leaf->set_successor(trace->back().direction, {
            std::max(
                results->get_termination() == target_termination::NORMAL ?
                    branching_node::successor_pointer::END_NORMAL :
                    branching_node::successor_pointer::END_EXCEPTIONAL,
                construction_props.leaf->successor(trace->back().direction).label
                ),
            construction_props.leaf->successor(trace->back().direction).pointer
        });

        if (construction_props.diverging_node != nullptr)
        {
            auto const  it_and_state = leaf_branchings.insert(construction_props.leaf);
            INVARIANT(it_and_state.second);

            for (branching_node*  node = construction_props.leaf; node != construction_props.diverging_node->get_predecessor(); node = node->get_predecessor())
                if (!covered_branchings.contains(node->get_location_id()))
                    strategy.on_new_uncovered_node(node);

            ++statistics.leaf_nodes_created;
            statistics.max_leaf_nodes = std::max(statistics.max_leaf_nodes, leaf_branchings.size());
            statistics.longest_branch = std::max(statistics.longest_branch, (std::size_t)(trace_index + 1));
        }
        else
            update_close_flags_from(construction_props.leaf);

        if (statistics.max_input_width < construction_props.leaf->get_num_stdin_bytes())
            statistics.max_input_width = construction_props.leaf->get_num_stdin_bytes();

        test.any_location_discovered = construction_props.any_location_discovered;
        test.covered_locations.assign(construction_props.covered_locations.begin(), construction_props.covered_locations.end());
    }

    switch (results->get_termination())
    {
        case target_termination::CRASH: ++statistics.crashes; break;
        case target_termination::TIMEOUT: ++statistics.target_timeouts; break;
        case target_termination::BOUNDARY_CONDITION_VIOLATION: ++statistics.boundary_violations; break;
        case target_termination::MEDIUM_OVERFLOW: ++statistics.medium_overflows; break;
        case target_termination::ERROR_IN_DATA: ++statistics.data_errors_in_medium; break;
        default: break;
    }

    switch (state)
    {
        case STARTUP:
            INVARIANT(bitshare.is_ready() && local_search.is_ready());
            recorder().on_execution_results_available(test, construction_props.leaf);
            break;

        case BITSHARE:
            INVARIANT(bitshare.is_busy() && local_search.is_ready());
            recorder().on_execution_results_available(test, construction_props.leaf);
            bitshare.process_execution_results(trace);
            if (!bitshare.get_node()->has_unexplored_direction())
                bitshare.stop();
            break;

        case LOCAL_SEARCH:
            INVARIANT(bitshare.is_ready() && local_search.is_busy());
            recorder().on_execution_results_available(test, construction_props.leaf, local_search.get_progress_message());
            local_search.process_execution_results(trace, current_input);
            if (!local_search.get_node()->has_unexplored_direction())
            {
                local_search.stop();
                bitshare.bits_available_for_branching(local_search.get_node(), trace, current_input);
            }
            break;

        default:
            UNREACHABLE();
            break;
    }

    return true;
}


void  fuzzer::do_cleanup()
{
    TMPROF_BLOCK();

    INVARIANT(bitshare.is_ready() && local_search.is_ready());

    switch (state)
    {
        case BITSHARE:
            update_close_flags_from(bitshare.get_node());
            break;
        case LOCAL_SEARCH:
            update_close_flags_from(local_search.get_node());
            break;
        default:
            break;
    }

    std::vector<branching_node*> leaves_to_remove;
    for (branching_node*  leaf : leaf_branchings)
        if (leaf->successor(false).pointer != nullptr || leaf->successor(true).pointer != nullptr)
            leaves_to_remove.push_back(leaf);
    while (!leaves_to_remove.empty())
    {
        remove_leaf_branching_node(leaves_to_remove.back());
        leaves_to_remove.pop_back();
    }

    dead_nodes_buffer.clear();
}


void  fuzzer::remove_leaf_branching_node(branching_node*  node)
{
    TMPROF_BLOCK();

    INVARIANT(bitshare.is_ready() || bitshare.get_node() != node);
    INVARIANT(local_search.is_ready() || local_search.get_node() != node);

    if (leaf_branchings.erase(node) != 0)
        ++statistics.leaf_nodes_destroyed;

    while (node->successor(false).pointer == nullptr && node->successor(true).pointer == nullptr)
    {
        if (leaf_branchings.count(node) != 0)
            break;

        branching_node::successor_pointer::LABEL const  label = std::max(node->successor(false).label, node->successor(true).label);

        branching_node* const  pred = node->get_predecessor();

        strategy.on_erase(node);

        delete node;

        ++statistics.nodes_destroyed;

        if (pred == nullptr)
        {
            INVARIANT(node == entry_branching);
            entry_branching = nullptr;
            break;
        }

        pred->set_successor(pred->successor_direction(node), { label, nullptr});

        node = pred;
    }
}


void  fuzzer::recording_interrupt()
{
    switch (state)
    {
        case BITSHARE:
            if (bitshare.is_busy())
                recorder().on_bitshare_stop(progress_recorder::STOP::INTERRUPTED);
            break;
        case LOCAL_SEARCH:
            if (local_search.is_busy())
                recorder().on_local_search_stop(progress_recorder::STOP::INTERRUPTED);
            break;
        default:
            break;
    }
}


void  fuzzer::recording_resume()
{
    switch (state)
    {
        case BITSHARE:
            if (bitshare.is_busy())
                recorder().on_bitshare_start(bitshare.get_node(), progress_recorder::START::RESUMED);
            break;
        case LOCAL_SEARCH:
            if (local_search.is_busy())
                recorder().on_local_search_start(local_search.get_node(), progress_recorder::START::RESUMED);
            break;
        default:
            break;
    }
}


void  fuzzer::recording_send_taint_request(branching_node const* const  node_ptr)
{
    recording_interrupt();
    recorder().on_taint_request_start(node_ptr, progress_recorder::START::REGULAR);
    recorder().on_taint_request_stop(progress_recorder::STOP::INSTANT);
    recording_resume();
}


void  fuzzer::recording_send_taint_response(branching_node const* const  node_ptr)
{
    recording_interrupt();
    recorder().on_strategy();
    recorder().on_taint_response_start(node_ptr, progress_recorder::START::REGULAR);
    recorder().on_taint_response_stop(progress_recorder::STOP::INSTANT);
    recording_resume();
}


}
