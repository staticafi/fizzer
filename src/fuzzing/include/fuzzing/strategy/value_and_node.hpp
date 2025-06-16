#ifndef FUZZING_STRATEGY_VALUE_AND_NODE_HPP_INCLUDED
#   define FUZZING_STRATEGY_VALUE_AND_NODE_HPP_INCLUDED

#   include <utility/basic_numeric_types.hpp>

namespace  fuzzing {


struct  branching_node;


struct  value_and_node
{
    value_and_node() : value_and_node(0.0, nullptr) {}
    value_and_node(float_64_bit const  value_, branching_node* const  node_) : value{ value_ }, node{ node_ } {}
    bool  operator==(value_and_node const&  other) const { return value == other.value; }
    bool  operator<(value_and_node const&  other) const { return value < other.value; }
    bool  valid() const { return node != nullptr; }
    float_64_bit  value;
    branching_node*  node;
};


}

#endif
