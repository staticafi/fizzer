#include <fuzzing/bitflip_analysis.hpp>
#include <fuzzing/progress_recorder.hpp>
#include <utility/assumptions.hpp>
#include <utility/invariants.hpp>
#include <utility/timeprof.hpp>
#include <vector>

namespace  fuzzing {


static natural_32_bit constexpr  MAX_BIT_MUTATIONS = 8U * 16U;
static natural_32_bit constexpr  MAX_TYPE_MUTATIONS = 8U;


natural_32_bit  compute_next_index(natural_32_bit&  counter, natural_32_bit&  index, natural_32_bit const  n, natural_32_bit const  N)
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
    , mutated_bit_index{ 0U }
    , mutated_type_index{ 0U }
    , mutated_value_index{ 0U }
    , probed_bit_start_index{ 0U }
    , probed_bit_end_index{ 0U }
    , counter{ 0U }
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


branching_node*  bitflip_analysis::search_for_current_input(branching_node* const  root)
{
    if (root == nullptr)
        return  nullptr;
    search_stack  stack{ root, rnd_generator };
    do
    {
        search_stack::record const  top{ stack.pop() };
        switch (top.second)
        {
            case search_stack::command::GO_TO_FALSE_CHILD: stack.push_child(top.first, false); break;
            case search_stack::command::GO_TO_TRUE_CHILD: stack.push_child(top.first, true); break;
            case search_stack::command::TRY_SELECT_FOR_CURRENT_INPUT:
                if (top.first->get_best_stdin() != nullptr && !top.first->get_best_stdin()->bits().empty()
                        && !processed_inputs.contains(top.first->get_best_stdin().get()))
                    return top.first;
                break;
        }
    }
    while (!stack.empty());
    return  nullptr;
}


void  bitflip_analysis::start(branching_node* const  root_node)
{
    ASSUMPTION(is_ready());

    current_input = nullptr;
    node_ptr = search_for_current_input(root_node);
    if (node_ptr == nullptr)
        return;
    current_input = node_ptr->get_best_stdin();

    state = BUSY;

    processed_inputs.insert(current_input.get());

    mutated_bit_index = 0;
    mutated_type_index = 0;
    mutated_value_index = 0;
    counter = 0;

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

        compute_next_index(counter, mutated_bit_index, current_input->bits().size(), MAX_BIT_MUTATIONS);
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
    for ( ; is_mutated_type_index_valid(); compute_next_index(counter, mutated_type_index, current_input->types()->size(), MAX_TYPE_MUTATIONS))
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
