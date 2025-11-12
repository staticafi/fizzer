#include <fuzzing/search_strategy.hpp>
#include <utility/assumptions.hpp>
#include <utility/invariants.hpp>
#include <unordered_map>
#include <array>
#include <vector>
#include <memory>
#include <algorithm>

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


static float_32_bit  choose_target_value(
        std::vector<branching_node*> const&  nodes,
        std::vector<float_32_bit> const&  values,
        search_strategy::METRIC_TYPE const  type
        )
{
    if (nodes.empty())
        return 0.0f;

    if (type == search_strategy::MT_BEST_VALUE)
    {
        float_32_bit constexpr  non_zero{ 1000.0f };
        branching_node* const  node{ nodes.front() };
        bool const  dir{ node->is_direction_unexplored(true) };
        switch (node->get_atomic_predicate())
        {
            case atomic_predicate::EQUAL: return dir ? 0.0f : non_zero;
            case atomic_predicate::UNEQUAL: return dir ? non_zero : 0.0f;
            case atomic_predicate::LESS: return dir ? -non_zero : non_zero;
            case atomic_predicate::LESS_EQUAL: return dir ? -non_zero : non_zero;
            case atomic_predicate::GREATER: return dir ? non_zero : -non_zero;
            case atomic_predicate::GREATER_EQUAL: return dir ? non_zero : -non_zero;
            default: UNREACHABLE();
            }
    }

    // TODO!
    return 0.0f;
}


struct  navigator
{
    struct  id_info
    {
        natural_32_bit counts[2] = { 0U, 0U };
        float_32_bit ratios[2][3] = { { 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f } };
    };

    struct vec2 { float_32_bit  x,y; };

    struct extrapolation
    {
        extrapolation() : c0{ 0.0f }, c1{ 0.0f } {}
        void build(std::vector<vec2> const&  input);
        static float_32_bit  apply(float_32_bit const  c0, float_32_bit const  c1, float_32_bit const  value) { return c0 + value * c1; }
        float_32_bit  apply(float_32_bit const  value) const { return apply(c0, c1, value); }
    private:
        float_32_bit  c0;
        float_32_bit  c1;
    };

    struct  id_extra
    {
        extrapolation  counts[2] = { {}, {} };
        extrapolation  ratios[2][3] = { { {}, {}, {} }, { {}, {}, {} } };
    };

    navigator(std::vector<branching_node*> const&  nodes, metric&  metric);
    bool  valid() const { return !extrapolations.empty(); }
    std::vector<float_32_bit> const&  get_values() const { return values; }
    branching_node*  run(branching_node*  root, float_32_bit  value);

private:

    std::unordered_set<integer_32_bit>  sids;
    std::vector<float_32_bit>  values;
    std::unordered_map<integer_32_bit, id_extra>  extrapolations;
};

void navigator::extrapolation::build(std::vector<vec2> const&  input)
{
    float_32_bit  A = 0.0f, B = 0.0f, C = 0.0f, D = 0.0f;
    for (std::size_t  i = 0ULL; i != input.size(); ++i) {
        vec2 const  p = input.at(i);
        A += p.x * p.x;
        B += p.x;
        C += p.x * p.y;
        D += p.y;
    }
    float_32_bit const  size{ (float_32_bit)input.size() };
    c1 = input.empty() || size * A - B * B == 0.0f ? 0.0f : (size * C - B * D) / (size * A - B * B);
    c0 = input.empty() ? 0.0f : (D - c1 * B) / size;
}

