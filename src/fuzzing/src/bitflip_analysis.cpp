#include <fuzzing/bitflip_analysis.hpp>
#include <fuzzing/progress_recorder.hpp>
#include <utility/std_pair_hash.hpp>
#include <utility/assumptions.hpp>
#include <utility/invariants.hpp>
#include <utility/timeprof.hpp>
#include <vector>
#include <algorithm>

namespace  fuzzing {


static natural_32_bit constexpr  MAX_BIT_MUTATIONS = 128U;
static natural_32_bit constexpr  MAX_TYPE_MUTATIONS = 8U;
static natural_32_bit constexpr  MAX_CROSSOVERS = 32U;


template<typename T, int N>
static void  write_bits_of_values(std::vector<vecb>& result, T const  (&values)[N])
{
    for (int i = 0; i < N; ++i)
    {
        result.push_back({});
        natural_8_bit const* const  value_ptr = (natural_8_bit const*)&values[i];
        bytes_to_bits(value_ptr, value_ptr + sizeof(T), result.back());
    }
}


static std::unordered_map<data_type, std::vector<vecb> > const  SPECIAL_VALUES = []() {
    std::unordered_map<data_type, std::vector<vecb> > result;

    {
        static integer_8_bit const  values[] = {
                std::numeric_limits<integer_8_bit>::min(),
                std::numeric_limits<integer_8_bit>::max(),
                };
        write_bits_of_values(result.insert({ data_type::SINT8, {} }).first->second, values);
    }

    {
        static natural_8_bit const  values[] = {
                std::numeric_limits<natural_8_bit>::max(),
                };
        write_bits_of_values(result.insert({ data_type::UINT8, {} }).first->second, values);
    }

    result.insert({ data_type::UNTYPED8, result.at(data_type::UINT8) });

    {
        static integer_16_bit const  values[] = {
                std::numeric_limits<integer_16_bit>::min(),
                std::numeric_limits<integer_16_bit>::max(),
                };
        write_bits_of_values(result.insert({ data_type::SINT16, {} }).first->second, values);
    }

    {
        static natural_16_bit const  values[] = {
                std::numeric_limits<natural_16_bit>::max(),
                };
        write_bits_of_values(result.insert({ data_type::UINT16, {} }).first->second, values);
    }

    result.insert({ data_type::UNTYPED16, result.at(data_type::UINT16) });

    {
        static integer_32_bit const  values[] = {
                std::numeric_limits<integer_32_bit>::min(),
                std::numeric_limits<integer_32_bit>::max(),
                };
        write_bits_of_values(result.insert({ data_type::SINT32, {} }).first->second, values);
    }

    {
        static natural_32_bit const  values[] = {
                std::numeric_limits<natural_32_bit>::max(),
                };
        write_bits_of_values(result.insert({ data_type::UINT32, {} }).first->second, values);
    }

    result.insert({ data_type::UNTYPED32, result.at(data_type::UINT32) });

    {
        static integer_64_bit const  values[] = {
                std::numeric_limits<integer_64_bit>::min(),
                std::numeric_limits<integer_64_bit>::max(),
                };
        write_bits_of_values(result.insert({ data_type::SINT64, {} }).first->second, values);
    }

    {
        static natural_64_bit const  values[] = {
                std::numeric_limits<natural_64_bit>::max(),
                };
        write_bits_of_values(result.insert({ data_type::UINT64, {} }).first->second, values);
    }

    result.insert({ data_type::UNTYPED64, result.at(data_type::UINT64) });

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
        write_bits_of_values(result.insert({ data_type::FLOAT32, {} }).first->second, values);
    }

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
        write_bits_of_values(result.insert({ data_type::FLOAT64, {} }).first->second, values);
    }

    return std::move(result);
}();


