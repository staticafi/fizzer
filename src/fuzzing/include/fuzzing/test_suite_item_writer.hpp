#ifndef FUZZING_TEST_SUITE_ITEM_WRITER_HPP_INCLUDED
#   define FUZZING_TEST_SUITE_ITEM_WRITER_HPP_INCLUDED

#   include <fuzzing/test_suite_item.hpp>
#   include <utility/basic_numeric_types.hpp>
#   include <string>
#   include <filesystem>

namespace  fuzzing {


struct  test_suite_item_writer
{
    test_suite_item_writer(
            std::filesystem::path const&  output_dir_,
            std::string const&  target_name,
            std::string const&  program_version,
            bool const  use_native_test_type_
            );
    void  operator()(test_suite_item const&  test);

private:

    bool  use_native_test_type;
    natural_32_bit  test_counter;
    std::filesystem::path  output_dir;
    std::string  test_name_prefix;
    std::string  test_name_suffix;
};


}

#endif
