#include <fuzzing/sala_executor.hpp>
#include <com/record_type.hpp>
#include <com/target_termination.hpp>
#include <com/atomic_predicate.hpp>
#include <connection/medium.hpp>
#include <sala/interpreter.hpp>
#include <sala/sanitizer.hpp>
#include <sala/input_flow.hpp>
#include <sala/extern_code_cstd.hpp>
#include <iomodels/loader.hpp>
#include <utility/assumptions.hpp>
#include <utility/invariants.hpp>
#include <utility/timeprof.hpp>
#include <utility/config.hpp>
#if COMPILER() == COMPILER_VC()
    struct INT128 { std::int64_t _[2]; }; 
    struct UINT128 { std::uint64_t _[2]; }; 
#else
#   define INT128 __int128 
#   define UINT128 unsigned __int128 
#endif
#include <vector>
#include <algorithm>
#include <sstream>
#include <chrono>
#include <cstring>

namespace fuzzing::detail {


struct  medium final : public connection::medium
{
    explicit  medium(natural_8_bit*  address, std::size_t  size);
    void  clear() override { UNREACHABLE(); }
    bool  can_accept_bytes(std::size_t  n) const override { return false; }
    bool  can_deliver_bytes(std::size_t  n) const override { return get_size() >= get_cursor() + n; }
    void  accept_bytes(const void*  src, std::size_t  n) override { UNREACHABLE(); }
    void  deliver_bytes(void*  dest, std::size_t  n) override;
    bool  exhausted() const override { return get_cursor() >= get_size(); }
    natural_8_bit*  get_address() const override { return m_address; }
    std::size_t get_size() const override { return m_size; }
    void set_size(std::size_t  bytes) override { UNREACHABLE(); }
    natural_64_bit  get_num_stored() const override { return get_size(); }
    natural_64_bit  get_cursor() const override { return m_cursor; }
    void  set_cursor(natural_64_bit const  c) override { m_cursor = c; }

private:

