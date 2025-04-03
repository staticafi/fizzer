#include <instrumentation/fuzz_target.hpp>
#include <utility/hash_combine.hpp>
#include <utility/assumptions.hpp>
#include <utility/invariants.hpp>
#include <cmath>
#include <instrumentation/data_record_id.hpp>
#include <instrumentation/target_termination.hpp>
#include <iomodels/models_map.hpp>

using namespace iomodels;

namespace instrumentation {

fuzz_target::fuzz_target():
      trace_length{0}
    , locations{}
    , config{}
    , stdin_model{ nullptr }
    , stdout_model{ nullptr }
    , shared_memory{}
{}


void fuzz_target::process_condition(
        location_id const id,
        bool const direction,
        branching_function_value_type value,
        bool const xor_like_branching_function,
        natural_8_bit const predicate
        )
{
    if (stdin_model->num_bytes_read() == 0)
        return;
        
    if (trace_length >= config.max_trace_length) {
        shared_memory.set_termination(target_termination::boundary_condition_violation);
        exit(0);
    }
    
    if (!shared_memory.can_accept_bytes(branching_coverage_info::flattened_size())) {
        shared_memory.set_termination(target_termination::medium_overflow);
        exit(0);
    }

    shared_memory << data_record_id::condition << id << direction << value << xor_like_branching_function << predicate;
    ++trace_length;
}

void fuzz_target::on_read(natural_8_bit* ptr, type_of_input_bits const type) {
    stdin_model->read(ptr, type, shared_memory);
}


void fuzz_target::on_write(natural_8_bit const*  ptr, type_of_input_bits const type) {
    stdout_model->write(ptr, type, shared_memory);
}


void fuzz_target::load_config() {
    config.load_target_config(shared_memory);
    stdin_model = get_stdin_models_map().at(config.stdin_model_name)(config.max_stdin_bytes);
    stdout_model = get_stdout_models_map().at(config.stdout_model_name)();
}

void fuzz_target::load_stdin() {
    stdin_model->load(shared_memory);
}

void fuzz_target::load_stdout() {
    stdout_model->load(shared_memory);
}


}