navigator::navigator(std::vector<branching_node*> const&  nodes, metric&  metric)
    : sids{}
    , extrapolations{}
{
    std::vector<std::unordered_map<integer_32_bit, std::vector<float_32_bit> > >  consumptions;
    for (branching_node*  node : nodes)
    {
        consumptions.push_back({});
        auto&  map{ consumptions.back() };
        for (branching_node*  n = node->get_predecessor(), *m = node; n != nullptr; m = n, n = n->get_predecessor())
        {
            integer_32_bit const  sid{ (n->successor_direction(m) ? -1 : 1) * (integer_32_bit)n->get_location_id() };
            float_32_bit const x{ n->get_trace_index() / (float_32_bit)std::max(1U, node->get_trace_index()) };
            map.insert({ sid, {} }).first->second.push_back(x);
        }
        for (auto  it = map.begin(); it != map.end(); ++it)
        {
            std::reverse(it->second.begin(), it->second.end());
            sids.insert(it->first);
        }
        values.push_back(metric.value(node));
    }

    {
        bool all_same{ true };
        for (auto  v : values)
            if (v != values.front())
            {
                all_same = false;
                break;
            }
        if (all_same)
            return;
    }

    std::vector<std::unordered_map<integer_32_bit, id_info>>  infos;
    for (auto& con_map : consumptions)
    {
        infos.push_back({});
        auto&  map{ infos.back() };
        for (auto  it = con_map.begin(); it != con_map.end(); ++it)
            map.insert({ std::abs(it->first), {} }).first->second.counts[it->first < 0 ? 0 : 1] = (natural_32_bit)con_map.at(it->first).size();
    }
    std::unordered_set<integer_32_bit>  processed;
    for (integer_32_bit  sid : sids)
    {
        if (processed.contains(sid))
            continue;
        processed.insert(sid);
        processed.insert(-sid);
        integer_32_bit  avgCount = 0;
        float_32_bit  avgRatios[2][3] { { 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f } };
        std::unordered_map<std::size_t, integer_32_bit>  singular;
        for (std::size_t  i = 0ULL; i != consumptions.size(); ++i)
        {
            auto const&  con_map{ consumptions.at(i) };
            decltype(consumptions)::value_type::const_iterator const  x[2] { con_map.find(-std::abs(sid)), con_map.find( std::abs(sid)) };
            if (x[0] != con_map.end() && x[1] != con_map.end())
            {
                id_info&  info = infos.at(i).at(std::abs(sid));
                for (int k = 0; k != 2; ++k)
                {
                    std::vector<float_32_bit> const& f = x[k]->second;
                    std::vector<float_32_bit> const& g = x[(k + 1) % 2]->second;
                    for (int j = 0; j < f.size() && f.at(j) < g.back(); ++j)
                        ++info.ratios[k][0];
                    for (int j = f.size() - 1; j >= 0 && f.at(j) > g.back(); --j)
                        ++info.ratios[k][2];
                    info.ratios[k][1] = f.size() - info.ratios[k][0] - info.ratios[k][2];
                    for (int l = 0; l != 3; ++l) {
                        info.ratios[k][l] /= f.size();
                        avgRatios[k][l] += info.ratios[k][l];
                    }
                }
                ++avgCount;
            }
            else if (x[0] != con_map.end())
                singular.insert({ i, 0 });
            else if (x[1] != con_map.end())
                singular.insert({ i, 1 });
        }
        if (avgCount == 0)
            for (int k = 0; k != 2; ++k)
                avgRatios[k][0] = 1.0f;
        else
            for (int k = 0; k != 2; ++k)
            {
                float sum = 0.0f;
                for (int l = 0; l != 3; ++l)
                {
                    avgRatios[k][l] /= avgCount;
                    sum += avgRatios[k][l];
                }
                for (int l = 0; l != 3; ++l)
                    avgRatios[k][l] /= sum;
            }
        for (auto const&  entry : singular)
        {
            id_info&  info{ infos.at(entry.first).at(std::abs(sid)) };
            for (int l = 0; l != 3; ++l)
                info.ratios[entry.second][l] = avgRatios[entry.second][l];
        }
    }

    for (integer_32_bit sid : sids)
    {
        if (extrapolations.contains(std::abs(sid)))
            continue;

        id_extra&  extra{ extrapolations.insert({ std::abs(sid), {} }).first->second };

        struct  inputs
        {
            std::vector<vec2> counts[2] { {}, {} };
            std::vector<vec2> ratios[2][3] { { {}, {}, {} }, { {}, {}, {} } };
        };
        inputs  inputs;
        for (int i = 0; i != infos.size(); ++i)
        {
            auto const  it{ infos.at(i).find(std::abs(sid)) };
            if (it == infos.at(i).end())
                continue;
            for (int j = 0; j != 2; ++j)
            {
                inputs.counts[j].push_back({ values.at(i), (float_32_bit)it->second.counts[j] });
                for (int k = 0; k != 3; ++k)
                    inputs.ratios[j][k].push_back({ values.at(i), it->second.ratios[j][k] });
            }
        }
        for (int j = 0; j != 2; ++j)
        {
            extra.counts[j].build(inputs.counts[j]);
            for (int k = 0; k != 3; ++k)
                extra.ratios[j][k].build(inputs.ratios[j][k]);
        }
    }
}

