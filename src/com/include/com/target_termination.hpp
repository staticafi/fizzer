#ifndef COM_TARGET_TERMINATION_HPP_INCLUDED
#   define COM_TARGET_TERMINATION_HPP_INCLUDED

#   include <utility/basic_numeric_types.hpp>
#   include <string>

namespace com {


enum struct target_termination : natural_8_bit
{
    PENDING                         = 0, // The target is being executed.
    NORMAL                          = 1, // Execution of benchmark's code finished normally.
    CRASH                           = 2, // Benchmark's code crashed, e.g. division by zero, access outside allocated memory.
    TIMEOUT                         = 3, // The target program timed out
    BOUNDARY_CONDITION_VIOLATION    = 4, // Trace is too long, stack size reached maximum size, max amount of bytes were read from stdin, ...
    MEDIUM_OVERFLOW                 = 5, // The communication medium (e.g., shared memory) cannot accept more bytes.
    ERROR_IN_DATA                   = 6
};

static_assert(sizeof(target_termination) == 1);

inline natural_8_bit  to_termination_id(target_termination const  t) { return (natural_8_bit)t; }
target_termination  from_termination_id(natural_8_bit  id);

inline bool valid_termination(target_termination const  termination) { return termination <= target_termination::MEDIUM_OVERFLOW; }

std::string  to_string(target_termination  termination);


}

#endif