static void  compute_crossover(
        typed_input_ptr const  input_1,
        typed_input_ptr const  input_2,
        vecb&  bits_ref,
        input_types_ptr&  types_ref,
        input_metadata_ptr&  metadata_ref,
        random_generator_for_natural_32_bit&  rnd_generator
        )
{
    natural_32_bit const  num_split_points{
        std::min(
            (natural_32_bit)std::min(input_1->types()->size(), input_2->types()->size()),
            get_random_natural_32_bit_in_range(1U, 10U, rnd_generator)
            )
        };

    auto const& generate_split_points = [num_split_points, &rnd_generator](typed_input_ptr const  input) -> std::vector<natural_32_bit>
    {
        std::unordered_set<natural_32_bit>  split_points_set{ (natural_32_bit)input->types()->size() - 1U };
        {
            std::vector<natural_32_bit>  indices;
            for (natural_32_bit i = 0U; i < (natural_32_bit)input->types()->size() - 1U; ++i)
                indices.push_back(i);
            while ((natural_32_bit)split_points_set.size() < num_split_points)
            {
                natural_32_bit const index{ get_random_natural_32_bit_in_range(0U, (natural_32_bit)indices.size() - 1U, rnd_generator) };
                split_points_set.insert(indices.at(index));
                indices.at(index) = indices.back();
                indices.pop_back();
            }
        }
        std::vector<natural_32_bit>  split_points;
        for (float_32_bit sp : split_points_set)
            split_points.push_back(sp);
        std::sort(split_points.begin(), split_points.end());
        return std::move(split_points);
    };

    std::vector<natural_32_bit> const  split_points_1{ generate_split_points(input_1) };
    std::vector<natural_32_bit> const  split_points_2{ generate_split_points(input_2) };

    INVARIANT(
        split_points_1.size() == split_points_2.size() &&
        (natural_32_bit)split_points_1.size() == num_split_points &&
        split_points_1.back() == (natural_32_bit)input_1->types()->size() - 1U &&
        split_points_2.back() == (natural_32_bit)input_2->types()->size() - 1U
        );

    bits_ref.clear();
    types_ref = make_shared_wrapper<input_types>();
    metadata_ref = make_shared_wrapper<input_metadata>();

    auto const&  store_input = [&bits_ref, &types_ref, &metadata_ref](
            typed_input_ptr const  input,
            natural_32_bit const  start_type_index,
            natural_32_bit const  end_type_index
            )
    {
        for (natural_32_bit  type_index = start_type_index; type_index <= end_type_index; ++type_index)
        {
            types_ref->push_back(input->types()->at(type_index));
            for (natural_32_bit i = input->type_start_bit_index(type_index), e = input->type_end_bit_index(type_index); i <= e; ++i)
                bits_ref.push_back(input->bits().at(i));
            for (natural_32_bit i = input->type_start_metadata_byte_index(type_index), e = input->type_end_metadata_byte_index(type_index); i <= e; ++i)
                metadata_ref->push_back(input->meta()->at(i));
        }
    };

    for (natural_32_bit i = 0U, j = 0U, k = 0U; k != num_split_points; ++k)
    {
        natural_32_bit const  I = split_points_1.at(k);
        natural_32_bit const  J = split_points_2.at(k);
        INVARIANT(i <= I && j <= J);

        switch (get_random_natural_32_bit_in_range(0U, 3U, rnd_generator))
        {
            case 0U:
                store_input(input_1, i, I);
                break;
            case 1U:
                store_input(input_2, j, J);
                break;
            case 2U:
                store_input(input_1, i, I);
                store_input(input_2, j, J);
                break;
            case 3U:
                store_input(input_2, j, J);
                store_input(input_1, i, I);
                break;
            default: UNREACHABLE(); break;
        }

        i = I + 1;
        j = J + 1;
    }
}


struct search_stack
{
    enum struct command : natural_8_bit {
        GO_TO_FALSE_CHILD               = 0U,
        GO_TO_TRUE_CHILD                = 1U,
        TRY_SELECT_FOR_CURRENT_INPUT    = 2U,
    };
    using record = std::pair<branching_node*, command>;

    search_stack(branching_node* const  root, random_generator_for_natural_32_bit&  rnd_generator_);

    void  push(branching_node* node);
    void  push_child(branching_node* node, bool  dir);
    record  pop();
    bool  empty() { return stack.empty(); };

private:
    std::vector<record> stack;
    random_generator_for_natural_32_bit&  rnd_generator;
};


search_stack::search_stack(branching_node* const  root, random_generator_for_natural_32_bit&  rnd_generator_)
    : stack{}
    ,rnd_generator{ rnd_generator_ }
{
    ASSUMPTION(root != nullptr);
    push(root);
}


