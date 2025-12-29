#include <fuzzing/progress_recorder.hpp>
#include <fuzzing/basic_types.hpp>
#include <utility/assumptions.hpp>
#include <utility/invariants.hpp>
#include <utility/timeprof.hpp>
#include <vector>
#include <algorithm>
#include <iostream>
#include <fstream>
#include <iomanip>


static bool  copy_file(
        std::filesystem::path const&  input_dir,
        std::string const&  src_file_name,
        std::string const&  dst_file_name,
        std::filesystem::path const&  output_dir,
        bool const  throw_on_failure = true
        )
{
    if (!std::filesystem::is_regular_file(input_dir / src_file_name))
    {
        if (throw_on_failure)
            throw std::runtime_error(
                        "Cannot copy file '" + (input_dir / src_file_name).string() +
                        "' to file '" + (output_dir / dst_file_name).string() + "'."
                        );
        return false;
    }
    std::filesystem::copy_file(input_dir / src_file_name, output_dir / dst_file_name);
    return true;
}


namespace fuzzing {


progress_recorder& progress_recorder::instance()
{
    static progress_recorder rec;
    return rec;
}


progress_recorder::progress_recorder()
    : started{ false }

    , output_dir{}
    , program_name{}

    , analysis{ ANALYSIS::STARTUP }
    , bitshare{}
    , local_search{}
    , bitflip{}
    , taint_request{}
    , taint_response{}
    , counter_analysis{ 1 }
    , counter_results{ 0 }

