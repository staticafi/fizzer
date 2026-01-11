#include <fuzzing/sala_executor.hpp>
#include <com/record_type.hpp>
#include <com/target_termination.hpp>
#include <com/atomic_predicate.hpp>
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

namespace fuzzing {


struct extern_code : public sala::ExternCodeCStd
{
    extern_code(
        sala::ExecState*  state,
        sala::Sanitizer*  sanitizer,
        iomodels::cmdline*  io_cmdline,
        iomodels::simple*  io_simple
        );
    iomodels::cmdline&  io_cmdline() { return *io_cmdline_; }
    iomodels::simple&  io_simple() { return *io_simple_; }
private:
    void  cmdline_read_argc();
    void  cmdline_read_char();
    sala::MemPtr  simple_read(std::size_t count);
    sala::MemPtr  simple_read_i128();
    iomodels::cmdline*  io_cmdline_;
    iomodels::simple*  io_simple_;
};


extern_code::extern_code(
        sala::ExecState* const  state,
        sala::Sanitizer* const  sanitizer,
        iomodels::cmdline*  io_cmdline,
        iomodels::simple* const  io_simple
        )
    : sala::ExternCodeCStd{ state, sanitizer }
    , io_cmdline_{ io_cmdline }
    , io_simple_{ io_simple }
{
    register_code("__fizzer_private_io_model_cmdline_read_argc", [this]() { this->cmdline_read_argc(); });
    register_code("__fizzer_private_io_model_cmdline_read_char", [this]() { this->cmdline_read_char(); });

    register_code("__VERIFIER_nondet_bool", [this]() { auto const ptr = this->simple_read(sizeof(bool)); *(bool*)ptr = *ptr != 0; });
    register_code("__VERIFIER_nondet_char", [this]() { this->simple_read(sizeof(std::int8_t)); });
    register_code("__VERIFIER_nondet_short", [this]() { this->simple_read(sizeof(std::int16_t)); });
    register_code("__VERIFIER_nondet_int", [this]() { this->simple_read(sizeof(std::int32_t)); });
    register_code("__VERIFIER_nondet_long", [this]() { this->simple_read(program().num_cpu_bits() == 32U ? sizeof(std::int32_t) : sizeof(std::int64_t)); });
    register_code("__VERIFIER_nondet_longlong", [this]() { this->simple_read(sizeof(std::int64_t)); });
    register_code("__VERIFIER_nondet_uchar", [this]() { this->simple_read(sizeof(std::uint8_t)); });
    register_code("__VERIFIER_nondet_ushort", [this]() { this->simple_read(sizeof(std::uint16_t)); });
    register_code("__VERIFIER_nondet_uint", [this]() { this->simple_read(sizeof(std::uint32_t)); });
    register_code("__VERIFIER_nondet_ulong", [this]() { this->simple_read(program().num_cpu_bits() == 32U ? sizeof(std::uint32_t) : sizeof(std::uint64_t)); });
    register_code("__VERIFIER_nondet_ulonglong", [this]() { this->simple_read(sizeof(std::uint64_t)); });
    register_code("__VERIFIER_nondet_int128", [this]() { this->simple_read_i128(); });
    register_code("__VERIFIER_nondet_uint128", [this]() { this->simple_read_i128(); });
    register_code("__VERIFIER_nondet_float", [this]() { this->simple_read(sizeof(float)); });
    register_code("__VERIFIER_nondet_double", [this]() { this->simple_read(sizeof(double)); });
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
}


sala::MemPtr  extern_code::simple_read(std::size_t const count)
{
    data_type  type;
    switch (count)
    {
        case 1ULL: type = data_type::UNTYPED8; break;
        case 2ULL: type = data_type::UNTYPED16; break;
        case 4ULL: type = data_type::UNTYPED32; break;
        case 8ULL: type = data_type::UNTYPED64; break;
        default: UNREACHABLE(); break;
    }
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
    if (io_simple().on_bytes_requested(ptr + 8ULL, data_type::UNTYPED64) != target_termination::NORMAL)
        report_error();
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
        results().get_trace()->back().sensitive_bits_ptr = std::make_unique<std::unordered_set<natural_32_bit>>();
        std::unordered_set<natural_32_bit>&  sensitive_bits{ *results().get_trace()->back().sensitive_bits_ptr.get() };
        sala::MemPtr ptr{ parameters().at(2).start() };
        for (std::size_t i = 0ULL; i != sizeof(branching_value); ++i)
            for (auto const& desc : read(ptr + i)->descriptors())
                for (std::size_t j = 0ULL; j != 8ULL; ++j)
                    sensitive_bits.insert(8ULL * desc + j);
    }
    sala::InputFlow::do_ret();
}


sala_executor::sala_executor(
        sala::Program const*  program_ptr,
        natural_16_bit const  max_exec_milliseconds,
        natural_16_bit const  max_exec_megabytes,
        natural_32_bit const  max_trace_length,
        iomodels::cmdline_ptr  io_cmdline,
        iomodels::simple_ptr  io_simple,
        std::function<float_64_bit()> const&  remaining_seconds
        )
    : target_executor(max_exec_megabytes, max_trace_length, std::move(io_cmdline), std::move(io_simple))
    , program_ptr_{ program_ptr }
    , remaining_seconds_{ remaining_seconds }
{
    ASSUMPTION(program_ptr != nullptr);
}


execution_results_ptr  sala_executor::run(input_bytes const&  bytes, com::input_types const&  types, input_metadata const&  metadata)
{
    execution_results_ptr const  results_ptr{ std::make_shared<execution_results>(target_termination::NORMAL, make_shared_wrapper<com::input_metadata>()) };

    iomodels::load_models(bytes, types, metadata, { &io_cmdline(), &io_simple() });

    sala::ExecState  state{ program_ptr_, max_exec_megabytes() * 1024ULL * 1024ULL };
    sala::Sanitizer  sanitizer{ &state };
    input_flow  flow{ results_ptr, &state };
    extern_code  externals{ &state, &sanitizer, &io_cmdline(), &io_simple() };
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
    catch (...) {}

    return results_ptr;
}


}
