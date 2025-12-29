#ifndef FUZZING_STRATEGY_FILTER_HPP_INCLUDED
#   define FUZZING_STRATEGY_FILTER_HPP_INCLUDED

#   include <fuzzing/strategy/value_and_node.hpp>
#   include <utility/basic_numeric_types.hpp>
#   include <string>
#   include <vector>
#   include <memory>

namespace  fuzzing {


enum struct  FILTER_TYPE : std::uint32_t
{
    ALL         = 0U,
    WARM        = 1U,
    COLD        = 2U,
    INPUT_USE   = 3U,
    INPUT_WARM  = 4U,
    INPUT_COLD  = 5U,
    NUM_FILTER_TYPES
};


std::string  to_string(FILTER_TYPE const  type);


struct  filter
{
    explicit  filter(FILTER_TYPE const  type_) : next{ nullptr}, filter_type{ type_ } {}
    virtual  ~filter() { delete next; }

    void  apply(std::vector<value_and_node> const&  input, std::vector<value_and_node>&  output);
    filter*  after(filter* const  prev);
    FILTER_TYPE  type() const { return filter_type; }

protected:
    virtual void  run(std::vector<value_and_node> const&  input, std::vector<value_and_node>&  output) = 0;

private:
    filter*  next;
    FILTER_TYPE  filter_type;
};


struct all_filter : public filter
{
    explicit  all_filter(FILTER_TYPE const  type) : filter{ type } {}
private:
    void  run(std::vector<value_and_node> const&  input, std::vector<value_and_node>&  output) override;
};


struct signed_filter : public filter
{
    explicit  signed_filter(FILTER_TYPE const  type, float_64_bit const  sign_) : filter{ type }, sign{ sign_ } {}
private:
    void  run(std::vector<value_and_node> const&  input, std::vector<value_and_node>&  output) override;

    float_64_bit sign;
};


struct input_use_filter : public filter
{
    explicit  input_use_filter(FILTER_TYPE const  type) : filter{ type } {}
private:
    void  run(std::vector<value_and_node> const&  input, std::vector<value_and_node>&  output) override;

    static value_and_node const&  better(value_and_node const&  left, value_and_node const&  right);
    static int  size_error(branching_node* const  node);
    static int  ideal_size(branching_node* const  node);
    static int  max_read_index(branching_node*  node);
};


std::unique_ptr<filter>  create_filter(FILTER_TYPE const  type);


}

#endif
