#include <com/target_termination.hpp>
#include <utility/invariants.hpp>

namespace com {


target_termination  from_termination_id(natural_8_bit const  id)
{
    switch (id)
    {
        case 0U: return target_termination::PENDING;
        case 1U: return target_termination::NORMAL;
        case 2U: return target_termination::CRASH;
        case 3U: return target_termination::TIMEOUT;
        case 4U: return target_termination::BOUNDARY_CONDITION_VIOLATION;
        case 5U: return target_termination::MEDIUM_OVERFLOW;
        case 6U: return target_termination::ERROR_IN_DATA;
        default: { UNREACHABLE(); return target_termination::ERROR_IN_DATA; }
    }
}


std::string  to_string(target_termination  termination)
{
    switch (termination)
    {
        case target_termination::PENDING: return "PENDING";
        case target_termination::NORMAL: return "NORMAL";
        case target_termination::CRASH: return "CRASH";
        case target_termination::TIMEOUT: return "TIMEOUT";
        case target_termination::BOUNDARY_CONDITION_VIOLATION: return "BOUNDARY_CONDITION_VIOLATION";
        case target_termination::MEDIUM_OVERFLOW: return "MEDIUM_OVERFLOW";
        case target_termination::ERROR_IN_DATA: return "ERROR_IN_DATA";
        default: { UNREACHABLE(); return ""; }
    }

}


}
