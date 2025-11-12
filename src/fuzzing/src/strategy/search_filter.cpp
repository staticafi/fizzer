#include <fuzzing/strategy/search_filter.hpp>
#include <fuzzing/strategy/search_metric.hpp>
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


void  filter::apply(std::vector<branching_node*> const&  input, metric&  metric, std::vector<branching_node*>&  output)
{
    if (next == nullptr)
        run(input, metric, output);
    else
    {
        std::vector<branching_node*> temp;
        run(input, metric, temp);
        next->apply(temp, metric, output);
    }
}


filter*  filter::after(filter* const  prev)
{
    prev->next = this;
    return prev;
}


void  all_filter::run(std::vector<branching_node*> const&  input, metric&, std::vector<branching_node*>&  output)
{
    output.assign(input.begin(), input.end());
}


void  signed_filter::run(std::vector<branching_node*> const&  input, metric&  metric, std::vector<branching_node*>&  output)
{
    for (auto node : input)
        if (metric.value(node) * sign >= 0.0)
            output.push_back(node);
}


void  input_use_filter::run(std::vector<branching_node*> const&  input, metric&  metric, std::vector<branching_node*>&  output)
{
    std::unordered_map<float_64_bit, std::vector<branching_node*> >  partitioning{};
    for (auto  node : input)
        partitioning.insert({ metric.value(node), {} }).first->second.push_back(node);
    for (auto  it = partitioning.begin(); it != partitioning.end(); ++it)
    {
        branching_node* winner{ nullptr };
        for (auto  node : it->second)
            winner = winner == nullptr ? node : better(winner, node);
        output.push_back(winner);
    }
}


branching_node*  input_use_filter::better(branching_node* const  left, branching_node* const right)
{
    return size_error(left) <= size_error(right) ? left : right;
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
        case FILTER_TYPE::ALL: return std::unique_ptr<filter>{ new all_filter };
        case FILTER_TYPE::WARM: return std::unique_ptr<filter>{ new signed_filter(1.0) };
        case FILTER_TYPE::COLD: return std::unique_ptr<filter>{ new signed_filter(-1.0) };
        case FILTER_TYPE::INPUT_USE: return std::unique_ptr<filter>{ new input_use_filter };
        case FILTER_TYPE::INPUT_WARM: return std::unique_ptr<filter>{ (new input_use_filter)->after(new signed_filter(1.0)) };
        case FILTER_TYPE::INPUT_COLD: return std::unique_ptr<filter>{ (new input_use_filter)->after(new signed_filter(-1.0)) };
        default: UNREACHABLE(); return nullptr;
    }
}


}
