#include <fuzzing/dump_testcomp.hpp>
#include <utility/math.hpp>
#include <iostream>
#include <fstream>
#include <iomanip>
#include <chrono>
#if COMPILER() == COMPILER_VC()
#   pragma warning(disable:4996) // warning C4996: 'localtime': This function or variable may be unsafe.
#endif


namespace fuzzing {


static void  save_testcomp_test_inputs(std::ostream&  ostr, test_suite_item const&  item) {
    natural_32_bit  offset = 0;
    for (data_type const  input_chunk_type: *item.results->get_types()) {
        ostr << "  <input";
        if (is_known_type(input_chunk_type))
            ostr << " type=\"" << to_c_type_string(input_chunk_type) << '\"';
        ostr << '>';
        save_value(ostr, input_chunk_type, &item.results->get_bytes()->at(offset));
        ostr << "</input>\n";
        offset += num_bytes(input_chunk_type);
    }
}


void  save_testcomp_test(std::ostream&  ostr, test_suite_item const&  item) {
    ostr << "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n"
            "<!DOCTYPE testcase PUBLIC \"+//IDN sosy-lab.org//DTD test-format testcase "
                "1.1//EN\" \"https://sosy-lab.org/test-format/testcase-1.1.dtd\">\n"
            "<testcase>\n";
    save_testcomp_test_inputs(ostr, item);
    ostr << "</testcase>";
}


}