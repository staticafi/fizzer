#include <fuzzing/strategy/navigator_automaton.hpp>
#include <fuzzing/branching_node.hpp>
#include <utility/assumptions.hpp>
#include <utility/invariants.hpp>
#include <utility/timeprof.hpp>
#include <queue>
#include <limits>
#include <algorithm>

namespace  fuzzing {


navigator_automaton::navigator_automaton(std::vector<value_and_node> const&  values_and_nodes)
    : extrapolations{}
    , reachability{}
    , errors{}
    , constraints{}
    , target_counters{}
    , best_counters{}
{
    TMPROF_BLOCK();

    std::vector<edge_counters>  counters_vector;
    std::unordered_map<edge_type, std::vector<vec2> >  extrapolated_data;
    for (value_and_node const&  value_and_node : values_and_nodes)
    {
        std::unordered_set<edge_type>  reachable;
        counters_vector.push_back({});
        std::unordered_map<edge_type, natural_32_bit>&  counters{ counters_vector.back() };
        for (branching_node*  m = value_and_node.node, *n = m->get_predecessor(); n != nullptr; m = n, n = n->get_predecessor())
        {
            edge_type const  edge{ (n->successor_direction(m) ? 1 : -1) * (integer_32_bit)n->get_location_id() };
            reachability[edge].insert(reachable.begin(), reachable.end());
            reachable.insert(edge);
            ++counters.insert({ edge, 0U }).first->second;
        }
        for (auto const&  edge_and_count : counters)
            extrapolated_data[edge_and_count.first].push_back({ value_and_node.value, (float_64_bit)edge_and_count.second });
    }
    for (natural_64_bit  i{ 0ULL}; i != counters_vector.size(); ++i)
    {
        edge_counters const&  counters{ counters_vector.at(i) };
        if (counters.size() < reachability.size())
        {
            float_64_bit const  value{ values_and_nodes.at(i).value };
            for (auto const&  edge_and_edges: reachability)
                if (!counters.contains(edge_and_edges.first))
                    extrapolated_data[edge_and_edges.first].push_back({ value, 0.0 });
        }
    }
    for (auto const&  edge_and_data : extrapolated_data)
    {
        auto&  extrapolation{ extrapolations[edge_and_data.first] };
        extrapolation.build(edge_and_data.second);
        errors.insert({ edge_and_data.first, compute_error(extrapolation, edge_and_data.second) });
    }
    errors.insert({ 0, 0.0 });

    for (auto const&  edge_and_line : extrapolations)
        if (!edge_and_line.second.is_constant())
            reachability[edge_and_line.first].insert(edge_and_line.first);

    generate_constraints(counters_vector);
}


branching_node*  navigator_automaton::run(branching_node* const  root, float_64_bit const  value)
{
    TMPROF_BLOCK();

    struct  search_state
    {
        struct  actual_data
        {
            float_64_bit  error;
            branching_node*  parent;
            branching_node*  node;
            edge_counters  counters;
            std::unordered_set<edge_type> const*  reachable;
        };

        search_state(
                float_64_bit const  error,
                branching_node* const  parent,
                branching_node* const  node,
                edge_counters&&  counters,
                std::unordered_set<edge_type> const* const  reachable
                )
            : data_ptr{ std::make_shared<actual_data>(error, parent, node, edge_counters{}, reachable) }
        { data_ptr->counters.swap(counters); }

        float_64_bit  error() const { return data_ptr->error; }
        branching_node*  parent() const { return data_ptr->parent; }
        branching_node*  node() const { return data_ptr->node; }
        edge_counters const&  counters() const { return data_ptr->counters; }
        std::unordered_set<edge_type> const*  reachable() const { return data_ptr->reachable; }

        bool operator>(search_state const&  other) const { return error() > other.error(); }

    private:
        std::shared_ptr<actual_data>  data_ptr;
    };

    if (root->is_closed())
        return nullptr;

    for (auto const&  edge_and_line : extrapolations)
    {
        float_64_bit  raw_target_counter{ edge_and_line.second.apply(value) };
        //raw_target_counter -= std::sqrt(errors.at(edge_and_line.first));
        target_counters.insert({ edge_and_line.first, (natural_32_bit)std::max(0.0, std::round(raw_target_counter)) });
    }
    apply_constraints(target_counters);

    std::unordered_set<edge_type>  reachable_all{}, reachable_none{};
    for (auto const&  edge_and_edges : reachability)
        reachable_all.insert(edge_and_edges.first);

    float_64_bit  best_error{ std::numeric_limits<float_64_bit>::infinity() };
    branching_node*  best_node{ nullptr };
    std::priority_queue<search_state, std::vector<search_state>, std::greater<search_state> >  work_queue;
    work_queue.push({ error_initial(), root, root, {}, &reachable_all });
    do
    {
        search_state const  state{ work_queue.top() };
        work_queue.pop();

        if (state.node() == nullptr)
        {
            INVARIANT(state.parent() != nullptr && !state.parent()->is_closed() && state.parent()->has_pending_analysis());
            if (state.error() < best_error)
            {
                best_error = state.error();
                best_node = state.parent();
                best_counters = state.counters();
            }
            continue;
        }

        INVARIANT(!state.node()->is_closed());

        for (bool const  dir : { false, true })
        {
            branching_node* const  successor{ state.node()->successor(dir).pointer };
            if ((successor == nullptr && state.node()->has_pending_analysis()) || (successor != nullptr && !successor->is_closed()))
            {
                edge_type const  edge{ (dir ? 1 : -1) * (integer_32_bit)state.node()->get_location_id() };
                edge_counters  counters{ state.counters() };
                std::unordered_set<edge_type> const* reachable;
                if (state.reachable()->contains(edge))
                {
                    ++counters.insert({ edge, 0U }).first->second;
                    reachable = &reachability.at(edge);
                }
                else
                {
                    ++counters.insert({ 0, 0U }).first->second;
                    reachable = &reachable_none;
                }
                float_64_bit const  error{ error_common(counters, reachable) };
                work_queue.push({ error, state.node(), successor, std::move(counters), reachable });
            }
        }
    }
    while (!work_queue.empty());

    return best_node;
}


void  navigator_automaton::generate_constraints(std::vector<edge_counters>&  counters_vector)
{
    TMPROF_BLOCK();

    // WARNING: This code has high complexity!
    for (auto const&  item_a : extrapolations)
        for (auto const&  item_b : extrapolations)
            if (item_a.first != item_b.first && !item_a.second.is_constant() && !item_b.second.is_constant())
            {
                bool  all_satisfy{ true };
                for (auto&  counters : counters_vector)
                    if (counters.insert({ item_a.first, 0U }).first->second > counters.insert({ item_b.first, 0U }).first->second)
                    {
                        all_satisfy = false;
                        break;
                    }
                if (all_satisfy)
                    constraints.insert({ item_a.first, item_b.first });
            }
}


void  navigator_automaton::apply_constraints(edge_counters&  counters)
{
    TMPROF_BLOCK();

    // WARNING: This code has high complexity!
    for (natural_64_bit iter_counter = 0ULL; true; ++iter_counter)
    {
        TMPROF_BLOCK();

        // The algorithm should always terminate, since the 'constraints'
        // represent a transitive relation. The invariant below is just
        // a safety check (because I only sketched the proof - and all looks good).
        // The formula in invariant is also not proven to be sufficient upper bound,
        // but longer computation does not seem to be practically useful anyway.
        INVARIANT(iter_counter <= 2ULL * constraints.size() * constraints.size());

        bool  change{ false };
        for (auto const&  left_and_right : constraints)
        {
            auto&  left_counter{ counters.at(left_and_right.first) };
            auto&  right_counter{ counters.at(left_and_right.second) };
            if (left_counter > right_counter)
            {
                std::pair<float_64_bit, edge_type> const  left_error{ errors.at(left_and_right.first), left_and_right.first };
                std::pair<float_64_bit, edge_type> const  right_error{ errors.at(left_and_right.second), left_and_right.second };
                if (left_error < right_error)
                    right_counter = left_counter;
                else
                    left_counter = right_counter;
                change = true;
            }
        }
        if (change == false)
            break;
    }
}


float_64_bit  navigator_automaton::error_common(edge_counters const&  current_counters, std::unordered_set<edge_type> const* const  reachable)
{
    edge_counters  expected_counters{};
    for (auto const&  edge_and_count : target_counters)
        if (reachable->contains(edge_and_count.first))
            expected_counters[edge_and_count.first] = edge_and_count.second;
    for (auto const&  left_and_right : constraints)
    {
        auto const  it_left{ expected_counters.find(left_and_right.first) };
        auto const  it_right{ expected_counters.find(left_and_right.second) };
        if (it_left != expected_counters.end() && it_right == expected_counters.end())
        {
            auto const  it_curr{ current_counters.find(left_and_right.second) };
            if (it_curr == current_counters.end())
                it_left->second = 0U;
            else if (it_left->second > it_curr->second)
                it_left->second = it_curr->second;
        }
    }

    float_64_bit  error{ 0.0 };
    for (auto const&  edge_and_count : current_counters)
    {
        auto const  it_and_state{ expected_counters.insert(edge_and_count) };
        if (it_and_state.second == false && it_and_state.first->second < edge_and_count.second)
            error += error_function(edge_and_count.second, it_and_state.first->second);
    }
    for (auto const&  edge_and_count : target_counters)
        expected_counters.insert({ edge_and_count.first, 0U });
    for (auto const&  edge_and_count : expected_counters)
    {
        auto const  it{ target_counters.find(edge_and_count.first) };
        error += error_function(edge_and_count.second, it == target_counters.end() ? 0U : it->second);
    }
    return error;
}


float_64_bit  navigator_automaton::error_initial()
{
    float_64_bit  error{ 0.0 };
    for (auto const&  edge_and_counter : target_counters)
        error += error_function(0U, edge_and_counter.second);
    return error;
}


float_64_bit  navigator_automaton::error_function(natural_32_bit const  current_count, natural_32_bit const  target_count)
{
    float_64_bit  dist;
    if (target_count == 0U)
        dist = (float_64_bit)current_count;
    else
        dist = std::fabs(1.0 - (float_64_bit)current_count / (float_64_bit)target_count);
    dist += 0.5;
    return dist * dist - 0.25;
}


}