void  search_stack::push(branching_node* node)
{
    stack.push_back({ node,  command::TRY_SELECT_FOR_CURRENT_INPUT });
    if (get_random_natural_32_bit_in_range(0U, 1000U, rnd_generator) < 500U)
    {
        stack.push_back({ node,  command::GO_TO_TRUE_CHILD });
        stack.push_back({ node,  command::GO_TO_FALSE_CHILD });
    }
    else
    {
        stack.push_back({ node,  command::GO_TO_FALSE_CHILD });
        stack.push_back({ node,  command::GO_TO_TRUE_CHILD });
    }
}


void  search_stack::push_child(branching_node* const  node, bool const  dir)
{
    branching_node* const  succ{ node->successor(dir).pointer };
    if (succ != nullptr)
        push(succ);
}


search_stack::record  search_stack::pop()
{
    record const  rec{ stack.back() };
    stack.pop_back();
    return rec;
}


bitflip_analysis::bitflip_analysis()
    : state{ READY }
    , node_ptr{ nullptr }
    , current_input{ nullptr }
    , counter{ 0U }
    , bit_flips{}
    , value_changes{}
    , crossover_others{}
    , coverage_increases{}
    , coverage_failures{}
    , processed_inputs{}
    , rnd_generator{}
    , statistics{}
    , statistics_markers{}
{}


void  bitflip_analysis::start(branching_node* const  root_node)
{
    ASSUMPTION(is_ready());

    current_input = nullptr;
    node_ptr = nullptr;
    counter = 0U;

    statistics_markers = {};

    search_for_current_input(root_node);
    if (current_input == nullptr)
        return;

    state = BUSY;

    bit_flips.clear();
    value_changes.clear();
    crossover_others.clear();

    if (counter < 2U)
    {
        generate_bit_flips_regular();
        generate_value_changes_regular();
    }
    else
    {
        generate_bit_flips_random();
        generate_value_changes_random();
    }

    generate_crossovers();

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

    if (!bit_flips.empty())
    {
        bits_ref = current_input->bits();
        for (auto const& i : bit_flips.back())
            bits_ref.at(i) = !bits_ref.at(i);
        bit_flips.pop_back();
        statistics_markers.mutator = statistics_update_markers::MUTATOR::BITFLIPS;
    }
    else if (!value_changes.empty())
    {
        bits_ref = current_input->bits();
        std::copy(
                value_changes.back().bits.begin(),
                value_changes.back().bits.end(),
                std::next(bits_ref.begin(), value_changes.back().start_bit_index)
                );
        value_changes.pop_back();
        statistics_markers.mutator = statistics_update_markers::MUTATOR::VALUE_CHANGES;
    }
    else if (!crossover_others.empty())
    {
        compute_crossover(current_input, crossover_others.back(), bits_ref, types_ref, metadata_ref, rnd_generator);
        crossover_others.pop_back();
        statistics_markers.mutator = statistics_update_markers::MUTATOR::CROSSOVERS;
        return true;
    }
    else
    {
        stop();
        return false;
    }

    types_ref = current_input->types();
    metadata_ref = current_input->meta();

    ++statistics.generated_inputs;

    return true;
}


void  bitflip_analysis::process_execution_results(bool const  was_coverage_increased, bool const  was_location_discovered)
{
    if (!was_coverage_increased && !was_location_discovered)
        return;

    switch (statistics_markers.selection)
    {
        case statistics_update_markers::SELECTION::COVERAGE_INCREASED: ++statistics.successes_coverage_increased; break;
        case statistics_update_markers::SELECTION::COVERAGE_FAILURES: ++statistics.successes_coverage_failures; break;
        case statistics_update_markers::SELECTION::PROCESSED_INPUTS: ++statistics.successes_processed_inputs; break;
        default: UNREACHABLE(); break;
    }
    switch (statistics_markers.mutator)
    {
        case statistics_update_markers::MUTATOR::BITFLIPS:
            if (counter < 2U) ++statistics.successes_bitflips_regular; else ++statistics.successes_bitflips_random;
            break;
        case statistics_update_markers::MUTATOR::VALUE_CHANGES:
            if (counter < 2U) ++statistics.successes_value_changes_regular; else ++statistics.successes_value_changes_random;
            break;
        case statistics_update_markers::MUTATOR::CROSSOVERS:
            ++statistics.successes_crossovers;
            break;
        default: UNREACHABLE(); break;
    }
}


