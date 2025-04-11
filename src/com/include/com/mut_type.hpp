#ifndef COM_MUT_TYPE_HPP_INCLUDED
#   define COM_MUT_TYPE_HPP_INCLUDED

#   include <utility/basic_numeric_types.hpp>

namespace com {


enum struct  mut_type : natural_8_bit
{
    WITH_ARGS   = 0,    // int main(int, char*[])
    NO_ARGS     = 1,    // int main(void)
};

static_assert(sizeof(mut_type) == 1);

inline natural_8_bit  to_mut_id(mut_type const  type) { return (natural_8_bit)type; }
mut_type  from_mut_id(natural_8_bit  id);


}

#endif
