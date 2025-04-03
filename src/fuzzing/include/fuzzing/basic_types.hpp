#ifndef FUZZING_BASIC_TYPES_HPP_INCLUDED
#   define FUZZING_BASIC_TYPES_HPP_INCLUDED

#   include <com/input.hpp>
#   include <com/data_type.hpp>
#   include <com/execution_trace.hpp>
#   include <com/execution_results.hpp>
#   include <utility>

namespace  fuzzing {


using  location_id = com::location_id;
using  branching_value = com::branching_value;
using  atomic_predicate = com::atomic_predicate;
using  data_type = com::data_type;

using  input_bits = vecb;
using  input_bits_ptr = std::shared_ptr<input_bits>;;
using  input_bytes = com::input_bytes;
using  input_bytes_ptr = com::input_bytes_ptr;
using  input_types = com::input_types;
using  input_types_ptr = com::input_types_ptr;
using  input_metadata = com::input_metadata;
using  input_metadata_ptr = com::input_metadata_ptr;

using  trace_index_type = natural_32_bit;
using  trace_item = com::trace_item;
using  execution_trace = com::execution_trace;
using  execution_trace_ptr = com::execution_trace_ptr;
using  execution_results = com::execution_results;
using  execution_results_ptr = com::execution_results_ptr;

using  target_termination = com::target_termination;

using  location_and_direction = std::pair<location_id, bool>;

using  com::invalid_location_id;
using  com::equivalent;


}

#endif
