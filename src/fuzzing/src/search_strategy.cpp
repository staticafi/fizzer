#include <fuzzing/search_strategy.hpp>
#include <utility/assumptions.hpp>
#include <utility/invariants.hpp>
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


static std::unique_ptr<metric>  create_metric(search_strategy::METRIC_TYPE const  type)
{
    switch (type)
    {
        case search_strategy::MT_BEST_VALUE: return std::unique_ptr<metric>{ new best_value_metric };
        case search_strategy::MT_INPUT_SIZE: return std::unique_ptr<metric>{ new input_size_metric };
        case search_strategy::MT_HIT_COUNT: return std::unique_ptr<metric>{ new hit_count_metric };
        default: UNREACHABLE(); return nullptr;
    }
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


static std::unique_ptr<filter>  create_filter(search_strategy::FILTER_TYPE const  type)
{
    switch (type)
    {
        case search_strategy::FT_ALL: return std::unique_ptr<filter>{ new all_filter };
        case search_strategy::FT_WARM: return std::unique_ptr<filter>{ new signed_filter(1.0f) };
        case search_strategy::FT_COLD: return std::unique_ptr<filter>{ new signed_filter(-1.0f) };
        case search_strategy::FT_INPUT_USE: return std::unique_ptr<filter>{ new input_use_filter };
        case search_strategy::FT_INPUT_WARM: return std::unique_ptr<filter>{ (new input_use_filter)->after(new signed_filter(1.0f)) };
        case search_strategy::FT_INPUT_COLD: return std::unique_ptr<filter>{ (new input_use_filter)->after(new signed_filter(-1.0f)) };
        default: UNREACHABLE(); return nullptr;
    }
}


static float_32_bit  choose_target_value(std::vector<branching_node*> const&  nodes, search_strategy::METRIC_TYPE const  type)
{
    // TODO!
    return 0.0f;
}


struct  navigator
{
    navigator(std::vector<branching_node*> const&  nodes);
    branching_node*  run(branching_node*  root, float_32_bit  value);
};

navigator::navigator(std::vector<branching_node*> const&  nodes)
{
    // TODO!
}

branching_node*  navigator::run(branching_node* const  root, float_32_bit const  value)
{
    // TODO!
    return nullptr;
}


search_strategy::search_strategy()
    : locations{}
    , location{ locations.end() }
    , uncovered{}
    , MAX_NODES{ 50U }
{}


search_strategy::~search_strategy()
{}


branching_node*  search_strategy::choose(branching_node* const  root)
{
    if (root == nullptr)
        return nullptr;

    if (!locations.empty())
    {
        if (location == locations.end())
            location = locations.begin();
        auto start_location = location;
        do
        {
            location_props&  props{ location->second };
            auto start_metric_type = props.metric_type;
            auto start_filter_type = props.filter_type;
            do
            {
                auto metric_ptr{ create_metric(props.metric_type) };
                auto filter_ptr{ create_filter(props.filter_type) };
                std::vector<branching_node*>  output;
                filter_ptr->apply({ props.nodes.begin(), props.nodes.end() }, *metric_ptr, output);
                float_32_bit const  value{ choose_target_value(output, props.metric_type) };
                navigator  nav{ output };
                branching_node* const  winner{ nav.run(root, value) };
    
                props.filter_type = (FILTER_TYPE)(props.filter_type + 1);
                if (props.filter_type == NUM_FILTER_TYPES)
                {
                    props.filter_type = (FILTER_TYPE)0;
                    props.metric_type = (METRIC_TYPE)(props.metric_type + 1);
                    if (props.metric_type == NUM_METRIC_TYPES)
                        props.metric_type = (METRIC_TYPE)0;
                }

                if (winner != nullptr)
                    return winner;
            }
            while (props.metric_type != start_metric_type || props.filter_type != start_filter_type);

            ++location;
            if (location == locations.end())
                location = locations.begin();
        }
        while (location != start_location);
    }

    if (!uncovered.empty())
    {
        branching_node* const  winner{ *uncovered.begin() };
        uncovered.erase(uncovered.begin());
        return winner;
    }

    return nullptr;
}


void  search_strategy::on_new_uncovered_node(branching_node* const  node)
{
    auto const  it_and_state = locations.insert({ node->get_location_id(), {} });
    auto&  nodes{ it_and_state.first->second.nodes };
    nodes.push_back(node);
    while (nodes.size() > MAX_NODES)
        nodes.pop_front();
    uncovered.insert(node);
}


void  search_strategy::on_location_covered(location_id const id)
{
    if (location != locations.end() && location->first == id)
        ++location;
    locations.erase(id);
    for (auto it = uncovered.begin(); it != uncovered.end(); ++it)
        if ((*it)->get_location_id() == id)
            it = uncovered.erase(it);
        else
            ++it;
}


void  search_strategy::on_erase(branching_node* const  node)
{
    auto const  loc_it = locations.find(node->get_location_id());
    if (loc_it != locations.end())
    {
        auto&  nodes{ loc_it->second.nodes };
        nodes.erase(std::remove(nodes.begin(), nodes.end(), node), nodes.end());
    }
    uncovered.erase(node);
}


}
