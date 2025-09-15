#ifndef TOOL_CPSEVAL_LOAD_TESTS_HPP_INCLUDED
#   define TOOL_CPSEVAL_LOAD_TESTS_HPP_INCLUDED

#   include <fuzzing/basic_types.hpp>
#   include <memory>
#   include <string>
#   include <vector>


struct test_case
{
    fuzzing::input_bytes bytes;
    fuzzing::input_types types;
    fuzzing::input_metadata metadata;
};

using test_case_ptr = std::shared_ptr<test_case>;


bool  load_tests(std::string const&  zip_path, std::string const&  dir_name, std::vector<test_case_ptr>&  out_tests);


#endif
