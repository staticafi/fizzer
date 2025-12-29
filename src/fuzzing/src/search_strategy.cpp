#include <fuzzing/search_strategy.hpp>

namespace  fuzzing {


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
