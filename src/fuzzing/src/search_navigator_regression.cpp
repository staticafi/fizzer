#include <fuzzing/search_navigator_regression.hpp>
#include <fuzzing/branching_node.hpp>
#include <utility/assumptions.hpp>
#include <utility/invariants.hpp>
#include <algorithm>

namespace  fuzzing {


void  navigator_regression::extrapolation::build(std::vector<vec2> const&  input)
{
    float_64_bit  A = 0.0, B = 0.0, C = 0.0, D = 0.0;
    for (std::size_t  i = 0ULL; i != input.size(); ++i) {
        vec2 const  p = input.at(i);
        A += p.x * p.x;
        B += p.x;
        C += p.x * p.y;
        D += p.y;
    }
    float_64_bit const  size{ (float_64_bit)input.size() };
    c1 = input.empty() || size * A - B * B == 0.0 ? 0.0 : (size * C - B * D) / (size * A - B * B);
    c0 = input.empty() ? 0.0 : (D - c1 * B) / size;
}


navigator_regression::navigator_regression(std::vector<branching_node*> const&  nodes, std::vector<float_64_bit> const&  values)
    : sids{}
    , extrapolations{}
    , all_values_are_same{
            [&values]() {
                for (auto  v : values)
                    if (v != values.front())
                        return false;
                return true;
            }()
        }
{
    // if ([&values]() {
    //         for (auto  v : values)
    //             if (v != values.front())
    //                 return false;
    //         return true;
    //     }())
    //     return;

    std::vector<std::unordered_map<integer_32_bit, std::vector<float_64_bit> > >  consumptions;
    for (branching_node*  node : nodes)
    {
        consumptions.push_back({});
        auto&  map{ consumptions.back() };
        for (branching_node*  n = node->get_predecessor(), *m = node; n != nullptr; m = n, n = n->get_predecessor())
        {
            integer_32_bit const  sid{ (n->successor_direction(m) ? 1 : -1) * (integer_32_bit)n->get_location_id() };
            float_64_bit const x{ n->get_trace_index() / (float_64_bit)std::max(1U, node->get_trace_index()) };
            map.insert({ sid, {} }).first->second.push_back(x);
        }
        for (auto  it = map.begin(); it != map.end(); ++it)
        {
            std::reverse(it->second.begin(), it->second.end());
            sids.insert(it->first);
        }
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
        float_64_bit  avgRatios[2][3] { { 0.0, 0.0, 0.0 }, { 0.0, 0.0, 0.0 } };
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
                    std::vector<float_64_bit> const& f = x[k]->second;
                    std::vector<float_64_bit> const& g = x[(k + 1) % 2]->second;
                    for (int j = 0; j < f.size() && f.at(j) < g.back(); ++j)
                        ++info.ratios[k][0];
                    for (int j = f.size() - 1; j >= 0 && f.at(j) > g.back(); --j)
                        ++info.ratios[k][2];
                    info.ratios[k][1] = f.size() - info.ratios[k][0] - info.ratios[k][2];
                    for (int l = 0; l != 3; ++l) {
                        info.ratios[k][l] /= f.size();
                        avgRatios[k][l] += info.ratios[k][l];
                    }
                    INVARIANT(
                            info.ratios[k][0] >= 0.0 && info.ratios[k][1] >= 0.0 && info.ratios[k][2] >= 0.0 &&
                            std::abs(info.ratios[k][0] + info.ratios[k][1] + info.ratios[k][2] - 1.0) < 1e-6
                            );
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
                avgRatios[k][0] = 1.0;
        else
            for (int k = 0; k != 2; ++k)
            {
                float_64_bit sum = 0.0;
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
                inputs.counts[j].push_back({ values.at(i), (float_64_bit)it->second.counts[j] });
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


branching_node*  navigator_regression::run(branching_node* const  root, float_64_bit const  value)
{
    struct visit_counts
    {
        visit_counts() : visit_counts(0, 0) {}
        visit_counts(natural_32_bit const  total0, natural_32_bit const  total1) : total{ total0, total1 } , current{ 0, 0 } {}
        bool  depleted() { return current[0] >= total[0] && current[1] >= total[1]; }
        void  increment(integer_32_bit dir) { ++current[dir]; }
        bool  choose_dir() { return ratio(0) <= ratio(1) ? false : true; }
    private:
        float_64_bit  ratio(integer_32_bit dir) { return (current[dir] + 1) / (float_64_bit)(total[dir] + 1); }
        natural_32_bit  total[2];
        natural_32_bit  current[2];
    };

    std::unordered_map<natural_32_bit, std::vector<visit_counts> >  counts;
    for (integer_32_bit sid : sids)
        if (!counts.contains(std::abs(sid)))
        {
            id_extra const&  extra = extrapolations.at(std::abs(sid));
            id_info  info;
            for (integer_32_bit j = 0; j != 2; ++j) {
                info.counts[j] = std::round(extra.counts[j].apply(value));
                float_64_bit sum{ 0.0 };
                for (integer_32_bit k = 0; k != 3; ++k)
                {
                    info.ratios[j][k] = extra.ratios[j][k].apply(value);
                    sum += info.ratios[j][k];
                }
                if (std::fabs(sum) > 1e-10)
                    for (int k = 0; k != 3; ++k)
                        info.ratios[j][k] /= sum;
            }
            std::vector<visit_counts>&  cnt{ counts.insert({ (natural_32_bit)std::abs(sid), {} }).first->second };
            for (integer_32_bit k = 0; k != 3; ++k)
                cnt.push_back({
                    (natural_32_bit)std::round(info.counts[0] * info.ratios[0][k]),
                    (natural_32_bit)std::round(info.counts[1] * info.ratios[1][k])
                });
            std::reverse(cnt.begin(), cnt.end());
        }

    branching_node*  node{ root };
    while (true)
    {
        std::vector<visit_counts>&  cnt{ counts.insert({ node->get_location_id(), { { 0U, 0U } } }).first->second };

        branching_node* const  successor{ step_in_tree(node, cnt.back().choose_dir()) };
        if (successor == nullptr)
        {
            INVARIANT(node->is_pending());
            return node;
        }

        cnt.back().increment(node->successor_direction(successor));
        if (cnt.back().depleted() && cnt.size() > 1ULL)
            cnt.pop_back();

        node = successor;
    }
}


branching_node*  navigator_regression::step_in_tree(branching_node* const  node, bool const  desired_direction)
{
    INVARIANT(node != nullptr && !node->is_closed());

    branching_node*  successor = nullptr;

    branching_node* const  left = node->successor(false).pointer;
    branching_node* const  right = node->successor(true).pointer;

    bool const  can_go_left = left != nullptr && !left->is_closed();
    bool const  can_go_right = right != nullptr && !right->is_closed();
    bool const  can_go_desired_direction = (desired_direction == false && can_go_left) || (desired_direction == true && can_go_right);

    if (can_go_desired_direction)
        successor = desired_direction == false ? left : right;
    else if (!node->is_pending())
        successor = can_go_left ? left : right;

    return successor;
}


}