    natural_8_bit*  m_address;
    std::size_t  m_size;
    natural_64_bit  m_cursor;
};


medium::medium(natural_8_bit* const  address, std::size_t const  size)
    : connection::medium()
    , m_address{ address }
    , m_size{ size }
    , m_cursor{ 0ULL }
{}


void  medium::deliver_bytes(void* const  dest, std::size_t const  n)
{
    std::memcpy(dest, m_address + m_cursor, n);
    m_cursor += (natural_64_bit)n;
}


struct extern_code : public sala::ExternCodeCStd
{
    extern_code(
        sala::ExecState*  state,
        sala::Sanitizer*  sanitizer,
        iomodels::cmdline*  io_cmdline,
        iomodels::simple*  io_simple,
        execution_results_ptr  results_ptr
        );
    iomodels::cmdline&  io_cmdline() { return *io_cmdline_; }
    iomodels::simple&  io_simple() { return *io_simple_; }
    execution_results&  results() { return *results_ptr_; }
private:
    void  cmdline_read_argc();
    void  cmdline_read_char();
    sala::MemPtr  simple_read(data_type  type);
    sala::MemPtr  simple_read_i128();
    iomodels::cmdline*  io_cmdline_;
    iomodels::simple*  io_simple_;
    execution_results_ptr  results_ptr_;
};


extern_code::extern_code(
        sala::ExecState* const  state,
        sala::Sanitizer* const  sanitizer,
        iomodels::cmdline*  io_cmdline,
        iomodels::simple* const  io_simple,
        execution_results_ptr const  results_ptr
        )
    : sala::ExternCodeCStd{ state, sanitizer }
    , io_cmdline_{ io_cmdline }
    , io_simple_{ io_simple }
    , results_ptr_{ results_ptr }
{
    register_code("__fizzer_private_io_model_cmdline_read_argc", [this]() { this->cmdline_read_argc(); });
    register_code("__fizzer_private_io_model_cmdline_read_char", [this]() { this->cmdline_read_char(); });

    register_code("__VERIFIER_nondet_bool", [this]() { auto const ptr = this->simple_read(data_type::BOOLEAN); *(bool*)ptr = *ptr != 0; });
    register_code("__VERIFIER_nondet_char", [this]() { this->simple_read(data_type::SINT8); });
    register_code("__VERIFIER_nondet_short", [this]() { this->simple_read(data_type::SINT16); });
    register_code("__VERIFIER_nondet_int", [this]() { this->simple_read(data_type::SINT32); });
    register_code("__VERIFIER_nondet_long", [this]() { this->simple_read(program().num_cpu_bits() == 32U ? data_type::SINT32 : data_type::SINT64); });
    register_code("__VERIFIER_nondet_longlong", [this]() { this->simple_read(data_type::SINT64); });
    register_code("__VERIFIER_nondet_uchar", [this]() { this->simple_read(data_type::UINT8); });
    register_code("__VERIFIER_nondet_ushort", [this]() { this->simple_read(data_type::UINT16); });
    register_code("__VERIFIER_nondet_uint", [this]() { this->simple_read(data_type::UINT32); });
    register_code("__VERIFIER_nondet_ulong", [this]() { this->simple_read(program().num_cpu_bits() == 32U ? data_type::UINT32 : data_type::UINT64); });
    register_code("__VERIFIER_nondet_ulonglong", [this]() { this->simple_read(data_type::UINT64); });
    register_code("__VERIFIER_nondet_int128", [this]() { this->simple_read_i128(); });
    register_code("__VERIFIER_nondet_uint128", [this]() { this->simple_read_i128(); });
    register_code("__VERIFIER_nondet_float", [this]() { this->simple_read(data_type::FLOAT32); });
    register_code("__VERIFIER_nondet_double", [this]() { this->simple_read(data_type::FLOAT64); });
}


void  extern_code::cmdline_read_argc()
{
    sala::MemPtr const  ptr{ parameters().front().read<sala::MemPtr>() };
    if (io_cmdline().on_argc(ptr) != target_termination::NORMAL)
    {
        state().set_stage(sala::ExecState::Stage::FINISHED);
        state().set_termination(
            sala::ExecState::Termination::ERROR,
            "input_flow_analysis[extern_code]",
            state().current_location_message() + ": Call to 'io_cmdline().on_argc()' has failed."
            );
    }
    else
        iomodels::cmdline::parse_value(results(), data_type::UINT8, medium{ ptr, num_bytes(data_type::UINT8) });
}


void  extern_code::cmdline_read_char()
{
    sala::MemPtr const  ptr{ parameters().front().read<sala::MemPtr>() };
    if (io_cmdline().on_char((char*)ptr) != target_termination::NORMAL)
    {
        state().set_stage(sala::ExecState::Stage::FINISHED);
        state().set_termination(
            sala::ExecState::Termination::ERROR,
            "input_flow_analysis[extern_code]",
            state().current_location_message() + ": Call to 'io_cmdline().on_char()' has failed."
            );
    }
    else
        iomodels::cmdline::parse_value(results(), data_type::SINT8, medium{ ptr, num_bytes(data_type::UINT8) });
}


sala::MemPtr  extern_code::simple_read(data_type const  type)
{
    sala::MemPtr const ptr{ parameters().front().read<sala::MemPtr>() };
    if (io_simple().on_bytes_requested(ptr, type) != target_termination::NORMAL)
    {
        state().set_stage(sala::ExecState::Stage::FINISHED);
        state().set_termination(
            sala::ExecState::Termination::ERROR,
            "input_flow_analysis[extern_code]",
            state().current_location_message() +
                ": Call to 'io_simple().on_bytes_requested(" +
                com::to_string(type) +
                ")' has failed."
            );
    }
    else
        iomodels::simple::parse_value(results(), type, medium{ ptr, num_bytes(type) });
    return ptr;
}


sala::MemPtr  extern_code::simple_read_i128()
{
    auto const& report_error = [this]() {
        state().set_stage(sala::ExecState::Stage::FINISHED);
        state().set_termination(
            sala::ExecState::Termination::ERROR,
            "input_flow_analysis[extern_code]",
            state().current_location_message() +
                ": Call to 'io_simple().on_bytes_requested(i128)' has failed."
            );
    };

    sala::MemPtr const ptr{ parameters().front().read<sala::MemPtr>() };
    if (io_simple().on_bytes_requested(ptr, data_type::UNTYPED64) != target_termination::NORMAL)
    {
        report_error();
        return ptr;
    }
    auto const  count{ num_bytes(data_type::UNTYPED64) };
    if (io_simple().on_bytes_requested(ptr + count, data_type::UNTYPED64) != target_termination::NORMAL)
    {
        report_error();
        return ptr;
    }
    iomodels::simple::parse_value(results(), data_type::UNTYPED64, medium{ ptr, count });
    iomodels::simple::parse_value(results(), data_type::UNTYPED64, medium{ ptr + count, count });
    return ptr;
}


struct input_flow final : public sala::InputFlow
{
    input_flow(execution_results_ptr  results, sala::ExecState*  state);
    execution_results&  results() { return *results_; }

private:
    void start_input_flow(sala::MemPtr ptr, std::size_t count);
    void start_input_flow(std::size_t const count) { start_input_flow(parameters().front().read<sala::MemPtr>(), count); }
    void do_ret() override;