// Here is the proof sketch of termination of apply_constraints for any
// set of constraints produced by generate_constraints. That is done
// for an equivalent Python implementation.
//
// # This function generates constraints:
// # Let us have a list L of tuples, each of n elements, which are all natural numbers.
// # The function bar below accepts L and produces a set C of all pairs (a,b),
// # where 0<=a,b<n, are different indices to the tuples, such that for each tuple T from C we
// # have T[a]<=T[b].
// def bar(L):
//     print(f"L={L}")
//     n = len(L[0])
//     C = set()
//     for a in range(n):
//         for b in range(n):
//             if a != b:
//                 if all(T[a] <= T[b] for T in L):
//                     C.add((a,b))
//     print(f"C={C}")
//     return C
// # The resulting set C may comprise cycles. But it always
// # represents a transitive relation. A cycle can be present
// # only if we have all(T[a] == T[b] for T in L). The opposite
// # cycle will thus be present in C as well.
// #
// # This function applies constraints C to a given counters V:
// # Let us consider Python function foo(C,V), defined below, where the C is a list of pairs (a,b),
// # where a,b are distinct valid indices to the other parameter V, which is a list of natural numbers.
// def foo(C, V):
//     i = 0
//     while True:
//         i += 1
//         print(f"{i}. V={V}")
//         change = False
//         for a,b in C:
//             if V[a] > V[b]:
//                 if a < b:
//                     print(f"  ({a},{b}): {V[a]} > {V[b]} and {a} < {b} -> V[{b}] = V[{a}]")
//                     V[b] = V[a]
//                 else:
//                     print(f"  ({a},{b}): {V[a]} > {V[b]} and {a} >= {b} -> V[{a}] = V[{b}]")
//                     V[a] = V[b]
//                 change = True
//                 print(f"  V={V}")
//         if change is False:
//             print("Done.")
//             return
// # This input leads to foo cycling forever:
// # foo([(0,2), (2,1)], [3, 2, 1])
// # Observe tht C does not even contain a cycle.
// # But that set C cannot be produced from bar(L) for any L,
// # since the set C from bar must be transitive. So, it must also
// # comprise the element (0,1). And for that input foo terminates:
// foo(bar([(0, 2, 1)]), [3, 2, 1])
// # or equally foo([(0,1), (0,2), (2,1)], [3, 2, 1])
// # 
// # So, does the transitivity of C guarantees the termination of foo?
// # Here is a proof sketch of that it does:
// $ Let us consider a graph where nodes correspond
// # to elements of list V. We position nodes in 
// # line according to their index in V from left to
// # right. So, for V=[3,2,1] above we get nodes: 
// #     (0)        (1)        (2)
// # where (0) correspond to the first element 3 in V,
// # (1) to 2, and (2) to the last element 1. The transitive
// # relation C forms oriented edges; (a,b) in C forms an
// # arrow from node (a) to node (b). So, for the set
// # C=[(0,1), (0,2), (2,1)] above we get:
// #      -----------------------
// #      |                     V
// #     (0)        (1)<-------(2)
// #      |          ^
// #      ------------
// # From the code of foo we can observe, that if (a,b)
// # is an edge s.t. V[a]>V[b], then the update of V is
// # always done for that node from (a),(b) which is more
// # to the right in the graph. Indeed, if a<b, then we
// # update (b) (which is on the right), and (a) otherwise
// # (which is on the right then). Therefore, updates in
// # V always flow in the graph from left to right along
// # the edges regardless of their orientation. Let us consider
// # a component in the graph (we ignore orientation of
// # edges for building a component). A node is called
// # minimum of the component, if there is no edge (ignoring
// # the orientation again) from that node to any node
// # of the component lying on the left of the node.
// # Clearly, the node (0) is the only minimum in the
// # only component spanning the entire graph. If a
// # component has a single minimum, then Values in V at
// # indices of corresponding nodes cannot oscillate; they must
// # stabilize. That is because the updates can go from
// # a single source only to the right and due to the
// # transitivity of C that value gets (via transitive
// # edges) to all nodes of the component on the right.
// # There is only one case, when a component can have more
// # than one minimum:
// #                    ----------------------  --------------------- --------- ...      ... ------
// #                    |                     V |                   V |                           V
// # ...    (x)        (y)        ( )         ( )        ( )        ( )  ...                 ... (z)
// #         |                    ^ |                    ^ |                                      ^
// #         ---------------------- ---------------------- ---- ...                      ... ------
// # So, there are two different paths from minima (x),(y)
// # via edges pointing to the right (for other direction
// # we do not get component with two minima) up to a joint
// # node (z). Note that (z) may actually also be a cycle
// # in the component, but that does not change the following
// # reasoning (because if (z) does not oscillate, then the
// # cycle will eventually stabilize too). The value V[z]
// # cannot oscillate, because it obtains the maximum value
// # from both paths (again via the transitive edges).
// # In summary, foo cannot oscillate forever for any input
// # C computed by bar and for any V.

