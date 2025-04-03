#ifndef FUZZING_TEST_SUITE_ITEM_HPP_INCLUDED
#   define FUZZING_TEST_SUITE_ITEM_HPP_INCLUDED

#   include <fuzzing/basic_types.hpp>
#   include <vector>
#   include <string>
#   include <memory>

namespace  fuzzing {


struct  test_suite_item
{
    execution_results_ptr  results{ nullptr };
    bool  any_location_discovered{ false };
    std::vector<location_id>  covered_locations{};
    std::string  analysis_name{};
};

using test_suite_item_ptr = std::shared_ptr<test_suite_item>;


}

#endif
