#include <fuzzing/bitflip_analysis.hpp>
#include <fuzzing/progress_recorder.hpp>
#include <utility/assumptions.hpp>
#include <utility/invariants.hpp>
#include <utility/timeprof.hpp>

namespace  fuzzing {


bitflip_analysis::bitflip_analysis()
    : state{ READY }
    , node_ptr{ nullptr }
    , bits_and_types{ nullptr }
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
    return mutated_bit_index < bits_and_types->bits.size();
}


bool  bitflip_analysis::is_mutated_type_index_valid() const
{
    return mutated_type_index < bits_and_types->types.size() &&
                bits_and_types->type_end_bit_index(mutated_type_index) < bits_and_types->bits.size();
}


void  bitflip_analysis::start(std::unordered_set<branching_node*> const&  leaf_branchings)
{
    ASSUMPTION(is_ready());
    ASSUMPTION(!leaf_branchings.empty());

    node_ptr = nullptr;
    bits_and_types = nullptr;
    auto const  it_end = std::next(leaf_branchings.begin(), get_random_natural_32_bit_in_range(0UL, leaf_branchings.size() - 1UL, rnd_generator));
    auto  it = it_end;
    do
    {
        for (auto*  node{ *it }; node != nullptr; node = node->get_predecessor())
            if (node->get_best_stdin() != nullptr && !node->get_best_stdin()->bits.empty()
                    && !processed_inputs.contains(node->get_best_stdin().get()))
            {
                bits_and_types = node->get_best_stdin();
                node_ptr = node;
                break;
            }

        ++it;
        if (it == leaf_branchings.end())
            it = leaf_branchings.begin();
    }
    while (bits_and_types == nullptr && it != it_end);
    
    if (bits_and_types == nullptr)
        return;

    state = BUSY;

    processed_inputs.insert(bits_and_types.get());

    mutated_bit_index = 0;
    mutated_type_index = 0;
    mutated_value_index = 0;

    ++statistics.start_calls;
    statistics.max_bits = std::max(statistics.max_bits, bits_and_types->bits.size());

    recorder().on_bitflip_start(node_ptr, progress_recorder::START::REGULAR);
}


void  bitflip_analysis::stop()
{
    if (!is_busy())
        return;

    state = READY;

    recorder().on_bitflip_stop(progress_recorder::STOP::REGULAR);
}


bool  bitflip_analysis::generate_next_input(vecb&  bits_ref)
{
    TMPROF_BLOCK();

    if (!is_busy())
        return false;

    if (is_mutated_bit_index_valid())
    {
        bits_ref = bits_and_types->bits;
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

    probed_bit_start_index = bits_and_types->type_start_bit_index(mutated_type_index);
    probed_bit_end_index = probed_bit_start_index + 8 * sizeof(T);

    vecb  bits;
    natural_8_bit const* const  value_ptr = (natural_8_bit const*)&values[mutated_value_index];
    bytes_to_bits(value_ptr, value_ptr + sizeof(T), bits);

    bits_ref = bits_and_types->bits;
    std::copy(bits.begin(), bits.end(), std::next(bits_ref.begin(), probed_bit_start_index));

    ++mutated_value_index;
    return true;
}


bool  bitflip_analysis::generate_next_typed_value(vecb&  bits_ref)
{
    for ( ; is_mutated_type_index_valid(); ++mutated_type_index)
        switch (bits_and_types->types.at(mutated_type_index))
        {
        case type_of_input_bits::BOOLEAN:
            break;

        case type_of_input_bits::SINT8:
            {
                static integer_8_bit const  values[] = {
                        std::numeric_limits<integer_8_bit>::min(),
                        std::numeric_limits<integer_8_bit>::max(),
                        };
                if (write_bits(bits_ref, values))
                    return true;
            }
            break;
        case type_of_input_bits::UINT8:
        case type_of_input_bits::UNTYPED8:
            {
                static natural_8_bit const  values[] = {
                        std::numeric_limits<natural_8_bit>::max(),
                        };
                if (write_bits(bits_ref, values))
                    return true;
            }
            break;

        case type_of_input_bits::SINT16:
            {
                static integer_16_bit const  values[] = {
                        std::numeric_limits<integer_16_bit>::min(),
                        std::numeric_limits<integer_16_bit>::max(),
                        };
                if (write_bits(bits_ref, values))
                    return true;
            }
            break;
        case type_of_input_bits::UINT16:
        case type_of_input_bits::UNTYPED16:
            {
                static natural_16_bit const  values[] = {
                        std::numeric_limits<natural_16_bit>::max(),
                        };
                if (write_bits(bits_ref, values))
                    return true;
            }
            break;

        case type_of_input_bits::SINT32:
            {
                static integer_32_bit const  values[] = {
                        std::numeric_limits<integer_32_bit>::min(),
                        std::numeric_limits<integer_32_bit>::max(),
                        };
                if (write_bits(bits_ref, values))
                    return true;
            }
            break;
        case type_of_input_bits::UINT32:
        case type_of_input_bits::UNTYPED32:
            {
                static natural_32_bit const  values[] = {
                        std::numeric_limits<natural_32_bit>::max(),
                        };
                if (write_bits(bits_ref, values))
                    return true;
            }
            break;

        case type_of_input_bits::SINT64:
            {
                static integer_64_bit const  values[] = {
                        std::numeric_limits<integer_64_bit>::min(),
                        std::numeric_limits<integer_64_bit>::max(),
                        };
                if (write_bits(bits_ref, values))
                    return true;
            }
            break;
        case type_of_input_bits::UINT64:
        case type_of_input_bits::UNTYPED64:
            {
                static natural_64_bit const  values[] = {
                        std::numeric_limits<natural_64_bit>::max(),
                        };
                if (write_bits(bits_ref, values))
                    return true;
            }
            break;

        case type_of_input_bits::FLOAT32:
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
        case type_of_input_bits::FLOAT64:
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
