#include <fuzzing/bitflip_analysis.hpp>
#include <fuzzing/progress_recorder.hpp>
#include <utility/assumptions.hpp>
#include <utility/invariants.hpp>
#include <utility/timeprof.hpp>
#include <vector>

namespace  fuzzing {


template<typename T, int N>
static void  write_bits(vecb&  bits_ref, T const  (&values)[N], random_generator_for_natural_32_bit&  rnd_generator)
{
    natural_8_bit const* const  value_ptr = (natural_8_bit const*)&values[
            get_random_natural_32_bit_in_range(0U, N - 1U, rnd_generator)
            ];
    bytes_to_bits(value_ptr, value_ptr + sizeof(T), bits_ref);
}


static void  generate_typed_value(vecb&  bits_ref, data_type const  type, random_generator_for_natural_32_bit&  rnd_generator)
{
    switch (type)
    {
    case data_type::BOOLEAN:
        break;

    case data_type::SINT8:
        {
            static integer_8_bit const  values[] = {
                    std::numeric_limits<integer_8_bit>::min(),
                    std::numeric_limits<integer_8_bit>::max(),
                    };
            write_bits(bits_ref, values, rnd_generator);
        }
        break;
    case data_type::UINT8:
    case data_type::UNTYPED8:
        {
            static natural_8_bit const  values[] = {
                    std::numeric_limits<natural_8_bit>::max(),
                    };
            write_bits(bits_ref, values, rnd_generator);
        }
        break;

    case data_type::SINT16:
        {
            static integer_16_bit const  values[] = {
                    std::numeric_limits<integer_16_bit>::min(),
                    std::numeric_limits<integer_16_bit>::max(),
                    };
            write_bits(bits_ref, values, rnd_generator);
        }
        break;
    case data_type::UINT16:
    case data_type::UNTYPED16:
        {
            static natural_16_bit const  values[] = {
                    std::numeric_limits<natural_16_bit>::max(),
                    };
            write_bits(bits_ref, values, rnd_generator);
        }
        break;

    case data_type::SINT32:
        {
            static integer_32_bit const  values[] = {
                    std::numeric_limits<integer_32_bit>::min(),
                    std::numeric_limits<integer_32_bit>::max(),
                    };
            write_bits(bits_ref, values, rnd_generator);
        }
        break;
    case data_type::UINT32:
    case data_type::UNTYPED32:
        {
            static natural_32_bit const  values[] = {
                    std::numeric_limits<natural_32_bit>::max(),
                    };
            write_bits(bits_ref, values, rnd_generator);
        }
        break;

    case data_type::SINT64:
        {
            static integer_64_bit const  values[] = {
                    std::numeric_limits<integer_64_bit>::min(),
                    std::numeric_limits<integer_64_bit>::max(),
                    };
            write_bits(bits_ref, values, rnd_generator);
        }
        break;
    case data_type::UINT64:
    case data_type::UNTYPED64:
        {
            static natural_64_bit const  values[] = {
                    std::numeric_limits<natural_64_bit>::max(),
                    };
            write_bits(bits_ref, values, rnd_generator);
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
            write_bits(bits_ref, values, rnd_generator);
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
            write_bits(bits_ref, values, rnd_generator);
        }
        break;

    default:
        UNREACHABLE();
        break;
    }
}


bitflip_analysis::bitflip_analysis()
    : state{ READY }
    , node_ptr{ nullptr }
    , input_ptr{ nullptr }
    , bit_flips{}
    , value_changes{}
    , rnd_generator{}
    , statistics{}
{}


void  bitflip_analysis::start(
        std::unordered_set<branching_node*> const&  leaf_branchings,
        std::unordered_set<location_and_direction> const& uncovered_branchings
        )
{
    ASSUMPTION(is_ready());

    node_ptr = nullptr;
    input_ptr = nullptr;

    select_node(leaf_branchings, uncovered_branchings);
    if (node_ptr == nullptr)
        return;

    input_ptr = node_ptr->get_best_stdin();


    bool const  sensitive{
            !node_ptr->get_sensitive_stdin_bits().empty() &&
            get_random_natural_32_bit_in_range(1U, 100U, rnd_generator) <= 75U
            };

    if (sensitive)
        generate_bit_flips_sensitive();
    else
        generate_bit_flips();

    if (sensitive)
        generate_value_changes_sensitive();
    else
        generate_value_changes();

    state = BUSY;

    ++statistics.start_calls;
    statistics.max_bits = std::max(statistics.max_bits, (std::size_t)node_ptr->get_num_stdin_bits());

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

    INVARIANT(node_ptr != nullptr);

    if (!bit_flips.empty())
    {
        bits_ref = input_ptr->bits();
        for (auto const& i : bit_flips.back())
            bits_ref.at(i) = !bits_ref.at(i);
        bit_flips.pop_back();
    }
    else if (!value_changes.empty())
    {
        bits_ref = input_ptr->bits();
        std::copy(
                value_changes.back().bits.begin(),
                value_changes.back().bits.end(),
                std::next(bits_ref.begin(), value_changes.back().start_bit_index)
                );
        value_changes.pop_back();
    }
    else
    {
        stop();
        return false;
    }

    types_ref = input_ptr->types();
    metadata_ref = input_ptr->meta();

    ++statistics.generated_inputs;

    return true;
}


void  bitflip_analysis::select_node(
        std::unordered_set<branching_node*> const&  leaf_branchings,
        std::unordered_set<location_and_direction> const& uncovered_branchings
        )
{
    std::vector<branching_node*>  uncovered;
    std::vector<branching_node*>  others;
    for (branching_node* n : leaf_branchings)
    {
        if (n->get_best_stdin() == nullptr)
            continue;
        if (n->get_best_stdin()->bytes()->empty())
            continue;
        if (n->get_num_stdin_bytes() == 0U)
            continue;

        if (uncovered_branchings.contains({ n->get_location_id(), true })
                || uncovered_branchings.contains({ n->get_location_id(), false }))
            uncovered.push_back(n);
        else
            others.push_back(n);
    }

    std::vector<branching_node*> const* vec_ptr{ nullptr };
    if (uncovered.empty())
        vec_ptr = &others;
    else if (others.empty())
        vec_ptr = &uncovered;
    else
    {
        if (get_random_natural_32_bit_in_range(1U, 100U, rnd_generator) <= 75U)
            vec_ptr = &uncovered;
        else
            vec_ptr = &others;
    }
    if (vec_ptr->empty())
        return;

    node_ptr = vec_ptr->at(get_random_natural_32_bit_in_range(0U, vec_ptr->size() - 1U, rnd_generator));
}


void  bitflip_analysis::generate_bit_flips()
{
    bit_flips.clear();

    natural_32_bit num_flips{ 1 };
    while (bit_flips.size() < 128UL)
    {
        bit_flips.push_back({});
        while ((natural_32_bit)bit_flips.back().size() != num_flips)
            bit_flips.back().insert(get_random_natural_32_bit_in_range(0U, node_ptr->get_num_stdin_bits() - 1U, rnd_generator));
        ++num_flips;
        if (num_flips > node_ptr->get_num_stdin_bits() / 2U)
            num_flips = 1U;
    }
}


void  bitflip_analysis::generate_bit_flips_sensitive()
{
    bit_flips.clear();

    std::vector<natural_32_bit> const  sensitive_bits {
            node_ptr->get_sensitive_stdin_bits().begin(),
            node_ptr->get_sensitive_stdin_bits().end()
            };

    natural_32_bit num_flips{ 1 };
    while (bit_flips.size() < 128UL)
    {
        bit_flips.push_back({});
        while ((natural_32_bit)bit_flips.back().size() != num_flips)
            bit_flips.back().insert(sensitive_bits.at(get_random_natural_32_bit_in_range(0U, sensitive_bits.size() - 1U, rnd_generator)));
        ++num_flips;
        if (num_flips > node_ptr->get_num_stdin_bits() / 2U)
            num_flips = 1U;
    }
}


void  bitflip_analysis::generate_value_changes()
{
    value_changes.clear();

    natural_32_bit const  max_type_idx{ input_ptr->type_index(node_ptr->get_num_stdin_bits() - 1U) };
    natural_32_bit const  max_selected{ std::max(std::min((max_type_idx + 1U) / 2U, 8U), 1U) };

    std::unordered_set<natural_32_bit>  selected_type_indices;
    while (selected_type_indices.size() < (std::size_t)max_selected)
        selected_type_indices.insert(get_random_natural_32_bit_in_range(0U, max_type_idx, rnd_generator));

    for (natural_32_bit i : selected_type_indices)
    {
        value_changes.push_back({ input_ptr->type_start_bit_index(i), {} });
        generate_typed_value(value_changes.back().bits, input_ptr->types()->at(i), rnd_generator);
        INVARIANT(input_ptr->bits().size() >= (std::size_t)value_changes.back().start_bit_index + value_changes.back().bits.size());
    }
}


void  bitflip_analysis::generate_value_changes_sensitive()
{
    value_changes.clear();

    std::vector<natural_32_bit>  type_indices;
    {
        std::unordered_set<natural_32_bit> type_indices_set;
        for (natural_32_bit  bit_idx : node_ptr->get_sensitive_stdin_bits())
            type_indices_set.insert(input_ptr->type_index(bit_idx));
        for (natural_32_bit  type_idx : type_indices_set)
            type_indices.push_back(type_idx);
    }
    if (type_indices.empty())
        return;

    natural_32_bit const  max_type_idx{ (natural_32_bit)type_indices.size() - 1U };
    natural_32_bit const  max_selected{ std::max(std::min((max_type_idx + 1U) / 2U, 8U), 1U) };

    std::unordered_set<natural_32_bit>  selected_type_indices;
    while (selected_type_indices.size() < (std::size_t)max_selected)
        selected_type_indices.insert(type_indices.at(get_random_natural_32_bit_in_range(0U, max_type_idx, rnd_generator)));

    for (natural_32_bit i : selected_type_indices)
    {
        value_changes.push_back({ input_ptr->type_start_bit_index(i), {} });
        generate_typed_value(value_changes.back().bits, input_ptr->types()->at(i), rnd_generator);
        INVARIANT(input_ptr->bits().size() >= (std::size_t)value_changes.back().start_bit_index + value_changes.back().bits.size());
    }
}


}