    void on_process_condition(
            location_id const  id,
            bool const  direction,
            branching_value const  value,
            bool const  xor_like_branching_function,
            natural_8_bit const  predicate
            );

    execution_results_ptr  results_;
    sala::InputFlow::InputDescriptor  fresh_descriptor_;
    bool  some_input_was_read_;
};


input_flow::input_flow(execution_results_ptr const  results, sala::ExecState* const  state)
    : sala::InputFlow{ state }
    , results_{ results }
    , fresh_descriptor_{ 0U }
    , some_input_was_read_{ false }
{
    REGISTER_EXTERN_FUNCTION_PROCESSOR(__fizzer_private_io_model_cmdline_read_argc, this->start_input_flow(sizeof(natural_8_bit)) );
    REGISTER_EXTERN_FUNCTION_PROCESSOR(__fizzer_private_io_model_cmdline_read_char, this->start_input_flow(sizeof(char)) );

    REGISTER_EXTERN_FUNCTION_PROCESSOR(__VERIFIER_nondet_bool, this->start_input_flow(sizeof(bool)) );
    REGISTER_EXTERN_FUNCTION_PROCESSOR(__VERIFIER_nondet_char, this->start_input_flow(sizeof(std::int8_t)) );
    REGISTER_EXTERN_FUNCTION_PROCESSOR(__VERIFIER_nondet_short, this->start_input_flow(sizeof(std::int16_t)) );
    REGISTER_EXTERN_FUNCTION_PROCESSOR(__VERIFIER_nondet_int, this->start_input_flow(sizeof(std::int32_t)) );
    REGISTER_EXTERN_FUNCTION_PROCESSOR(__VERIFIER_nondet_long, this->start_input_flow(program().num_cpu_bits() == 32U ? sizeof(std::int32_t) : sizeof(std::int64_t)) );
    REGISTER_EXTERN_FUNCTION_PROCESSOR(__VERIFIER_nondet_longlong, this->start_input_flow(sizeof(std::int64_t)) );
    REGISTER_EXTERN_FUNCTION_PROCESSOR(__VERIFIER_nondet_uchar, this->start_input_flow(sizeof(std::uint8_t)) );
    REGISTER_EXTERN_FUNCTION_PROCESSOR(__VERIFIER_nondet_ushort, this->start_input_flow(sizeof(std::uint16_t)) );
    REGISTER_EXTERN_FUNCTION_PROCESSOR(__VERIFIER_nondet_uint, this->start_input_flow(sizeof(std::uint32_t)) );
    REGISTER_EXTERN_FUNCTION_PROCESSOR(__VERIFIER_nondet_ulong, this->start_input_flow(program().num_cpu_bits() == 32U ? sizeof(std::uint32_t) : sizeof(std::uint64_t)) );
    REGISTER_EXTERN_FUNCTION_PROCESSOR(__VERIFIER_nondet_ulonglong, this->start_input_flow(sizeof(std::uint64_t)) );
    REGISTER_EXTERN_FUNCTION_PROCESSOR(__VERIFIER_nondet_float, this->start_input_flow(sizeof(float)) );
    REGISTER_EXTERN_FUNCTION_PROCESSOR(__VERIFIER_nondet_double, this->start_input_flow(sizeof(double)) );
}


void input_flow::start_input_flow(sala::MemPtr const ptr, std::size_t const count)
{
    for (std::size_t i = 0ULL; i != count; ++i, ++fresh_descriptor_)
        start(ptr + i, fresh_descriptor_);
    some_input_was_read_ = true;
}


void input_flow::do_ret()
{
    if (some_input_was_read_ && state().current_function().name() == "__fizzer_process_condition")
    {
        results().get_trace()->push_back(com::trace_item{
                parameters().at(0).read<location_id>(),
                parameters().at(1).read<bool>(),
                parameters().at(2).read<branching_value>(),
                parameters().at(3).read<bool>(),
                com::from_predicate_id(parameters().at(4).read<natural_8_bit>()),
                results().get_bytes()->size()
                });
        results().get_trace()->back().sensitive_bits_ptr = make_unique_wrapper<std::unordered_set<natural_32_bit>>();
        std::unordered_set<natural_32_bit>&  sensitive_bits{ *results().get_trace()->back().sensitive_bits_ptr.get() };
        sala::MemPtr ptr{ parameters().at(2).start() };
        for (std::size_t i = 0ULL; i != sizeof(branching_value); ++i)
            for (auto const& desc : read(ptr + i)->descriptors())
                for (std::size_t j = 0ULL; j != 8ULL; ++j)
                    sensitive_bits.insert(8ULL * desc + j);
    }
    sala::InputFlow::do_ret();
}


}