    , strategy{}
{}


void  progress_recorder::start(std::filesystem::path const&  path_to_target_, std::filesystem::path const&  output_dir_)
{
    ASSUMPTION(!is_started());

    output_dir = output_dir_ / "progress_recording";
    std::filesystem::remove_all(output_dir);
    std::filesystem::create_directories(output_dir);
    if (!std::filesystem::is_directory(output_dir))
        throw std::runtime_error("Cannot create directory: " + output_dir);

    std::filesystem::path const  input_dir{ path_to_target_.parent_path() };
    std::string const  executable_name{ path_to_target_.filename().string() };

    program_name = executable_name.substr(0, executable_name.find("_target"));

    copy_file(input_dir, program_name + ".c", "source.c", output_dir);
    copy_file(input_dir, program_name + "_instrumented.ll", "source.ll", output_dir);
    copy_file(input_dir, program_name + "_instrumented_dbg_cond_map.json", "cond_map.json", output_dir);

    started = true;

    analysis = ANALYSIS::STARTUP;
    bitshare = {};
    local_search = {};
    bitflip = {};
    taint_request = {};
    taint_response = {};
    counter_analysis = 1;
    counter_results = 0;

    strategy.clear();
}


void  progress_recorder::stop()
{
    if (!is_started())
        return;

    std::filesystem::path const  input_dir{ std::filesystem::path(output_dir).parent_path() };

    copy_file(input_dir, program_name + "_config.json", "config.json", output_dir);
    copy_file(input_dir, program_name + "_outcomes.json", "outcomes.json", output_dir);

    for (natural_32_bit  i = 1U; true; ++i)
        if (!copy_file(input_dir, program_name + "_test_" + std::to_string(i) + ".json",
                       "test_" + std::to_string(i) + ".json", output_dir, false))
            break;

    if (std::filesystem::is_directory(input_dir / "test-suite"))
        for (natural_32_bit  i = 1U; true; ++i)
            if (!copy_file(input_dir / "test-suite", program_name + "_test_" + std::to_string(i) + ".xml",
                        "test_" + std::to_string(i) + ".xml", output_dir, false))
                break;

    started = false;

    output_dir.clear();
    program_name.clear();
 
    analysis = ANALYSIS::STARTUP;
    bitshare = {};
    local_search = {};
    bitflip = {};
    taint_request = {};
    taint_response = {};
    counter_analysis = 1;
    counter_results = 0;

    strategy.clear();
}


void  progress_recorder::on_bitshare_start(branching_node const* const  node_ptr, START const  attribute)
{
    if (!is_started())
        return;

    bitshare.start_type = attribute;
    on_analysis_start(ANALYSIS::BITSHARE, bitshare, node_ptr);
}


void  progress_recorder::on_bitshare_stop(STOP const  attribute)
{
    if (!is_started())
        return;
    if (bitshare.start_type == START::NONE)
        return;
    ASSUMPTION(analysis == ANALYSIS::BITSHARE);

    bitshare.stop_type = attribute;
    bitshare.save();
    on_analysis_stop();
}


void  progress_recorder::on_local_search_start(branching_node const* const  node_ptr, START const  attribute)
{
    if (!is_started())
        return;

    local_search.start_type = attribute;
    on_analysis_start(ANALYSIS::LOCAL_SEARCH, local_search, node_ptr);
}


void  progress_recorder::on_local_search_stop(STOP const  attribute)
{
    if (!is_started())
        return;
    if (local_search.start_type == START::NONE)
        return;
    ASSUMPTION(analysis == ANALYSIS::LOCAL_SEARCH);

    local_search.stop_type = attribute;
    local_search.save();
    on_analysis_stop();
}


void  progress_recorder::on_bitflip_start(branching_node const* const  node_ptr, START const  attribute)
{
    if (!is_started())
        return;

    bitflip.start_type = attribute;
    on_analysis_start(ANALYSIS::BITFLIP, bitflip, node_ptr);
}


void  progress_recorder::on_bitflip_stop(STOP const  attribute)
{
    if (!is_started())
        return;
    if (bitflip.start_type == START::NONE)
        return;
    ASSUMPTION(analysis == ANALYSIS::BITFLIP);

    bitflip.stop_type = attribute;
    bitflip.save();
    on_analysis_stop();
}


void  progress_recorder::on_taint_request_start(branching_node const* const  node_ptr, START const  attribute)
{
    if (!is_started())
        return;

    taint_request.start_type = attribute;
    on_analysis_start(ANALYSIS::TAINT_REQUEST, taint_request, node_ptr);
}


void  progress_recorder::on_taint_request_stop(STOP const  attribute)
{
    if (!is_started())
        return;
    if (taint_request.start_type == START::NONE)
        return;
    ASSUMPTION(analysis == ANALYSIS::TAINT_REQUEST);

    taint_request.stop_type = attribute;
    taint_request.save();
    on_analysis_stop();
}


void  progress_recorder::on_taint_response_start(branching_node const* const  node_ptr, START const  attribute)
{
    if (!is_started())
        return;

    taint_response.start_type = attribute;
    on_analysis_start(ANALYSIS::TAINT_RESPONSE, taint_response, node_ptr);
}


void  progress_recorder::on_taint_response_stop(STOP const  attribute)
{
    if (!is_started())
        return;
    if (taint_response.start_type == START::NONE)
        return;
    ASSUMPTION(analysis == ANALYSIS::TAINT_RESPONSE);

    taint_response.stop_type = attribute;
    taint_response.save();
    on_analysis_stop();
}


void  progress_recorder::on_execution_results_available(
        test_suite_item const&  item,
        branching_node const* const  leaf,
        std::string const&  progress_message
        )
{
    if (!is_started())
        return;

    TMPROF_BLOCK();

    std::filesystem::path const  record_dir{
            std::filesystem::path(output_dir) / (std::to_string(counter_analysis) + '_' + analysis_name(analysis))
            };
    std::filesystem::create_directories(record_dir);
    if (!std::filesystem::is_directory(record_dir))
        throw std::runtime_error("Cannot create directory: " + record_dir.string());

    std::filesystem::path const  record_pathname = record_dir / (std::to_string(counter_results) + ".json");
    auto  ostr_ptr{ std::make_unique<std::ofstream>(record_pathname.c_str(), std::ios::binary) };
    if (!ostr_ptr->is_open())
        throw std::runtime_error("Cannot open file for writing: " + record_pathname.string());

    std::ofstream&  ostr{ *ostr_ptr }; 

    std::string const  shift = "    ";

    ostr
        << "{\n"
        << shift << "\"any_location_discovered\": " << (item.any_location_discovered ? 1 : 0) << ",\n"
        << shift << "\"covered_locations\": [ ";
    bool first{ true };
    for (location_id const&  id : item.covered_locations)
    {
        if (first) first = false; else ostr << ',';
        ostr << id;
    }
    ostr
        << " ],\n"
        << shift << "\"analysis_name\": \"" << item.analysis_name << "\",\n"
        << shift << "\"progress_message\": \"" << progress_message << "\",\n"
        << shift << "\"execution_results\": {\n"
        ;

    execution_results const&  results{ *item.results };
    std::string const  shift2 = "        ";

    ostr
        << shift2 << "\"termination\": \"" << com::to_string(results.get_termination()) << "\",\n"
        << shift2 << "\"bytes\": \"";
    for (natural_8_bit  byte : *results.get_bytes())
        ostr << std::setw(2) << std::setfill('0') << std::hex << (natural_32_bit)byte;
    ostr << "\",\n" << shift2 << "\"types\": \"";
    for (data_type  type : *results.get_types())
        ostr << std::setw(2) << std::setfill('0') << std::hex << (natural_32_bit)com::to_type_id(type);
    ostr << "\",\n" << shift2 << "\"metadata\": \"";
    for (natural_8_bit  byte : *results.get_metadata())
        ostr << std::setw(2) << std::setfill('0') << std::hex << (natural_32_bit)byte;
    ostr << "\",\n" << std::setfill(' ') << std::dec << shift2 << "\"trace\": [ ";
    {
        execution_trace const&  trace = *results.get_trace();

        std::vector<branching_node::guid_type>  node_guids;
        for (branching_node const* n = leaf; n != nullptr; n = n->get_predecessor())
            node_guids.push_back(n->guid());
        std::reverse(node_guids.begin(), node_guids.end());
    
        INVARIANT(trace.size() == node_guids.size());

        first = true;
        for (trace_index_type  i = 0U, n = (trace_index_type)trace.size(); i < n; ++i)
        {
            trace_item const&  trace_item{ trace.at(i) };
            branching_value const  value{
                    std::isfinite(trace_item.value) ? trace_item.value : std::numeric_limits<branching_value>::max()
                    };
            if (first) first = false; else ostr << ", ";
            ostr << trace_item.id << ','
                 << (trace_item.direction ? 1 : 0) << ','
                 << trace_item.num_input_bytes << ','
                 << std::setprecision(std::numeric_limits<branching_value>::digits10 + 1) << value << ','
                 << node_guids.at(i);
        }
    }
    ostr << " ]\n" << shift << "}\n}";

    ++counter_results;
}


void  progress_recorder::on_strategy(std::string const&  strategy_)
{
    if (!is_started())
        return;
    strategy = strategy_;
}


void  progress_recorder::on_post_node_closed(branching_node const* const  node)
{
    if (!is_started())
        return;
    analysis_common_info*  info{ nullptr };
    switch (analysis)
    {
        case ANALYSIS::BITSHARE: info = &bitshare; break;
        case ANALYSIS::LOCAL_SEARCH: info = &local_search; break;
        case ANALYSIS::BITFLIP: info = &bitflip; break;
        case ANALYSIS::TAINT_REQUEST: info = &taint_request; break;
        case ANALYSIS::TAINT_RESPONSE: info = &taint_response; break;
        default: break;
    }
    if (info != nullptr)
        info->closed_node_guids.insert(node->guid());
}


std::string const&  progress_recorder::analysis_name(ANALYSIS const a)
{
    static std::string const  names[] { "STARTUP","BITSHARE","LOCAL_SEARCH","BITFLIP","TAINT_REQ","TAINT_RES" };
    ASSUMPTION((int)a < sizeof(names)/sizeof(names[0]));
    return names[(int)a];
}


void  progress_recorder::analysis_common_info::save() const
{
    TMPROF_BLOCK();

    if (!std::filesystem::is_directory(analysis_dir))
        throw std::runtime_error("Analysis directory does not exist: " + analysis_dir);

    {
        std::filesystem::path const  pathname = std::filesystem::path(analysis_dir) / "info.json";
        std::ofstream  ostr(pathname.c_str(), std::ios::binary);
        if (!ostr.is_open())
            throw std::runtime_error("Cannot open file for writing: " + pathname.string());
    
        ostr << "{\n";

        {
            auto const pos_old = ostr.tellp();
            save_info(ostr);
            auto const pos_new = ostr.tellp();
            if (pos_new != pos_old)
                ostr << ",\n";
        }

        ostr << "\"node_guid\": " << (node == nullptr ? 0U : node->guid()) << ",\n";

        ostr << "\"start_attribute\": ";
        switch (start_type)
        {
            case START::REGULAR: ostr << "\"REGULAR\""; break;
            case START::RESUMED: ostr << "\"RESUMED\""; break;
            default: UNREACHABLE(); break;
        }
        ostr << ",\n\"stop_attribute\": ";
        switch (stop_type)
        {
            case STOP::INSTANT: ostr << "\"INSTANT\""; break;
            case STOP::EARLY: ostr << "\"EARLY\""; break;
            case STOP::REGULAR: ostr << "\"REGULAR\""; break;
            case STOP::INTERRUPTED: ostr << "\"INTERRUPTED\""; break;
            case STOP::FAILED: ostr << "\"FAILED\""; break;
            default: UNREACHABLE(); break;
        }
        ostr << ",\n\"num_coverage_failure_resets\": " << get_num_coverage_failure_resets() << '\n';

        ostr << "}\n";
    }
    {
        std::filesystem::path const  record_pathname = std::filesystem::path(analysis_dir) / "strategy.json";
        std::ofstream  ostr{ record_pathname.c_str(), std::ios::binary };
        if (!ostr.is_open())
            throw std::runtime_error("Cannot open file for writing: " + record_pathname.string());
        ostr << "{\n";

        ostr << "\"strategy\": \"" << strategy << "\",\n\"closed_node_guids\": [\n";
        for (auto  it = closed_node_guids.begin(); it != closed_node_guids.end(); ++it)
        {
            ostr << *it;
            if (std::next(it) != closed_node_guids.end()) ostr << ",\n";
        }
        ostr << "]\n";

        ostr << "}\n";
    }
}


void  progress_recorder::bitshare_progress_info::save_info(std::ostream&  ostr) const
{
}


void  progress_recorder::local_search_progress_info::save_info(std::ostream&  ostr) const
{
}


void  progress_recorder::bitflip_progress_info::save_info(std::ostream&  ostr) const
{
}


void  progress_recorder::taint_request_progress_info::save_info(std::ostream&  ostr) const
{
}


void  progress_recorder::taint_response_progress_info::save_info(std::ostream&  ostr) const
{
    std::vector<branching_node const*>  nodes;
    for (branching_node const*  n = node; n != nullptr; n = n->get_predecessor())
        nodes.push_back(n);
    std::reverse(nodes.begin(), nodes.end());

    ostr << "\"sensitive_bits\": [\n";
    for (natural_32_bit  i = 0U, end = (natural_32_bit)nodes.size(); i < end; ++i)
    {
        branching_node const* const  n = nodes.at(i);
        ostr << '[';
        bool first = true;
        std::vector<natural_32_bit>  indices(n->get_sensitive_stdin_bits().begin(), n->get_sensitive_stdin_bits().end());
        std::sort(indices.begin(), indices.end());
        for (natural_32_bit idx : indices)
        {
            if (!first) ostr << ',';
            ostr << idx;
            first = false;
        }
        ostr << ']';
        if (i + 1 < end) ostr << ',';
        ostr << '\n';
    }
    ostr << "]";
}


void  progress_recorder::on_analysis_start(ANALYSIS const  analysis_, analysis_common_info&  info, branching_node const* const  node_ptr)
{
    if (!is_started())
        return;

    ASSUMPTION(analysis == ANALYSIS::STARTUP);

    analysis = analysis_;
    ++counter_analysis;
    counter_results = 0;

    info.node = node_ptr;
    info.analysis_dir = std::filesystem::path{ output_dir } / (std::to_string(counter_analysis) + '_' + analysis_name(analysis));
    std::filesystem::create_directories(info.analysis_dir);
    if (!std::filesystem::is_directory(info.analysis_dir))
        throw std::runtime_error("Cannot create directory: " + info.analysis_dir);
    if (info.start_type != START::RESUMED)
        info.strategy = strategy;
    info.closed_node_guids.clear();
}


void  progress_recorder::on_analysis_stop()
{
    if (!is_started() || analysis == ANALYSIS::STARTUP)
        return;

    analysis = ANALYSIS::STARTUP;
    bitshare = {};
    local_search = {};
    bitflip = {};
    taint_request = {};
    taint_response = {};
}


}
