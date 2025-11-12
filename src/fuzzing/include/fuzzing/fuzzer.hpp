#ifndef FUZZING_FUZZER_HPP_INCLUDED
#   define FUZZING_FUZZER_HPP_INCLUDED

#   include <fuzzing/termination_info.hpp>
#   include <fuzzing/input_flow_analysis.hpp>
#   include <fuzzing/bitshare_analysis.hpp>
#   include <fuzzing/bitflip_analysis.hpp>
#   include <fuzzing/local_search_analysis.hpp>
#   include <fuzzing/test_suite_item.hpp>
#   include <fuzzing/basic_types.hpp>
#   include <fuzzing/strategy/search_strategy.hpp>
#   include <sala/program.hpp>
#   include <utility/math.hpp>
#   include <utility/std_pair_hash.hpp>
#   include <string>
#   include <unordered_set>
#   include <unordered_map>
#   include <deque>
#   include <chrono>
#   include <memory>
#   include <thread>
#   include <mutex>
#   include <limits>

namespace  fuzzing {


struct target_executor;


struct  fuzzer final
{
    enum struct TERMINATION_REASON
    {
        ALL_REACHABLE_BRANCHINGS_COVERED,
        FUZZING_STRATEGY_DEPLETED,
        TIME_BUDGET_DEPLETED,
        EXECUTIONS_BUDGET_DEPLETED
    };

    struct  performance_statistics
    {
        std::size_t  leaf_nodes_created{ 0 };
        std::size_t  leaf_nodes_destroyed{ 0 };
        std::size_t  nodes_created{ 0 };
        std::size_t  nodes_destroyed{ 0 };
        std::size_t  max_leaf_nodes{ 0 };
        std::size_t  max_input_width{ 0 };
        std::size_t  longest_branch{ 0 };
        std::size_t  crashes{ 0 };
        std::size_t  target_timeouts{ 0 };
        std::size_t  boundary_violations{ 0 };
        std::size_t  medium_overflows{ 0 };
        std::size_t  data_errors_in_medium{ 0 };
        std::size_t  coverage_failure_resets{ 0 };
    };

    fuzzer(
        termination_info const&  info,
        sala::Program const*  sala_program_ptr_,
        target_executor const*  tgt_exec,
        local_search_analysis::configuration const& local_search_config
        );
    ~fuzzer();

    sala::Program const* sala_program() const { return sala_program_ptr; }

    void  terminate();
    void  stop_all_analyzes();

    termination_info const& get_termination_info() const { return termination_props; }

    natural_32_bit  num_remaining_driver_executions() const { return termination_props.max_executions - get_performed_driver_executions(); }
    float_64_bit  num_remaining_seconds() const { return (float_64_bit)termination_props.max_seconds - get_elapsed_seconds(); }

    natural_32_bit  get_performed_driver_executions() const { return num_driver_executions; }
    float_64_bit  get_elapsed_seconds() const { return std::chrono::duration<float_64_bit>(time_point_current - time_point_start).count(); }

    std::unordered_set<location_id> const&  get_covered_branchings() const { return covered_branchings; }
    std::unordered_set<location_and_direction> const&  get_uncovered_branchings() const { return uncovered_branchings; }

    bool  round_begin(TERMINATION_REASON&  termination_reason, input_bytes&  bytes, input_types_ptr&  types, input_metadata_ptr&  metadata);
    bool  round_end(test_suite_item&  test, execution_results_ptr  results);

    void  enable_renderer(bool state);
    bool  is_renderer_enabled() const;
    void  render() const;

    input_flow_analysis::performance_statistics const&  get_input_flow_statistics() const { return input_flow_thread.get_statistics(); }
    bitshare_analysis::performance_statistics const&  get_bitshare_statistics() const { return bitshare.get_statistics(); }
    local_search_analysis::performance_statistics const&  get_local_search_statistics() const { return local_search.get_statistics(); }
    bitflip_analysis::performance_statistics  get_bitflip_statistics() const { return bitflip_analysis::performance_statistics{}; }
    performance_statistics const&  get_fuzzer_statistics() const { return statistics; }

private:

