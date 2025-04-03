#ifndef COM_EXECUTION_CONFIG_HPP_INCLUDED
#   define COM_EXECUTION_CONFIG_HPP_INCLUDED

#   include <utility/basic_numeric_types.hpp>
#   include <string>

namespace com {


struct  execution_config
{
    std::string const& mut() const { return possible_mut_names[mut_name_index]; }

    static std::size_t flattened_size();

    natural_32_bit  max_trace_length { 10000 };
    natural_16_bit  max_exec_megabytes { 1024 };
    natural_8_bit  mut_name_index{ 0U }; // An index to possible_mut_names

private:
    static std::string const  possible_mut_names[2];
};


}

#endif
