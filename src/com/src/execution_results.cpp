#include <com/execution_results.hpp>

namespace com {


execution_results::execution_results(target_termination const  t, input_metadata_ptr const  metadata)
    : m_termination{ t }
    , m_bytes{ std::make_shared<input_bytes>() }
    , m_types{ std::make_shared<input_types>() }
    , m_metadata{ metadata }
    , m_trace{ std::make_shared<execution_trace>() }
{}


}
