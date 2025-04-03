#ifndef FUZZING_DUMP_NATIVE_HPP_INCLUDED
#   define FUZZING_DUMP_NATIVE_HPP_INCLUDED

#   include <fuzzing/test_suite_item.hpp>
#   include <iosfwd>

namespace  fuzzing {


void  save_execution_results(std::ostream&  ostr, execution_results const&  results, std::string const&  shift = "");
void  save_native_test(std::ostream&  ostr, test_suite_item const&  item);


}

#endif