branching_node*  navigator::run(branching_node* const  root, float_32_bit const  value)
{
    struct visit_counts
    {
        visit_counts() : visit_counts(0, 0) {}
        visit_counts(natural_32_bit const  total0, natural_32_bit const  total1) : total{ total0, total1 } , current{ 0, 0 } {}
        bool  depleted() { return current[0] >= total[0] && current[1] >= total[1]; }
        void  increment(integer_32_bit dir) { ++current[dir]; }
        bool  choose_dir() { return ratio(0) <= ratio(1) ? false : true; }
    private:
        float_32_bit  ratio(integer_32_bit dir) { return (current[dir] + 1) / (float_32_bit)(total[dir] + 1); }
        natural_32_bit  total[2];
        natural_32_bit  current[2];
    };

    std::unordered_map<natural_32_bit, std::vector<visit_counts>>  counts;
    for (integer_32_bit sid : sids)
        if (!counts.contains(std::abs(sid)))
        {
            id_extra const&  extra = extrapolations.at(std::abs(sid));
            id_info  info;
            for (integer_32_bit j = 0; j != 2; ++j) {
                info.counts[j] = std::round(extra.counts[j].apply(value));
                for (integer_32_bit k = 0; k != 3; ++k)
                    info.ratios[j][k] = extra.ratios[j][k].apply(value);
            }
            std::vector<visit_counts>&  cnt{ counts.insert({ (natural_32_bit)std::abs(sid), {} }).first->second };
            for (integer_32_bit k = 0; k != 3; ++k)
                cnt.push_back({
                    (natural_32_bit)std::round(info.counts[0] * info.ratios[0][k]),
                    (natural_32_bit)std::round(info.counts[1] * info.ratios[1][k])
                });
            std::reverse(cnt.begin(), cnt.end());
        }

    bool dirOpen[2]{ false, false };
    branching_node*  node{ root };
    while (true)
    {
        std::vector<visit_counts>&  cnt{ counts.insert({ node->get_location_id(), { { 0U, 0U } } }).first->second };

        bool  dir;
        for (integer_32_bit i = 0; i != 2; ++i)
            switch (node->successor(i == 0 ? false : true).label)
            {
                case branching_node::successor_pointer::END_EXCEPTIONAL:
                case branching_node::successor_pointer::END_NORMAL:
                    dirOpen[i] = false;
                    break;
                case branching_node::successor_pointer::VISITED:
                    dirOpen[i] = !node->successor(i == 0 ? false : true).pointer->is_closed();
                    break;
                default:
                    dirOpen[i] = true;
                    break;
            }
        if (dirOpen[0] && dirOpen[1])
            dir = cnt.back().choose_dir();
        else if (dirOpen[0])
            dir = false;
        else if (dirOpen[1])
            dir = true;
        else { UNREACHABLE(); }

        cnt.back().increment(dir);
        if (cnt.back().depleted() && cnt.size() > 1ULL)
            cnt.pop_back();

        branching_node*  n = node->successor(dir).pointer;
        if (n == nullptr)
            return node;

        node = n;
    }
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
                navigator  nav{ output, *metric_ptr };
                branching_node* const  winner{
                    nav.valid() ? nav.run(root, choose_target_value(output, nav.get_values(), props.metric_type)) :
                    nullptr
                };
    
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
    for (auto it = uncovered.begin(); it != uncovered.end(); )
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
