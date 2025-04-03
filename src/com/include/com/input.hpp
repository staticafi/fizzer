#ifndef COM_INPUT_HPP_INCLUDED
#   define COM_INPUT_HPP_INCLUDED

#   include <com/data_type.hpp>
#   include <utility/math.hpp>
#   include <vector>
#   include <memory>

namespace  com {


using  input_bytes = vecu8;
using  input_bytes_ptr = std::shared_ptr<input_bytes>;
using  input_types = std::vector<data_type>;
using  input_types_ptr = std::shared_ptr<input_types>;
using  input_metadata = vecu8;
using  input_metadata_ptr = std::shared_ptr<input_metadata>;


}

#endif