    enum STATE
    {
        STARTUP,
        BITSHARE,
        LOCAL_SEARCH,
    };

    struct  leaf_branching_construction_props
    {
        branching_node*  leaf{ nullptr };
        branching_node*  diverging_node{ nullptr };
        bool  any_location_discovered{ false };
        std::unordered_set<location_id>  covered_locations{};
        std::unordered_map<location_id, std::unordered_set<branching_node*> >  uncovered_locations{};
    };

    struct  input_flow_analysis_thread
    {
        input_flow_analysis_thread(sala::Program const*  sala_program_ptr, target_executor const* const  tgt_exec);

        bool  is_ready() const;
        bool  is_busy() const;
        bool  is_finished() const;
        bool  is_terminated() const;

        // The method below can be called only when: is_ready() == true 
        void  start(branching_node*  node_ptr, natural_32_bit  execution_id, float_64_bit  remaining_seconds);

        void  stop();

        // Two methods below can be called only when: is_ready() == true 
        branching_node*  get_node() const;
        std::unordered_set<branching_node*> const&  get_changed_nodes();

        // The method below can be called only when: is_finished() == true 
        void  apply_results(branching_node*  entry_node);

        // The method below can be called only when: is_terminated() == true || is_busy() == false
        input_flow_analysis::performance_statistics const&  get_statistics() const;

    private:

        enum STATE
        {
            READY = 0,
            STEADY = 1,
            WORKING = 2,
            FINISHED = 3,
            TERMINATED = 4
        };

        struct computation_request
        {
            input_flow_analysis::computation_io_data  data{};
            std::unordered_set<branching_node*>  changed_nodes{};
            branching_node*  last_node{ nullptr };
            natural_32_bit  execution_id{ 0U };
            float_64_bit  remaining_seconds{ 0.0 };
        };

        void worker_thread_procedure();

        STATE  state;
        computation_request  request;
        input_flow_analysis  input_flow;
        bool  worker_stop_flag;
        mutable std::mutex  mutex;
        std::thread  worker;
    };

    static std::string const&  get_analysis_name_from_state(STATE state);

    static void  update_close_flags_from(branching_node*  node);

    bool  generate_next_input(vecb&  stdin_bits, input_types_ptr&  types, input_metadata_ptr&  metadata, TERMINATION_REASON&  termination_reason);
    bool  process_execution_results(test_suite_item&  test, execution_results_ptr  results);

    void  do_cleanup();

    void  remove_leaf_branching_node(branching_node*  node);

    void  recording_interrupt();
    void  recording_resume();
    void  recording_send_taint_request(branching_node const*  node_ptr);
    void  recording_send_taint_response(branching_node const*  node_ptr);

    sala::Program const* sala_program_ptr;

    termination_info termination_props;

    natural_32_bit  num_branchings_to_cover;

    natural_32_bit  num_driver_executions;
    std::chrono::steady_clock::time_point  time_point_start;
    std::chrono::steady_clock::time_point  time_point_current;

    branching_node*  entry_branching;
    std::unordered_set<branching_node*>  leaf_branchings;

    std::unordered_set<location_id>  covered_branchings;
    std::unordered_set<location_and_direction>  uncovered_branchings;
    std::unordered_set<location_id>  branchings_to_crashes;

    search_strategy  strategy;

    std::unordered_set<branching_node*>  dead_nodes_buffer;

    input_flow_analysis_thread  input_flow_thread;

    STATE  state;
    bitshare_analysis  bitshare;
    local_search_analysis  local_search;

    enum struct  RENDER_STATE
    {
        DISABLED = 0,
        STARTED = 1,
        WORKING = 2,
        PAUSED = 3
    };
    mutable RENDER_STATE  render_state;
    mutable performance_statistics  statistics;
};


}

#endif
