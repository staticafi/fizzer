#ifndef FUZZING_DUMP_TESTCOMP_HPP_INCLUDED
#   define FUZZING_DUMP_TESTCOMP_HPP_INCLUDED

#   include <fuzzing/test_suite_item.hpp>
#   include <iosfwd>

namespace  fuzzing {


void  save_testcomp_test(std::ostream&  ostr, test_suite_item const&  item);


}

#endif
