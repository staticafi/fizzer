#include <fuzzing/bitflip_analysis.hpp>
#include <fuzzing/progress_recorder.hpp>
#include <utility/assumptions.hpp>
#include <utility/invariants.hpp>
#include <utility/timeprof.hpp>

namespace  fuzzing {


bitflip_analysis::bitflip_analysis()
    : state{ READY }
    , node_ptr{ nullptr }
    , current_input{ nullptr }
    , mutated_bit_index{ 0U }
    , mutated_type_index{ 0U }
    , mutated_value_index{ 0U }
    , probed_bit_start_index{ 0U }
    , probed_bit_end_index{ 0U }
    , processed_inputs{ nullptr }
    , rnd_generator{}
    , statistics{}
{}


bool  bitflip_analysis::is_mutated_bit_index_valid() const
{
    return mutated_bit_index < current_input->bits().size();
}


bool  bitflip_analysis::is_mutated_type_index_valid() const
{
    return mutated_type_index < current_input->types()->size() &&
                current_input->type_end_bit_index(mutated_type_index) < current_input->bits().size();
}


void  bitflip_analysis::start(std::unordered_set<branching_node*> const&  leaf_branchings)
{
    ASSUMPTION(is_ready());
    ASSUMPTION(!leaf_branchings.empty());

    branching_node*  winner{ nullptr };
    auto const  it_end = std::next(leaf_branchings.begin(), get_random_natural_32_bit_in_range(0UL, leaf_branchings.size() - 1UL, rnd_generator));
    auto  it = it_end;
    do
    {
        for (auto*  node{ *it }; node != nullptr; node = node->get_predecessor())
            if (node->get_best_stdin() != nullptr && !node->get_best_stdin()->bits().empty()
                    && !processed_inputs.contains(node->get_best_stdin().get()))
            {
                winner = node;
                break;
            }

        ++it;
        if (it == leaf_branchings.end())
            it = leaf_branchings.begin();
    }
    while (winner == nullptr && it != it_end);

    if (winner == nullptr)
        return;

    start(winner);
}


void  bitflip_analysis::start(branching_node* const  node)
{
    ASSUMPTION(node != nullptr);

    node_ptr = node;
    current_input = node->get_best_stdin();

    state = BUSY;

    processed_inputs.insert(current_input.get());

    mutated_bit_index = 0;
    mutated_type_index = 0;
    mutated_value_index = 0;

    ++statistics.start_calls;
    statistics.max_bits = std::max(statistics.max_bits, current_input->bits().size());

    recorder().on_bitflip_start(node_ptr, progress_recorder::START::REGULAR);
}


void  bitflip_analysis::stop()
{
    if (!is_busy())
        return;

    state = READY;

    recorder().on_bitflip_stop(progress_recorder::STOP::REGULAR);
}


bool  bitflip_analysis::generate_next_input(vecb&  bits_ref, input_types_ptr&  types_ref, input_metadata_ptr&  metadata_ref)
{
    TMPROF_BLOCK();

    if (!is_busy())
        return false;

    if (is_mutated_bit_index_valid())
    {
        bits_ref = current_input->bits();
        bits_ref.at(mutated_bit_index) = !bits_ref.at(mutated_bit_index);

        probed_bit_start_index = 8 * (mutated_bit_index / 8);
        probed_bit_end_index = probed_bit_start_index + 8;

        ++mutated_bit_index;
    }
    else if (!generate_next_typed_value(bits_ref))
    {
        stop();
        return false;
    }

    types_ref = current_input->types();
    metadata_ref = current_input->meta();

    ++statistics.generated_inputs;

    return true;
}


template<typename T, int N>
bool  bitflip_analysis::write_bits(vecb&  bits_ref, T const  (&values)[N])
{
    if (mutated_value_index >= N)
    {
        mutated_value_index = 0U;
        return false;
    }

    probed_bit_start_index = current_input->type_start_bit_index(mutated_type_index);
    probed_bit_end_index = probed_bit_start_index + 8 * sizeof(T);

    vecb  bits;
    natural_8_bit const* const  value_ptr = (natural_8_bit const*)&values[mutated_value_index];
    bytes_to_bits(value_ptr, value_ptr + sizeof(T), bits);

    bits_ref = current_input->bits();
    std::copy(bits.begin(), bits.end(), std::next(bits_ref.begin(), probed_bit_start_index));

    ++mutated_value_index;
    return true;
}


bool  bitflip_analysis::generate_next_typed_value(vecb&  bits_ref)
{
    for ( ; is_mutated_type_index_valid(); ++mutated_type_index)
        switch (current_input->types()->at(mutated_type_index))
        {
        case data_type::BOOLEAN:
            break;

        case data_type::SINT8:
            {
                static integer_8_bit const  values[] = {
                        std::numeric_limits<integer_8_bit>::min(),
                        std::numeric_limits<integer_8_bit>::max(),
                        };
                if (write_bits(bits_ref, values))
                    return true;
            }
            break;
        case data_type::UINT8:
        case data_type::UNTYPED8:
            {
                static natural_8_bit const  values[] = {
                        std::numeric_limits<natural_8_bit>::max(),
                        };
                if (write_bits(bits_ref, values))
                    return true;
            }
            break;

        case data_type::SINT16:
            {
                static integer_16_bit const  values[] = {
                        std::numeric_limits<integer_16_bit>::min(),
                        std::numeric_limits<integer_16_bit>::max(),
                        };
                if (write_bits(bits_ref, values))
                    return true;
            }
            break;
        case data_type::UINT16:
        case data_type::UNTYPED16:
            {
                static natural_16_bit const  values[] = {
                        std::numeric_limits<natural_16_bit>::max(),
                        };
                if (write_bits(bits_ref, values))
                    return true;
            }
            break;

        case data_type::SINT32:
            {
                static integer_32_bit const  values[] = {
                        std::numeric_limits<integer_32_bit>::min(),
                        std::numeric_limits<integer_32_bit>::max(),
                        };
                if (write_bits(bits_ref, values))
                    return true;
            }
            break;
        case data_type::UINT32:
        case data_type::UNTYPED32:
            {
                static natural_32_bit const  values[] = {
                        std::numeric_limits<natural_32_bit>::max(),
                        };
                if (write_bits(bits_ref, values))
                    return true;
            }
            break;

        case data_type::SINT64:
            {
                static integer_64_bit const  values[] = {
                        std::numeric_limits<integer_64_bit>::min(),
                        std::numeric_limits<integer_64_bit>::max(),
                        };
                if (write_bits(bits_ref, values))
                    return true;
            }
            break;
        case data_type::UINT64:
        case data_type::UNTYPED64:
            {
                static natural_64_bit const  values[] = {
                        std::numeric_limits<natural_64_bit>::max(),
                        };
                if (write_bits(bits_ref, values))
                    return true;
            }
            break;

        case data_type::FLOAT32:
            {
                static float_32_bit const  values[] = {
                        -std::numeric_limits<float_32_bit>::infinity(),
                        std::numeric_limits<float_32_bit>::lowest(),
                        -std::numeric_limits<float_32_bit>::min(),
                        -std::numeric_limits<float_32_bit>::epsilon(),
                        std::numeric_limits<float_32_bit>::epsilon(),
                        std::numeric_limits<float_32_bit>::min(),
                        std::numeric_limits<float_32_bit>::max(),
                        std::numeric_limits<float_32_bit>::infinity(),
                        std::numeric_limits<float_32_bit>::quiet_NaN(),
                        std::numeric_limits<float_32_bit>::signaling_NaN(),
                        };
                if (write_bits(bits_ref, values))
                    return true;
            }
            break;
        case data_type::FLOAT64:
            {
                static float_64_bit const  values[] = {
                        -std::numeric_limits<float_64_bit>::infinity(),
                        std::numeric_limits<float_64_bit>::lowest(),
                        -std::numeric_limits<float_64_bit>::min(),
                        -std::numeric_limits<float_64_bit>::epsilon(),
                        std::numeric_limits<float_64_bit>::epsilon(),
                        std::numeric_limits<float_64_bit>::min(),
                        std::numeric_limits<float_64_bit>::max(),
                        std::numeric_limits<float_64_bit>::infinity(),
                        std::numeric_limits<float_64_bit>::quiet_NaN(),
                        std::numeric_limits<float_64_bit>::signaling_NaN(),
                        };
                if (write_bits(bits_ref, values))
                    return true;
            }
            break;

        default:
            UNREACHABLE();
            break;
        }
    return false;
}


}
