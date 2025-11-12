#include <fuzzing/fuzzer.hpp>
#include <iostream>

#define LINE_UP       "\033[1A"
#define LINE_BEGIN    "\r"
#define LINE_NEXT     "\n"
#define LINE_CLEAR    "\x1b[2K"
#define RENDER(X...)  do { std::cout << X << "        \n"; ++NUM_LINES; } while(false)

namespace  fuzzing {


void  fuzzer::enable_renderer(bool const state)
{
    switch (render_state)
    {
        case RENDER_STATE::DISABLED:
            if (state)
                render_state = RENDER_STATE::STARTED;
            break;
        case RENDER_STATE::STARTED:
            if (!state)
                render_state = RENDER_STATE::DISABLED;
            break;
        case RENDER_STATE::WORKING:
            if (!state)
                render_state = RENDER_STATE::PAUSED;
            break;
        case RENDER_STATE::PAUSED:
            if (state)
                render_state = RENDER_STATE::WORKING;
            break;
        default:
            UNREACHABLE();
            break;
    }
}


bool  fuzzer::is_renderer_enabled() const
{
    switch (render_state)
    {
        case RENDER_STATE::DISABLED:
        case RENDER_STATE::PAUSED:
            return false;
        case RENDER_STATE::STARTED:
        case RENDER_STATE::WORKING:
            return true;
        default:
            UNREACHABLE();
            return false;
    }
}


void fuzzer::render() const
{
    if (!is_renderer_enabled())
        return;

    static std::size_t NUM_LINES{ 0ULL };

    if (render_state == RENDER_STATE::STARTED)
        render_state = RENDER_STATE::WORKING;
    else
    {
        for (std::size_t i{ 0ULL }; i < NUM_LINES; ++i)
            std::printf(LINE_UP);
        std::printf(LINE_BEGIN);
    }
    NUM_LINES = 0;

    RENDER("\"renderer\": {");
    RENDER("    \"elapsed_seconds\": " << get_elapsed_seconds() << ",");
    RENDER("    \"num_driver_executions\": " << num_driver_executions << ",");
    RENDER("    \"covered_branchings\": " << covered_branchings.size() << ",");
    RENDER("    \"uncovered_branchings\": " << uncovered_branchings.size() << ",");
    RENDER("    \"state\": \"" << get_analysis_name_from_state(state) << "\",");
    RENDER("    \"location\": " << 
        [this]() {
            branching_node* node;
            switch (state)
            {
                case BITSHARE: node = bitshare.get_node(); break;
                case LOCAL_SEARCH: node = local_search.get_node(); break;
                default: node = nullptr; break;
            }
            return node == nullptr ? "N/A" : std::to_string(node->get_location_id());
        }()
        << ",");
    RENDER("    \"bitshare_analysis\": " << get_bitshare_statistics().generated_inputs << ",");
    RENDER("    \"local_search_analysis\": " << get_local_search_statistics().generated_inputs << ",");
    RENDER("    \"leaf_branchings\": " << leaf_branchings.size() << ",");
    RENDER("    \"tree_nodes\": " << get_fuzzer_statistics().nodes_created - get_fuzzer_statistics().nodes_destroyed << ",");
    RENDER("    \"crashes\": " << get_fuzzer_statistics().crashes << ",");
    RENDER("    \"boundary_violations\": " << get_fuzzer_statistics().boundary_violations << ",");
    RENDER("    \"medium_overflows\": " << get_fuzzer_statistics().medium_overflows);
    RENDER("},");
}


}
