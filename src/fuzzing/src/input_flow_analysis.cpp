#include <fuzzing/input_flow_analysis.hpp>
#include <fuzzing/progress_recorder.hpp>
#include <fuzzing/target_executor.hpp>
#include <connection/medium.hpp>
#include <iomodels/loader.hpp>
#include <iomodels/cmdline.hpp>
#include <iomodels/simple.hpp>
#include <sala/interpreter.hpp>
#include <sala/sanitizer.hpp>
#include <sala/input_flow.hpp>
#include <sala/extern_code_cstd.hpp>
#include <utility/assumptions.hpp>
#include <utility/invariants.hpp>
#include <utility/timeprof.hpp>
#include <vector>
#include <algorithm>
#include <sstream>
#include <chrono>

namespace  fuzzing {


struct extern_code : public sala::ExternCodeCStd
{
    extern_code(
        sala::ExecState*  state,
        sala::Sanitizer*  sanitizer,
        iomodels::simple*  io_simple
        );
    iomodels::simple&  io_simple() { return *io_simple_; }
private:
    void read(std::size_t count);
    iomodels::simple*  io_simple_;
};


extern_code::extern_code(
        sala::ExecState* const  state,
        sala::Sanitizer* const  sanitizer,
        iomodels::simple* const  io_simple
        )
    : sala::ExternCodeCStd{ state, sanitizer }
    , io_simple_{ io_simple }
{
    register_code("__VERIFIER_nondet_bool", [this]() { this->read(sizeof(bool)); });
    register_code("__VERIFIER_nondet_char", [this]() { this->read(sizeof(std::int8_t)); });
    register_code("__VERIFIER_nondet_short", [this]() { this->read(sizeof(std::int16_t)); });
    register_code("__VERIFIER_nondet_int", [this]() { this->read(sizeof(std::int32_t)); });
    register_code("__VERIFIER_nondet_long", [this]() { this->read(program().num_cpu_bits() == 32U ? sizeof(std::int32_t) : sizeof(std::int64_t)); });
    register_code("__VERIFIER_nondet_longlong", [this]() { this->read(sizeof(std::int64_t)); });
    register_code("__VERIFIER_nondet_uchar", [this]() { this->read(sizeof(std::uint8_t)); });
    register_code("__VERIFIER_nondet_ushort", [this]() { this->read(sizeof(std::uint16_t)); });
    register_code("__VERIFIER_nondet_uint", [this]() { this->read(sizeof(std::uint32_t)); });
    register_code("__VERIFIER_nondet_ulong", [this]() { this->read(program().num_cpu_bits() == 32U ? sizeof(std::uint32_t) : sizeof(std::uint64_t)); });
    register_code("__VERIFIER_nondet_ulonglong", [this]() { this->read(sizeof(std::uint64_t)); });
    register_code("__VERIFIER_nondet_float", [this]() { this->read(sizeof(float)); });
    register_code("__VERIFIER_nondet_double", [this]() { this->read(sizeof(double)); });
}


void extern_code::read(std::size_t const count)
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
            state().current_location_message() + ": Call to 'io_manager().get_simple().on_bytes_requested()' has failed."
            );
    }
}


struct input_flow_analysis::input_flow : public sala::InputFlow
{
    input_flow(computation_io_data*  data, sala::ExecState*  state);
    computation_io_data&  data() { return *data_; }

private:
    void start_input_flow(std::size_t const count);
    void do_ret() override;

    computation_io_data*  data_;
    sala::InputFlow::InputDescriptor  fresh_descriptor_;
    bool  some_input_was_read_;
};


