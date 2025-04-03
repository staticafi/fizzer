#include <com/execution_config.hpp>

namespace com {


std::string const  execution_config::possible_mut_names[2] = {
    "__fizzer_method_under_test",
    "__fizzer_method_under_test_with_params"
};


// bool configuration::operator==(configuration const&  other) const
// {
//     return
//         max_trace_length == other.max_trace_length &&
//         max_bytes == other.max_bytes &&
//         max_exec_megabytes == other.max_exec_megabytes &&
//         mut_name_index == other.mut_name_index;
// }

// std::size_t configuration::flattened_size() {
//     return
//         sizeof(max_trace_length) +
//         sizeof(max_bytes) +
//         sizeof(max_exec_megabytes) +
//         sizeof(mut_name_index);
// }


// bool configuration::save_to(connection::medium&  dst) const {
//     if (!dst.can_accept_bytes(flattened_size()))
//         return false;
//     dst << max_trace_length;
//     dst << max_bytes;
//     dst << max_exec_megabytes;
//     dst << mut_name_index;
//     return true;
// }

// bool configuration::load_from(connection::medium&  src) {
//     if (!src.can_deliver_bytes(flattened_size()))
//         return false;
//     src >> max_trace_length;
//     src >> max_bytes;
//     src >> max_exec_megabytes;
//     src >> mut_name_index;
//     return true;
// }


}




// void configuration::invalidate_shared_memory_size_cache() const {
//     m_shared_memory_size_cache.reset();
// }


// natural_32_bit configuration::required_shared_memory_size() const {
//     if (m_shared_memory_size_cache.has_value()) {
//         return m_shared_memory_size_cache.value();
//     }

//     std::size_t const  data_id_size = sizeof(data_record_id);
//     std::size_t const  termination_record_size = data_id_size + sizeof(target_termination);
//     std::size_t const  branching_record_size = data_id_size + trace_item::flattened_size();
//     std::size_t const  input_record_size = data_id_size + 1U + ;

//     natural_32_bit const  result = (natural_32_bit) (
//             flattened_size() +
//             termination_record_size +
//             branching_record_size * max_trace_length +
//             input_record_size * max_bytes
//             );

//     m_shared_memory_size_cache = result;

//     return result;
// }


