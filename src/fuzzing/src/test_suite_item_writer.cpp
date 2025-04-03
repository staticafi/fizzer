#include <fuzzing/test_suite_item_writer.hpp>
#include <fuzzing/dump_native.hpp>
#include <fuzzing/dump_testcomp.hpp>
#include <iostream>
#include <fstream>

namespace  fuzzing {


test_suite_item_writer::test_suite_item_writer(
        std::filesystem::path const&  output_dir_,
        std::string const&  target_name,
        std::string const&  program_version,
        bool const  use_native_test_type_
        )
    : use_native_test_type{ use_native_test_type_ }
    , test_counter{ 0U }
    , output_dir{ use_native_test_type ? output_dir_ : output_dir_ / "test-suite" }
    , test_name_prefix{ target_name + "_test_" }
    , test_name_suffix{ use_native_test_type ? ".json" : ".xml" }
{}


void  test_suite_item_writer::operator()(fuzzing::test_suite_item const&  test)
{
    ++test_counter;
    std::filesystem::path const  test_file_path = output_dir / (test_name_prefix + std::to_string(test_counter) + test_name_suffix);
    std::ofstream  ostr(test_file_path.c_str(), std::ios::binary);
    if (use_native_test_type)
        save_native_test(ostr, test);
    else
        save_testcomp_test(ostr, test);
}


}