void  bitflip_analysis::on_coverage_increase_or_location_discovery(typed_input_ptr const  input)
{
    if (!input->types()->empty())
        coverage_increases[0].insert(input);
}


void  bitflip_analysis::on_coverage_failure(typed_input_ptr const  input)
{
    // Commented, because mutating these inputs is not effective according to experiments.
    // if (!input->types()->empty())
    //     coverage_failures[0].insert(input);
}


void  bitflip_analysis::search_for_current_input(branching_node* const  root)
{
    if (root == nullptr)
        return;

    for (std::size_t i = 0UL; i != coverage_increases.size(); ++i)
        if (!coverage_increases.at(i).empty())
        {
            current_input = *coverage_increases.at(i).begin();
            counter = (natural_32_bit)i + 1U;

            coverage_increases.at(i).erase(coverage_increases.at(i).begin());
            if (i + 1UL < coverage_increases.size())
                coverage_increases.at(i + 1UL).insert(current_input);

            ++statistics.num_coverage_increased;
            statistics_markers.selection = statistics_update_markers::SELECTION::COVERAGE_INCREASED;

            return;
        }

    for (std::size_t i = 0UL; i != coverage_failures.size(); ++i)
        if (!coverage_failures.at(i).empty())
        {
            current_input = *coverage_failures.at(i).begin();
            counter = (natural_32_bit)i + 1U;

            coverage_failures.at(i).erase(coverage_failures.at(i).begin());
            if (i + 1UL < coverage_failures.size())
                coverage_failures.at(i + 1UL).insert(current_input);

            ++statistics.num_coverage_failures;
            statistics_markers.selection = statistics_update_markers::SELECTION::COVERAGE_FAILURES;

            return;
        }

    natural_32_bit  min_count;
    if (processed_inputs.empty())
        min_count = 0U;
    else
    {
        min_count = processed_inputs.begin()->second;
        for (auto it = std::next(processed_inputs.begin()); it != processed_inputs.end(); )
            if (it->first.unique())
                it = processed_inputs.erase(it);
            else
            {
                min_count = std::min(min_count, it->second);
                ++it;
            }
    }

    search_stack  stack{ root, rnd_generator };
    do
    {
        search_stack::record const  top{ stack.pop() };
        switch (top.second)
        {
            case search_stack::command::GO_TO_FALSE_CHILD: stack.push_child(top.first, false); break;
            case search_stack::command::GO_TO_TRUE_CHILD: stack.push_child(top.first, true); break;
            case search_stack::command::TRY_SELECT_FOR_CURRENT_INPUT:
                if (top.first->get_best_stdin() != nullptr && !top.first->get_best_stdin()->bits().empty())
                {
                    auto it = processed_inputs.find(top.first->get_best_stdin());
                    if (it == processed_inputs.end())
                    {
                        processed_inputs.insert({ top.first->get_best_stdin(), 1U });
                        current_input = top.first->get_best_stdin();
                        counter = 1U;
                        ++statistics.num_processed_inputs;
                        statistics_markers.selection = statistics_update_markers::SELECTION::PROCESSED_INPUTS;
                        return;
                    }
                    else if (it->second <= min_count)
                    {
                        ++it->second;
                        current_input = top.first->get_best_stdin();
                        counter = it->second;
                        ++statistics.num_processed_inputs;
                        statistics_markers.selection = statistics_update_markers::SELECTION::PROCESSED_INPUTS;
                        return;
                    }
                }
                else
                {
                    auto it = processed_inputs.find(top.first->get_best_stdin());
                    if (it == processed_inputs.end() && it->first.unique())
                        processed_inputs.erase(it);
                }
                break;
        }
    }
    while (!stack.empty());
}