namespace fuzzing {


sala_executor::sala_executor(
        std::shared_ptr<sala::Program> const  program_ptr,
        natural_16_bit const  max_exec_milliseconds,
        natural_16_bit const  max_exec_megabytes,
        natural_32_bit const  max_trace_length,
        iomodels::cmdline_ptr  io_cmdline,
        iomodels::simple_ptr  io_simple
        )
    : target_executor(max_exec_megabytes, max_trace_length, std::move(io_cmdline), std::move(io_simple))
    , program_ptr_{ program_ptr }
    , max_exec_milliseconds_{ max_exec_milliseconds }
    , remaining_seconds_{ [this]() { return 0U; } }
{
    ASSUMPTION(program_ptr != nullptr);
}


execution_results_ptr  sala_executor::run(input_bytes const&  bytes, com::input_types const&  types, input_metadata const&  metadata)
{
    execution_results_ptr const  results_ptr{ std::make_shared<execution_results>(target_termination::NORMAL, make_shared_wrapper<com::input_metadata>()) };

    iomodels::load_models(bytes, types, metadata, { &io_cmdline(), &io_simple() });

    sala::ExecState  state{ program_ptr_.get(), max_exec_megabytes() * 1024ULL * 1024ULL };
    sala::Sanitizer  sanitizer{ &state };
    detail::input_flow  flow{ results_ptr, &state };
    detail::extern_code  externals{ &state, &sanitizer, &io_cmdline(), &io_simple(), results_ptr };
    sala::Interpreter  interpreter{ &state, &externals, { &sanitizer, &flow } };

    float_64_bit const remaining_seconds{ remaining_seconds_() };
    std::chrono::system_clock::time_point const  start_time = std::chrono::system_clock::now();
    try
    {
        interpreter.run([start_time, remaining_seconds](std::string& error_message) {
            double const num_seconds = std::chrono::duration<double>(std::chrono::system_clock::now() - start_time).count();
            if (num_seconds >= remaining_seconds)
            {
                error_message = "[TIME OUT] The time budget " + std::to_string(remaining_seconds) + "s for the execution was exhausted.";
                return true;
            }
            return false;
        });
    }
    catch (...)
    {
        results_ptr->get_termination() = target_termination::CRASH; // Should be INTERNAL_ERROR.
    }

    return results_ptr;
}


}
