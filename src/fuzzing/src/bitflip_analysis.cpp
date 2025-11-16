#include <fuzzing/bitflip_analysis.hpp>
#include <fuzzing/progress_recorder.hpp>
#include <utility/assumptions.hpp>
#include <utility/invariants.hpp>
#include <utility/timeprof.hpp>

namespace  fuzzing {


bitflip_analysis::bitflip_analysis()
    : state{ READY }
    , tasks{}
    , current{ tasks.end() }
    , seen_nodes{}
    , statistics{}
{}


void  bitflip_analysis::start()
{
    ASSUMPTION(is_ready());

    state = BUSY;

    ++statistics.start_calls;

    recorder().on_bitflip_start(progress_recorder::START::REGULAR);
}


void  bitflip_analysis::stop()
{
    if (!is_busy())
        return;

    state = READY;

    recorder().on_bitflip_stop(progress_recorder::STOP::REGULAR);
}


void  bitflip_analysis::on_any_execution_results(branching_node* const  leaf)
{
    //if (seen_nodes.insert(leaf).second)
        tasks.insert({ leaf, task{ leaf->get_best_stdin() } });
}


bool  bitflip_analysis::generate_next_input(vecb&  bits_ref, input_types_ptr&  types_ref, input_metadata_ptr&  metadata_ref)
{
    TMPROF_BLOCK();

    if (!is_busy())
        return false;

    while (true)
    {
        if (current == tasks.end())
        {
            if (tasks.empty())
            {
                stop();
                return false;
            }
            current = tasks.begin();
        }

        if (current->second.generator.generate_next_input(bits_ref, types_ref, metadata_ref))
        {
            ++statistics.generated_inputs;
            return true;
        }

        current = tasks.erase(current);
    }
}


void  bitflip_analysis::process_execution_results(natural_32_bit const  num_discovered, natural_32_bit const  num_covered)
{
    ASSUMPTION(is_busy() && current != tasks.end());

    current->second.turn_buffer += 32U * num_discovered + 64U * num_covered;
    if (current->second.turn_buffer == 0U)
        ++current;
    else
        --current->second.turn_buffer;
}


bitflip_analysis::task::task(typed_input_ptr  input_)
    : generator{ input_ }
    , turn_buffer{ 0U }
{}


bitflip_analysis::input_generator::input_generator(typed_input_ptr  input_)
    : input{ input_ }
    , mutated_bit_index{ 0U }
    , mutated_type_index{ 0U }
    , mutated_value_index{ 0U }
    , probed_bit_start_index{ 0U }
    , probed_bit_end_index{ 0U }
{}


bool  bitflip_analysis::input_generator::generate_next_input(vecb&  bits_ref, input_types_ptr&  types_ref, input_metadata_ptr&  metadata_ref)
{
    TMPROF_BLOCK();

    if (is_mutated_bit_index_valid())
    {
        bits_ref = input->bits();
        bits_ref.at(mutated_bit_index) = !bits_ref.at(mutated_bit_index);

        probed_bit_start_index = 8 * (mutated_bit_index / 8);
        probed_bit_end_index = probed_bit_start_index + 8;

        ++mutated_bit_index;
    }
    else if (!generate_next_typed_value(bits_ref))
        return false;

    types_ref = input->types();
    metadata_ref = input->meta();

    return true;
}


bool  bitflip_analysis::input_generator::is_mutated_bit_index_valid() const
{
    return mutated_bit_index < input->bits().size();
}


bool  bitflip_analysis::input_generator::is_mutated_type_index_valid() const
{
    return mutated_type_index < input->types()->size() && input->type_end_bit_index(mutated_type_index) < input->bits().size();
}


template<typename T, int N>
bool  bitflip_analysis::input_generator::write_bits(vecb&  bits_ref, T const  (&values)[N])
{
    if (mutated_value_index >= N)
    {
        mutated_value_index = 0U;
        return false;
    }

    probed_bit_start_index = input->type_start_bit_index(mutated_type_index);
    probed_bit_end_index = probed_bit_start_index + 8 * sizeof(T);

    vecb  bits;
    natural_8_bit const* const  value_ptr = (natural_8_bit const*)&values[mutated_value_index];
    bytes_to_bits(value_ptr, value_ptr + sizeof(T), bits);

    bits_ref = input->bits();
    std::copy(bits.begin(), bits.end(), std::next(bits_ref.begin(), probed_bit_start_index));

    ++mutated_value_index;
    return true;
}


bool  bitflip_analysis::input_generator::generate_next_typed_value(vecb&  bits_ref)
{
    for ( ; is_mutated_type_index_valid(); ++mutated_type_index)
        switch (input->types()->at(mutated_type_index))
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
