#ifndef COM_EXECUTION_RESULTS_HPP_INCLUDED
#   define COM_EXECUTION_RESULTS_HPP_INCLUDED

#   include <com/data_type.hpp>
#   include <com/input.hpp>
#   include <com/target_termination.hpp>
#   include <com/execution_trace.hpp>
#   include <utility/math.hpp>
#   include <vector>
#   include <memory>

namespace  com {


struct  execution_results
{
    execution_results(target_termination  t, input_metadata_ptr  metadata);

    target_termination  get_termination() const { return m_termination; }
    target_termination&  get_termination() { return m_termination; }

    input_bytes_ptr  get_bytes() const { return m_bytes; }
    input_types_ptr  get_types() const { return m_types; }
    input_metadata_ptr  get_metadata() const { return m_metadata; }

    execution_trace_ptr  get_trace() const { return m_trace; }

private:
    target_termination  m_termination;
    input_bytes_ptr  m_bytes;
    input_types_ptr  m_types;
    input_metadata_ptr  m_metadata;
    execution_trace_ptr  m_trace;
};

using  execution_results_ptr = std::shared_ptr<execution_results>;


}

#endif
