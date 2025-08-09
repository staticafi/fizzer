#include <fuzzing/local_search_analysis.hpp>
#include <fuzzing/progress_recorder.hpp>
#include <cps/solver.hpp>
#include <utility/assumptions.hpp>
#include <utility/invariants.hpp>
#include <utility/timeprof.hpp>
#include <map>
#include <set>
#include <algorithm>
#include <sstream>

namespace  fuzzing {


local_search_analysis::local_search_analysis()
    : state{ READY }
    , config{}
    , node{ nullptr }
    , current_input{ nullptr }
    , execution_id{ 0 }
    , type_indices{}
    , solver{ nullptr }
    , statistics{}
{}


void  local_search_analysis::start(branching_node* const  node_ptr, natural_32_bit const  execution_id_)
{
    TMPROF_BLOCK();

    ASSUMPTION(
        is_ready() &&
        node_ptr->has_unexplored_direction() &&
        !node_ptr->get_sensitive_stdin_bits().empty() &&
        node_ptr->get_best_stdin() != nullptr
        );

    state = BUSY;
    node = node_ptr;
    current_input = node->get_best_stdin();
    execution_id = execution_id_;
    type_indices.clear();
    solver = nullptr;

    std::vector<std::vector<std::size_t> > parameter_indices;
    std::vector<cps::Comparator> comparators;
    std::vector<cps::Variable> seed_input;
    std::vector<cps::Evaluation> seed_output;
    {
        std::set<natural_32_bit> set_of_type_indices;
        std::vector<std::set<natural_32_bit> > type_indices_per_trace_item;
        for (branching_node*  n = node; n != nullptr; n = n->get_predecessor())
        {
            type_indices_per_trace_item.push_back({});
            for (natural_32_bit  bit_idx : n->get_sensitive_stdin_bits())
            {
                natural_32_bit const  type_idx{ current_input->type_index(bit_idx) };
                set_of_type_indices.insert(type_idx);
                type_indices_per_trace_item.back().insert(type_idx);
            }
            switch (n->get_atomic_predicate())
            {
                case atomic_predicate::UNEQUAL: comparators.push_back(cps::Comparator::UNEQUAL); break;
                case atomic_predicate::LESS: comparators.push_back(cps::Comparator::LESS); break;
                case atomic_predicate::LESS_EQUAL: comparators.push_back(cps::Comparator::LESS_EQUAL); break;
                case atomic_predicate::GREATER: comparators.push_back(cps::Comparator::GREATER); break;
                case atomic_predicate::GREATER_EQUAL: comparators.push_back(cps::Comparator::GREATER_EQUAL); break;
                default: { UNREACHABLE(); } break;
            }
            trace_item const&  item{ node->get_best_trace()->at(n->get_trace_index()) };
            seed_output.push_back({ item.value, item.direction });
        }
        for (auto  rit = type_indices_per_trace_item.rbegin(); rit != type_indices_per_trace_item.rend(); ++rit)
            parameter_indices.push_back({ rit->begin(), rit->end() });
        std::reverse(comparators.begin(), comparators.end());
        for (natural_32_bit  type_idx : set_of_type_indices)
        {
            type_indices.push_back(type_idx);

            natural_8_bit const* const  value_ptr{ current_input->bytes()->data() + current_input->type_start_bit_index(type_idx) / 8U };
            switch (current_input->types()->at(type_idx))
            {
                case data_type::BOOLEAN:    seed_input.push_back(cps::Variable(*(natural_8_bit const*)value_ptr != 0U)); break;
                case data_type::UINT8:      seed_input.push_back(cps::Variable(*(natural_8_bit const*)value_ptr)); break;
                case data_type::SINT8:      seed_input.push_back(cps::Variable(*(integer_8_bit const*)value_ptr)); break;
                case data_type::UINT16:     seed_input.push_back(cps::Variable(*(natural_16_bit const*)value_ptr)); break;
                case data_type::SINT16:     seed_input.push_back(cps::Variable(*(integer_16_bit const*)value_ptr)); break;
                case data_type::UINT32:     seed_input.push_back(cps::Variable(*(natural_32_bit const*)value_ptr)); break;
                case data_type::SINT32:     seed_input.push_back(cps::Variable(*(integer_32_bit const*)value_ptr)); break;
                case data_type::UINT64:     seed_input.push_back(cps::Variable(*(natural_64_bit const*)value_ptr)); break;
                case data_type::SINT64:     seed_input.push_back(cps::Variable(*(integer_64_bit const*)value_ptr)); break;
                case data_type::FLOAT32:    seed_input.push_back(cps::Variable(*(float_32_bit const*)value_ptr)); break;
                case data_type::FLOAT64:    seed_input.push_back(cps::Variable(*(float_64_bit const*)value_ptr)); break;
                case data_type::UNTYPED8:   seed_input.push_back(cps::Variable(*(natural_8_bit const*)value_ptr)); break;
                case data_type::UNTYPED16:  seed_input.push_back(cps::Variable(*(natural_16_bit const*)value_ptr)); break;
                case data_type::UNTYPED32:  seed_input.push_back(cps::Variable(*(natural_32_bit const*)value_ptr)); break;
                case data_type::UNTYPED64:  seed_input.push_back(cps::Variable(*(natural_64_bit const*)value_ptr)); break;
                default: { UNREACHABLE(); } break;
            }
        }
        std::reverse(seed_output.begin(), seed_output.end());
    }

    solver = std::make_unique<cps::Solver>(parameter_indices, comparators, seed_input, seed_output, config);

    ++statistics.start_calls;

    recorder().on_local_search_start(node_ptr, progress_recorder::START::REGULAR);
}


void  local_search_analysis::stop()
{
    if (!is_busy())
        return;

    if (solver->success())
    {
        ++statistics.stop_calls_early;

        recorder().on_local_search_stop(progress_recorder::STOP::EARLY);
    }
    else
    {
        ++statistics.stop_calls_regular;

        recorder().on_local_search_stop(progress_recorder::STOP::REGULAR);
    }

    node->set_local_search_performed(execution_id);

    state = READY;
    solver = nullptr;
}


bool  local_search_analysis::generate_next_input(vecb&  bits_ref, input_types_ptr&  types_ref, input_metadata_ptr&  metadata_ref)
{
    TMPROF_BLOCK();

    if (!is_busy())
        return false;

    std::vector<cps::Variable> vars;
    solver->compute_next_input(vars);
    if (solver->is_finished())
    {
        stop();
        return false;
    }
    INVARIANT(vars.size() == type_indices.size());

    bits_ref = current_input->bits();
    for (std::size_t i{ 0ULL }; i != vars.size(); ++i)
        vars.at(i).visit([this, i, &bits_ref]<typename T>(T x) {
            std::size_t const start_bit_idx{ 8U * (current_input->type_start_bit_index(type_indices.at(i)) / 8U) };
            std::size_t constexpr num_bits{ 8U * sizeof(std::decay_t<T>) };
            for (std::size_t i = 0ULL; i != num_bits; ++i)
                bits_ref.at(start_bit_idx + i) = get_bit((natural_8_bit const*)&x, i);
        });
    types_ref = current_input->types();
    metadata_ref = current_input->meta();

    ++statistics.generated_inputs;

    return true;
}


void  local_search_analysis::process_execution_results(
        execution_trace_ptr const  trace_ptr,
        typed_input_ptr const  current_input_ptr
        )
{
    TMPROF_BLOCK();

    ASSUMPTION(is_busy());
    ASSUMPTION(trace_ptr != nullptr);

    std::vector<cps::Evaluation> output;
    for (std::size_t  i = 0UL, n = std::min({ (std::size_t)(node->get_trace_index() + 1ULL), trace_ptr->size() }); i != n; ++i)
    {
        if (trace_ptr->at(i).id != node->get_best_trace()->at(i).id)
            break;

        output.push_back({ trace_ptr->at(i).value, trace_ptr->at(i).direction });

        if (i < node->get_trace_index() && trace_ptr->at(i).direction != node->get_best_trace()->at(i).direction)
            break;
    }
    solver->process_output(output);
}


std::string  local_search_analysis::get_progress_message() const
{
    std::stringstream  sstr;
    for (auto const& name_and_value : solver->get_statistics())
        sstr << name_and_value.first << ": " << name_and_value.second << ", ";
    return sstr.str();
}


}
