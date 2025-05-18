#include <fuzzing/search_strategy.hpp>
#include <unordered_map>
#include <array>
#include <vector>
#include <memory>

namespace  fuzzing {


struct  metric
{
    virtual ~metric() {}
    virtual float_32_bit  value(branching_node const*  node) = 0;
};


struct  best_value_metric : public metric
{
    float_32_bit  value(branching_node const* const  node) override { return (float_32_bit)node->get_best_value(); }
};


struct input_size_metric : public metric
{
    float_32_bit  value(branching_node const* const  node) override { return (float_32_bit)node->get_num_stdin_bytes(); }
};


struct hit_count_metric : public metric
{
    float_32_bit  value(branching_node const* const  node) override;
private:
    std::unordered_map<branching_node const*, float_32_bit>  cache{};
};

float_32_bit  hit_count_metric::value(branching_node const* const  node)
{
    auto it = cache.find(node);
    if (it == cache.end())
    {
        natural_32_bit  count = 0;
        for (branching_node const*  n = node->get_predecessor(); n != nullptr; n = n->get_predecessor())
            if (n->get_location_id() == node->get_location_id())
                ++count;
        it = cache.insert({ node, (float_32_bit)count }).first;
    }
    return it->second;
}


struct  filter
{
    virtual ~filter() { delete next; }

    void apply(std::vector<branching_node*> const&  input, metric&  metric, std::vector<branching_node*>&  output);
    filter* after(filter* const  prev) { prev->next = this; return prev; }

protected:
    virtual void run(std::vector<branching_node*> const&  input, metric&  metric, std::vector<branching_node*>&  output) = 0;

private:
    filter*  next{ nullptr };
};

void filter::apply(std::vector<branching_node*> const&  input, metric&  metric, std::vector<branching_node*>&  output)
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


struct all_filter : public filter
{
private:
    void run(std::vector<branching_node*> const&  input, metric&, std::vector<branching_node*>&  output) override
    { output.assign(input.begin(), input.end()); }
};


struct signed_filter : public filter
{
    explicit signed_filter(float_32_bit const  sign_) : filter{}, sign{ sign_ } {}

private:
    void run(std::vector<branching_node*> const&  input, metric&  metric, std::vector<branching_node*>&  output) override;

    float_32_bit sign;
};

void signed_filter::run(std::vector<branching_node*> const&  input, metric&  metric, std::vector<branching_node*>&  output)
{
    for (auto node : input)
        if (metric.value(node) * sign >= 0.0f)
            output.push_back(node);
}


struct input_use_filter : public filter
{
private:
    void run(std::vector<branching_node*> const&  input, metric&  metric, std::vector<branching_node*>&  output) override;

    static inline branching_node* better(branching_node* const  left, branching_node* const right)
    { return size_error(left) <= size_error(right) ? left : right; }
    static inline int  size_error(branching_node* const  node) { return std::abs(ideal_size(node) - (int)node->get_trace_index()); }
    static inline int  ideal_size(branching_node* const  node) { return 2 * (max_read_index(node) + 1); }
    static int  max_read_index(branching_node*  node);
};

void input_use_filter::run(std::vector<branching_node*> const&  input, metric&  metric, std::vector<branching_node*>&  output)
{
    std::unordered_map<float_32_bit, std::vector<branching_node*> >  partitioning{};
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

int  input_use_filter::max_read_index(branching_node*  node)
{
    while (node->get_predecessor() != nullptr && node->get_predecessor()->get_num_stdin_bytes() == node->get_num_stdin_bytes())
        node = node->get_predecessor();
    return node->get_trace_index();
}


search_strategy::search_strategy()
    : uncovered{}
{}


search_strategy::~search_strategy()
{}


branching_node*  search_strategy::choose(branching_node* const  root)
{
    if (root == nullptr)
        return nullptr;

    if (!uncovered.empty())
    {
        branching_node* const  winner{ *uncovered.begin() };
        uncovered.erase(uncovered.begin());
        return winner;
    }

    return nullptr;
}


void  search_strategy::on_new_uncovered_node(branching_node*  node)
{
    uncovered.insert(node);
}


void  search_strategy::on_location_covered(location_id const id)
{
    for (auto it = uncovered.begin(); it != uncovered.end(); ++it)
        if ((*it)->get_location_id() == id)
            it = uncovered.erase(it);
        else
            ++it;
}


void  search_strategy::on_erase(branching_node*  node)
{
    uncovered.erase(node);
}


}
