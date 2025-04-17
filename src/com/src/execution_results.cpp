#include <com/execution_results.hpp>

namespace com {


execution_results::execution_results(target_termination const  t, input_metadata_ptr const  metadata)
    : m_termination{ t }
    , m_bytes{ make_shared_wrapper<input_bytes>() }
    , m_types{ make_shared_wrapper<input_types>() }
    , m_metadata{ metadata }
    , m_trace{ make_shared_wrapper<execution_trace>() }
{}


}
