#ifndef FUZZING_PROGRESS_RECORDER_HPP_INCLUDED
#   define FUZZING_PROGRESS_RECORDER_HPP_INCLUDED

#   include <fuzzing/branching_node.hpp>
#   include <fuzzing/test_suite_item.hpp>
#   include <utility/basic_numeric_types.hpp>
#   include <unordered_set>
#   include <string>
#   include <filesystem>
#   include <memory>
#   include <iosfwd>

namespace  fuzzing {


struct  navigator_automaton;
struct  value_and_node;


struct  progress_recorder
{
    enum struct START
    {
        NONE    = 0,
        REGULAR = 1,
        RESUMED = 2
    };

    enum struct STOP
    {
        INSTANT     = 0,
        EARLY       = 1,
        REGULAR     = 2,
        INTERRUPTED = 3,
        FAILED      = 4
    };

    static progress_recorder& instance();

    void  start(std::filesystem::path const&  path_to_target_, std::filesystem::path const&  output_dir_);
    void  stop();

    bool  is_started() const { return started; }

    void  on_strategy_none();
    void  on_strategy_automaton(
        std::string const&  metric_,
        std::string const&  filter_,
        std::vector<value_and_node> const&  values_and_nodes_,
        location_id  target_id_,
        branching_node const*  best_node_,
        bool  sensitive_,
        float_64_bit  value_,
        navigator_automaton const&  automaton_
        );

    void  on_bitshare_start(branching_node const*  node_ptr, START attribute);
    void  on_bitshare_stop(STOP  attribute);

    void  on_local_search_start(branching_node const*  node_ptr, START attribute);
    void  on_local_search_stop(STOP  attribute);

    void  on_bitflip_start(branching_node const*  node_ptr, START attribute);
    void  on_bitflip_stop(STOP  attribute);

    void  on_taint_request_start(branching_node const*  node_ptr, START attribute);
    void  on_taint_request_stop(STOP  attribute);

    void  on_taint_response_start(branching_node const*  node_ptr, START attribute);
    void  on_taint_response_stop(STOP  attribute);

    void  on_execution_results_available(test_suite_item const&  item, branching_node const*  leaf, std::string const&  progress_message = "");

    void  on_post_node_closed(branching_node const*  node);

private:

    enum struct STRATEGY
    {
        AUTOMATON = 1
    };
    static std::string  strategy_name(STRATEGY s);

    struct  strategy_common_info
    {
        strategy_common_info(
            std::string const&  metric_,
            std::string const&  filter_,
            std::vector<value_and_node> const&  values_and_nodes_,
            location_id  target_id_,
            branching_node const*  best_node_,
            bool  sensitive_,
            float_64_bit  value_
            );
        virtual ~strategy_common_info() = default;
        virtual STRATEGY  type() const = 0;
        virtual bool  save_info(std::ostream&  ostr) const { return false; }
        void  save(std::string const&  output_dir) const;
        std::string  metric;
        std::string  filter;
        std::vector<value_and_node>  values_and_nodes;
        location_id  target_id;
        location_id  best_node_id;
        branching_node::guid_type  best_node_guid;
        bool  sensitive;
        float_64_bit  value;
    };

    struct  strategy_automaton : public strategy_common_info
    {
        strategy_automaton(
            std::string const&  metric_,
            std::string const&  filter_,
            std::vector<value_and_node> const&  values_and_nodes_,
            location_id const  target_id_,
            branching_node const* const  best_node_,
            bool  sensitive_,
            float_64_bit  value_,
            navigator_automaton const&  automaton_
            );
        STRATEGY  type() const override { return STRATEGY::AUTOMATON; }
        bool  save_info(std::ostream&  ostr) const override;
    private:
        struct  automaton_info;
        std::shared_ptr<automaton_info>  info;
    };

    enum struct ANALYSIS
    {
        STARTUP         = 0,
        BITSHARE        = 1,
        LOCAL_SEARCH    = 2,
        BITFLIP         = 3,
        TAINT_REQUEST   = 4,
        TAINT_RESPONSE  = 5,
    };
    static std::string  analysis_name(ANALYSIS a);

    struct  analysis_common_info
    {
        virtual ~analysis_common_info() = default;
        virtual natural_32_bit  get_num_coverage_failure_resets() const { return node->get_num_coverage_failure_resets(); }
        virtual void  save_info(std::ostream&  ostr) const {}
        void  save() const;

        branching_node const*  node{ nullptr };
        std::string  analysis_dir{};
        START  start_type{ START::NONE };
        STOP  stop_type{ STOP::REGULAR };
        std::shared_ptr<strategy_common_info>  strategy{ nullptr };
    };

    struct  bitshare_progress_info : public analysis_common_info
    {
        void  save_info(std::ostream&  ostr) const override;
    };

    struct  local_search_progress_info : public analysis_common_info
    {
        void  save_info(std::ostream&  ostr) const override;
    };

    struct  bitflip_progress_info : public analysis_common_info
    {
        void  save_info(std::ostream&  ostr) const override;
    };

    struct  taint_request_progress_info : public analysis_common_info
    {
        void  save_info(std::ostream&  ostr) const override;
    };

    struct  taint_response_progress_info : public analysis_common_info
    {
        void  save_info(std::ostream&  ostr) const override;
    };

    struct  inter_analyses_data
    {
        void  clear() { *this = {}; }
        void  save();
        std::string  last_analysis_dir{};
        std::unordered_set<branching_node::guid_type>  closed_node_guids{};
    };

    progress_recorder();

    progress_recorder(progress_recorder const&) = delete;
    progress_recorder(progress_recorder&&) = delete;
    progress_recorder& operator=(progress_recorder const&) const = delete;
    progress_recorder& operator=(progress_recorder&&) const = delete;

    void  on_analysis_start(ANALYSIS analysis_, analysis_common_info&  info, branching_node const*  node_ptr);
    void  on_analysis_stop();

    bool  started;

    std::string  output_dir;
    std::string  program_name;

    ANALYSIS  analysis;
    bitshare_progress_info  bitshare;
    local_search_progress_info  local_search;
    bitflip_progress_info  bitflip;
    taint_request_progress_info  taint_request;
    taint_response_progress_info  taint_response;
    natural_32_bit  counter_analysis;
    natural_32_bit  counter_results;
    std::shared_ptr<strategy_common_info>  strategy;
    inter_analyses_data  inter_analyses;
};


inline progress_recorder&  recorder() { return progress_recorder::instance(); }


}

#endif
