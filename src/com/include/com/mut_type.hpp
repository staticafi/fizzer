#ifndef COM_MUT_TYPE_HPP_INCLUDED
#   define COM_MUT_TYPE_HPP_INCLUDED

#   include <utility/basic_numeric_types.hpp>

namespace com {


enum struct  mut_type : natural_8_bit
{
    RET_Y_ARGS_Y    = 0,    // int main(int, char*[])
    RET_Y_ARGS_N    = 1,    // int main(void)
    RET_N_ARGS_Y    = 2,    // void main(int, char*[])
    RET_N_ARGS_N    = 3,    // void main(void)
};

static_assert(sizeof(mut_type) == 1);

inline natural_8_bit  to_mut_id(mut_type const  type) { return (natural_8_bit)type; }
mut_type  from_mut_id(natural_8_bit  id);


}

#endif
