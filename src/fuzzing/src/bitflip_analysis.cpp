#include <fuzzing/bitflip_analysis.hpp>
#include <fuzzing/progress_recorder.hpp>
#include <utility/std_pair_hash.hpp>
#include <utility/assumptions.hpp>
#include <utility/invariants.hpp>
#include <utility/timeprof.hpp>
#include <vector>

namespace  fuzzing {


static natural_32_bit constexpr  MAX_BIT_MUTATIONS = 8U * 16U;
static natural_32_bit constexpr  MAX_TYPE_MUTATIONS = 8U;


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


static natural_32_bit  compute_next_index(natural_32_bit&  counter, natural_32_bit&  index, natural_32_bit const  n, natural_32_bit const  N)
{
    ++counter;
    index = n <= N ? index + 1 : (natural_32_bit)std::floor((float_32_bit)counter * (float_32_bit)n / (float_32_bit)N);
    if (index >= n)
        counter = 0;
    return index;
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
    , coverage_increases{}
    , coverage_failures{}
    , processed_inputs{}
    , rnd_generator{}
    , statistics{}
{}


void  bitflip_analysis::start(branching_node* const  root_node)
{
    ASSUMPTION(is_ready());

    current_input = nullptr;
    node_ptr = nullptr;
    counter = 0U;

    search_for_current_input(root_node);
    if (current_input == nullptr)
        return;

    state = BUSY;

    bit_flips.clear();
    value_changes.clear();

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


void  bitflip_analysis::on_coverage_increase_or_location_discovery(typed_input_ptr const  input)
{
    coverage_increases[0].insert(input);
}


void  bitflip_analysis::on_coverage_failure(typed_input_ptr const  input)
{
    //coverage_failures[0].insert(input);
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

            return;
        }

    natural_32_bit  min_count;
    if (processed_inputs.empty())
        min_count = 0U;
    else
    {
        min_count = processed_inputs.begin()->second;
        for (auto it = std::next(processed_inputs.begin()); it != processed_inputs.end(); ++it)
            min_count = std::min(min_count, it->second);
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
                        return;
                    }
                    else if (it->second <= min_count)
                    {
                        ++it->second;
                        current_input = top.first->get_best_stdin();
                        counter = it->second;
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
    natural_32_bit  mutated_bit_index{ 0U };
    natural_32_bit  counter{ 0U };
    while (mutated_bit_index < current_input->bits().size())
    {
        bit_flips.push_back({ mutated_bit_index });
        compute_next_index(counter, mutated_bit_index, current_input->bits().size(), MAX_BIT_MUTATIONS);
    }
    statistics.num_bitflips_regular += bit_flips.size();
}


void  bitflip_analysis::generate_bit_flips_random()
{
    natural_32_bit num_flips{ 1 };
    while (bit_flips.size() < MAX_BIT_MUTATIONS)
    {
        bit_flips.push_back({});
        while ((natural_32_bit)bit_flips.back().size() != num_flips)
            bit_flips.back().insert(get_random_natural_32_bit_in_range(0U, (natural_32_bit)current_input->bits().size() - 1U, rnd_generator));
        ++num_flips;
        if (num_flips > node_ptr->get_num_stdin_bits() / 2U)
            num_flips = 1U;
    }
    statistics.num_bitflips_random += bit_flips.size();
}


void  bitflip_analysis::generate_value_changes_regular()
{
    natural_32_bit  mutated_type_index{ 0U };
    natural_32_bit  mutated_value_index{ 0U };
    natural_32_bit  counter{ 0U };
    while (mutated_type_index < current_input->types()->size()
                && current_input->type_end_bit_index(mutated_type_index) < current_input->bits().size())
    {
        auto it = SPECIAL_VALUES.find(current_input->types()->at(mutated_type_index));
        if (it != SPECIAL_VALUES.end())
            for (auto value_it = it->second.begin(); value_it != it->second.end(); ++value_it)
                value_changes.push_back(ValueChange{
                    .start_bit_index = current_input->type_start_bit_index(mutated_type_index),
                    .bits = *value_it
                    });
        compute_next_index(counter, mutated_type_index, current_input->types()->size(), MAX_TYPE_MUTATIONS);
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


}
