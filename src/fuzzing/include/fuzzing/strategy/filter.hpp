#ifndef FUZZING_STRATEGY_FILTER_HPP_INCLUDED
#   define FUZZING_STRATEGY_FILTER_HPP_INCLUDED

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


struct  branching_node;
struct  metric;


struct  filter
{
    virtual  ~filter() { delete next; }

    void  apply(std::vector<branching_node*> const&  input, metric&  metric, std::vector<branching_node*>&  output);
    filter*  after(filter* const  prev);

protected:
    virtual void  run(std::vector<branching_node*> const&  input, metric&  metric, std::vector<branching_node*>&  output) = 0;

private:
    filter*  next{ nullptr };
};


struct all_filter : public filter
{
private:
    void  run(std::vector<branching_node*> const&  input, metric&, std::vector<branching_node*>&  output) override;
};


struct signed_filter : public filter
{
    explicit  signed_filter(float_64_bit const  sign_) : filter{}, sign{ sign_ } {}

private:
    void  run(std::vector<branching_node*> const&  input, metric&  metric, std::vector<branching_node*>&  output) override;

    float_64_bit sign;
};


struct input_use_filter : public filter
{
private:
    void  run(std::vector<branching_node*> const&  input, metric&  metric, std::vector<branching_node*>&  output) override;

    static branching_node*  better(branching_node* const  left, branching_node* const right);
    static int  size_error(branching_node* const  node);
    static int  ideal_size(branching_node* const  node);
    static int  max_read_index(branching_node*  node);
};


std::unique_ptr<filter>  create_filter(FILTER_TYPE const  type);


}

#endif