input_flow_analysis::input_flow::input_flow(
        computation_io_data* const  data,
        sala::ExecState* const  state
        )
    : sala::InputFlow{ state }
    , data_{ data }
    , fresh_descriptor_{ 0U }
    , some_input_was_read_{ false }
{
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


void input_flow_analysis::input_flow::start_input_flow(std::size_t const count)
{
    sala::MemPtr ptr{ parameters().front().read<sala::MemPtr>() };
    for (std::size_t i = 0ULL; i != count; ++i, ++fresh_descriptor_)
        start(ptr + i, fresh_descriptor_);
    some_input_was_read_ = true;
}


void input_flow_analysis::input_flow::do_ret()
{
    if (some_input_was_read_ && state().current_function().name() == "__fizzer_process_condition")
    {
        INVARIANT(data().sensitive_bits.size() < data().trace_size);

        trace_index_type const  path_index{ (trace_index_type)data().sensitive_bits.size() };
        trace_item const&  branching{ data().trace_ptr->at(path_index) };

        if (branching.id != parameters().front().read<location_id>())
        {
            auto const expected{ branching.id };
            auto const obtained{ parameters().front().read<location_id>() };
            state().set_stage(sala::ExecState::Stage::FINISHED);
            state().set_termination(
                sala::ExecState::Termination::ERROR,
                "input_flow_analysis[extern_code]",
                "Execution diverged from the expected path in the tree."
                    " At path index " + std::to_string(path_index) + "/" + std::to_string(data().trace_size - 1U) + ": Unexpected location ID."
                    " [Expected: " + std::to_string(expected) +
                    ", obtained: " + std::to_string(obtained) + "]"
                );
            return;
        }

        if (path_index + 1U < data().trace_size && branching.direction != parameters().at(1).read<bool>())
        {
            bool const expected{ branching.direction };
            std::stringstream obtained; obtained << (integer_32_bit)parameters().at(1).read<natural_8_bit>();
            auto const loc{ branching.id };
            state().set_stage(sala::ExecState::Stage::FINISHED);
            state().set_termination(
                sala::ExecState::Termination::ERROR,
                "input_flow_analysis[extern_code]",
                "Execution diverged from the expected path in the tree."
                    " At path index " + std::to_string(path_index) + "/" + std::to_string(data().trace_size - 1U) + ": Unexpected direction taken."
                    " [Expected: " + std::to_string(expected) +
                    ", obtained: " + obtained.str() + "]"
                    "[NOTE: location ID: " + std::to_string(loc) + "]"
                );
            return;
        }

        data().sensitive_bits.push_back({});
        std::unordered_set<natural_32_bit>&  sensitive_bits{ data().sensitive_bits.back() };
        sala::MemPtr ptr{ parameters().at(2).start() };
        for (std::size_t i = 0ULL; i != sizeof(branching_value); ++i)
            for (auto const& desc : read(ptr + i)->descriptors())
                for (std::size_t j = 0ULL; j != 8ULL; ++j)
                    sensitive_bits.insert(8ULL * desc + j);

        if (path_index + 1U == data().trace_size)
        {
            state().set_stage(sala::ExecState::Stage::FINISHED);
            state().set_termination(
                sala::ExecState::Termination::NORMAL,
                "input_flow_analysis[extern_code]",
                "Execution reached the last node of the expected path in the tree."
                );

            return;
        }
    }
    sala::InputFlow::do_ret();
}


input_flow_analysis::input_flow_analysis(sala::Program const* const sala_program_ptr, target_executor const* const  tgt_exec)
    : program_ptr{ sala_program_ptr }
    , m_max_trace_length{ tgt_exec->max_trace_length() }
    , m_max_exec_megabytes{ tgt_exec->max_exec_megabytes() }
    , m_io_cmdline{ tgt_exec->io_cmdline().clone() }
    , m_io_simple{ tgt_exec->io_simple().clone() }
    , data_ptr{ nullptr }
    , statistics{}
{}


void  input_flow_analysis::run(computation_io_data* const  data_ptr_, std::function<bool(std::string&)> const&  terminator)
{
    ASSUMPTION(
        data_ptr_->input_ptr != nullptr &&
        data_ptr_->trace_ptr != nullptr &&
        data_ptr_->trace_size > 0U && data_ptr_->trace_size <= (trace_index_type)data_ptr_->trace_ptr->size()
        );

    data_ptr = data_ptr_;
    data().sensitive_bits.clear();

    if (program_ptr == nullptr)
        return;

    iomodels::load_models(*data_ptr->input_ptr->bytes(), *data_ptr->input_ptr->types(), *data_ptr->input_ptr->meta(), {
        m_io_cmdline.get(),
        m_io_simple.get()
        });

    std::chrono::system_clock::time_point const  start_time = std::chrono::system_clock::now();

    sala::ExecState  state{ program_ptr, m_max_exec_megabytes * 1024ULL * 1024ULL };
    sala::Sanitizer  sanitizer{ &state };
    input_flow  flow{ data_ptr, &state };
    extern_code  externals{ &state, &sanitizer, m_io_simple.get() };
    sala::Interpreter  interpreter{ &state, &externals, { &sanitizer, &flow } };

    interpreter.run(terminator);

    INVARIANT(data().sensitive_bits.size() <= data().trace_size);

    if (!data().sensitive_bits.empty())
    {
        std::size_t const  last_index{ data().sensitive_bits.size() - 1ULL };
        trace_item const&  last_branching{ data().trace_ptr->at(last_index) };
        std::pair<natural_32_bit,trace_index_type> const key{ last_index, last_branching.num_input_bytes };
        float_64_bit const  value = std::chrono::duration<float_64_bit>(std::chrono::system_clock::now() - start_time).count();
        //statistics.complexity[key].insert(value);
    }

    auto const& make_problem_message = [this](std::string const&  content) {
        std::stringstream  sstr;
        sstr << "{ "
            << "\"loc_id\": \"" << data().trace_ptr->at(data().trace_size - 1U).id << "\""
            << ", "
            << "\"details\": " << content
            << " }"
            ;
        return sstr.str();
    };

    if (data().sensitive_bits.size() < data().trace_size)
    {
        std::size_t const  divergence_index{ data().sensitive_bits.empty() ? 0ULL : data().sensitive_bits.size() - 1ULL };
        statistics.errors.insert(make_problem_message(state.report(
            (state.error_message().empty() ? state.current_location_message() : " ") +
            "At path index " + std::to_string(divergence_index) + "/" + std::to_string(data().trace_size - 1UL) +
            ": Unexpected divergence from the path."
            )));
        ++statistics.num_failures;
    }
    else
        ++statistics.num_successes;

    for (std::string const&  warning : state.warnings())
        statistics.warnings.insert(make_problem_message("\"" + warning + "\""));
}


}
