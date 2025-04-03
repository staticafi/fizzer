#ifndef INSTRUMENTATION_FUZZ_TARGET_HPP_INCLUDED
#   define INSTRUMENTATION_FUZZ_TARGET_HPP_INCLUDED

#   include <memory>
#   include <utility/basic_numeric_types.hpp>
#   include <vector>
#   include <unordered_set>
#   include <connection/shared_memory.hpp>
#   include <instrumentation/instrumentation_types.hpp>
#   include <connection/shared_memory.hpp>
#   include <iomodels/stdin_base.hpp>
#   include <iomodels/stdout_void.hpp>
#   include <iomodels/configuration.hpp>


namespace  instrumentation {

class fuzz_target {

    natural_32_bit trace_length;
    std::unordered_set<natural_32_bit> locations;
    iomodels::configuration config;
    iomodels::stdin_base_ptr stdin_model;
    iomodels::stdout_base_ptr stdout_model;
    connection::shared_memory shared_memory;

public:

    fuzz_target();

    void process_condition(
            location_id id,
            bool direction,
            branching_function_value_type value,
            bool xor_like_branching_function,
            natural_8_bit predicate
            );

    void on_read(natural_8_bit* ptr, type_of_input_bits type);
    void on_write(natural_8_bit const*  ptr, type_of_input_bits type);

    connection::shared_memory& get_shared_memory() { return shared_memory; }

    void load_config();
    void load_stdin();
    void load_stdout();

};

extern std::unique_ptr<fuzz_target> fizzer_target;

}

#endif