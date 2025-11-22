#include <fuzzing/strategy/filter.hpp>
#include <fuzzing/strategy/metric.hpp>
#include <fuzzing/branching_node.hpp>
#include <utility/invariants.hpp>
#include <algorithm>

namespace  fuzzing {


std::string  to_string(FILTER_TYPE const  type)
{
    switch (type)
    {
        case FILTER_TYPE::ALL: return "All";
        case FILTER_TYPE::WARM: return "Warm";
        case FILTER_TYPE::COLD: return "Cold";
        case FILTER_TYPE::INPUT_USE: return "InputUse";
        case FILTER_TYPE::INPUT_WARM: return "InputWarm";
        case FILTER_TYPE::INPUT_COLD: return "InputCold";
        default: UNREACHABLE(); return "";
    }
}


void  filter::apply(std::vector<value_and_node> const&  input, std::vector<value_and_node>&  output)
{
    if (next == nullptr)
        run(input, output);
    else
    {
        std::vector<value_and_node> temp;
        run(input, temp);
        next->apply(temp, output);
    }
}


filter*  filter::after(filter* const  prev)
{
    prev->next = this;
    return prev;
}


void  all_filter::run(std::vector<value_and_node> const&  input, std::vector<value_and_node>&  output)
{
    output.assign(input.begin(), input.end());
}


void  signed_filter::run(std::vector<value_and_node> const&  input, std::vector<value_and_node>&  output)
{
    for (value_and_node const&  item : input)
        if (item.value * sign >= 0.0)
            output.push_back(item);
}


void  input_use_filter::run(std::vector<value_and_node> const&  input, std::vector<value_and_node>&  output)
{
    std::unordered_map<float_64_bit, std::vector<value_and_node> >  partitioning{};
    for (value_and_node const&  item : input)
        partitioning.insert({ item.value, {} }).first->second.push_back(item);
    for (auto  it = partitioning.begin(); it != partitioning.end(); ++it)
    {
        value_and_node  winner{};
        for (auto  item : it->second)
            winner = winner.valid() ? better(winner, item) : item;
        output.push_back(winner);
    }
}


value_and_node const&  input_use_filter::better(value_and_node const&  left, value_and_node const&  right)
{
    return size_error(left.node) <= size_error(right.node) ? left : right;
}


int  input_use_filter::size_error(branching_node* const  node)
{
    return std::abs(ideal_size(node) - (int)node->get_trace_index());
}


int  input_use_filter::ideal_size(branching_node* const  node)
{
    return 2 * (max_read_index(node) + 1);
}


int  input_use_filter::max_read_index(branching_node*  node)
{
    while (node->get_predecessor() != nullptr && node->get_predecessor()->get_num_stdin_bytes() == node->get_num_stdin_bytes())
        node = node->get_predecessor();
    return node->get_trace_index();
}


std::unique_ptr<filter>  create_filter(FILTER_TYPE const  type)
{
    switch (type)
    {
        case FILTER_TYPE::ALL: return std::unique_ptr<filter>{ new all_filter(FILTER_TYPE::ALL) };
        case FILTER_TYPE::WARM: return std::unique_ptr<filter>{ new signed_filter(FILTER_TYPE::WARM, 1.0) };
        case FILTER_TYPE::COLD: return std::unique_ptr<filter>{ new signed_filter(FILTER_TYPE::COLD, -1.0) };
        case FILTER_TYPE::INPUT_USE: return std::unique_ptr<filter>{ new input_use_filter(FILTER_TYPE::INPUT_USE) };
        case FILTER_TYPE::INPUT_WARM: return std::unique_ptr<filter>{ (new input_use_filter(FILTER_TYPE::INPUT_WARM))->after(
                                                                       new signed_filter(FILTER_TYPE::INPUT_WARM, 1.0)) };
        case FILTER_TYPE::INPUT_COLD: return std::unique_ptr<filter>{ (new input_use_filter(FILTER_TYPE::INPUT_COLD))->after(
                                                                       new signed_filter(FILTER_TYPE::INPUT_COLD, -1.0)) };
        default: UNREACHABLE(); return nullptr;
    }
}


}