void  bitflip_analysis::generate_bit_flips_regular()
{
    natural_32_bit const num_bits{ (natural_32_bit)current_input->bits().size() };
    natural_32_bit const max_steps = std::min(num_bits, MAX_BIT_MUTATIONS);
    natural_32_bit const step = std::max(1U, (natural_32_bit)std::floor((float_32_bit)num_bits / (float_32_bit)max_steps));
    natural_32_bit  index{ counter % num_bits };
    for (natural_32_bit i = 0; i < max_steps; ++i, index = (index + step) % num_bits)
        bit_flips.push_back({ index });
    statistics.num_bitflips_regular += bit_flips.size();
}


void  bitflip_analysis::generate_bit_flips_random()
{
    natural_32_bit const num_bits{ (natural_32_bit)current_input->bits().size() };
    natural_32_bit num_flips{ 1 };
    while (bit_flips.size() < MAX_BIT_MUTATIONS)
    {
        bit_flips.push_back({});
        while ((natural_32_bit)bit_flips.back().size() != num_flips)
            bit_flips.back().insert(get_random_natural_32_bit_in_range(0U, num_bits - 1U, rnd_generator));
        ++num_flips;
        if (num_flips > std::min(num_bits / 2U, 16U))
            num_flips = 1U;
    }
    statistics.num_bitflips_random += bit_flips.size();
}


void  bitflip_analysis::generate_value_changes_regular()
{
    natural_32_bit const num_types{ (natural_32_bit)current_input->types()->size() };
    natural_32_bit const max_steps = std::min(num_types, MAX_TYPE_MUTATIONS);
    natural_32_bit const step = std::max(1U, (natural_32_bit)std::floor((float_32_bit)num_types / (float_32_bit)max_steps));
    natural_32_bit  index{ counter % num_types };
    for (natural_32_bit i = 0; i < max_steps; index = (index + step) % num_types)
    {
        auto it = SPECIAL_VALUES.find(current_input->types()->at(index));
        if (it != SPECIAL_VALUES.end())
            for (auto value_it = it->second.begin(); value_it != it->second.end() && i < max_steps; ++value_it, ++i)
                value_changes.push_back(ValueChange{
                    .start_bit_index = current_input->type_start_bit_index(index),
                    .bits = *value_it
                    });
        else
            ++i;
    }
    statistics.num_value_changes_regular += value_changes.size();
}


void  bitflip_analysis::generate_value_changes_random()
{
    natural_32_bit const  max_type_idx{ (natural_32_bit)current_input->types()->size() - 1U };
    natural_32_bit const  max_selected{ std::max(std::min((max_type_idx + 1U) / 2U, 8U), 1U) };

    std::unordered_set<std::pair<natural_32_bit, vecb const*> >  selected;
    for (natural_32_bit i = 0; i < MAX_TYPE_MUTATIONS; ++i)
    {
        natural_32_bit const  type_idx = get_random_natural_32_bit_in_range(0U, max_type_idx, rnd_generator);
        auto it = SPECIAL_VALUES.find(current_input->types()->at(type_idx));
        if (it != SPECIAL_VALUES.end())
        {
            natural_32_bit const  value_idx = get_random_natural_32_bit_in_range(0U, (natural_32_bit)it->second.size() - 1U, rnd_generator);
            selected.insert({ type_idx, &it->second.at(value_idx) });
        }
    }

    for (auto [type_idx, bits_ptr] : selected)
        value_changes.push_back({ current_input->type_start_bit_index(type_idx), *bits_ptr });

    statistics.num_value_changes_random += value_changes.size();
}


void  bitflip_analysis::generate_crossovers()
{
    std::vector<typed_input_ptr>  others;
    for (std::size_t i = 0UL; i != coverage_increases.size(); ++i)
        for (typed_input_ptr input : coverage_increases.at(i))
            if (input != current_input)
                others.push_back(input);
    natural_32_bit const  max_others = std::min((natural_32_bit)others.size(), MAX_CROSSOVERS);
    while ((natural_32_bit)crossover_others.size() < max_others)
    {
        natural_32_bit const  idx = get_random_natural_32_bit_in_range(0U, (natural_32_bit)others.size() - 1U, rnd_generator);
        crossover_others.push_back(others.at(idx));
        others.at(idx) = others.back();
        others.pop_back();
    }
    statistics.num_crossovers += crossover_others.size();
}


}
