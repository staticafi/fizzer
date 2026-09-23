#include <squirrel/gfx/renderer_data_tables.hpp>
#include <squirrel/gfx/shape.hpp>
#include <cps/variable_str.hpp>
#include <cps/comparator_str.hpp>
#include <utility/assumptions.hpp>
#include <utility/invariants.hpp>
#include <set>
#include <map>
#include <cstdint>

namespace gfx {


RendererDataTables::RendererDataTables(DataSources const&  data_sources)
    : Super{ data_sources }
    , split_x{ 400.0f }
    , selected_graph_node{ 0U }
{

}

void RendererDataTables::next_frame()
{
    Super::next_frame();

    ImGui::BeginChild("LeftPane", ImVec2(split_x, 0), ImGuiChildFlags_Borders);
    {
        if (!solver().data_tables().contains(selected_graph_node))
        {
            for (auto const& bb_and_table : solver().data_tables())
                if (!bb_and_table.second.rows().empty())
                {
                    selected_graph_node = bb_and_table.first;
                    break;
                }
        }

        std::unordered_set<std::uint32_t> external_functions {
                program().external_functions().begin(),
                program().external_functions().end()
                };
        ImU32 special_functions_colors[3] {
                IM_COL32(100, 150, 100, 255),   // Static initializer
                IM_COL32(255, 175, 0, 255),     // Entry function
                IM_COL32(150, 150, 150, 255)    // Extern function
                };
        for (std::uint32_t fn_index = 0; fn_index < (std::uint32_t)program().functions().size(); ++fn_index)
        {
            INVARIANT(fn_index == data().program->functions().at(fn_index).index());
            std::string const label = std::to_string(fn_index) + ": " + program().functions().at(fn_index).name();

            bool is_color_style_pushed = false;
            if (fn_index == 0U)
            {
                ImGui::PushStyleColor(ImGuiCol_Text, special_functions_colors[0]);
                is_color_style_pushed = true;
            }
            else if (fn_index == program().entry_function())
            {
                ImGui::PushStyleColor(ImGuiCol_Text, special_functions_colors[1]);
                is_color_style_pushed = true;
            }
            else if (external_functions.contains(fn_index))
            {
                ImGui::PushStyleColor(ImGuiCol_Text, special_functions_colors[2]);
                is_color_style_pushed = true;
            }

            if (ImGui::TreeNodeEx(label.c_str(), ImGuiTreeNodeFlags_DefaultOpen | ImGuiTreeNodeFlags_SpanAvailWidth, "%s", label.c_str()))
            {
                std::uint32_t const begin_node_index{ nav_graph().begin(fn_index) };
                std::uint32_t const end_node_index{ nav_graph().end(fn_index) };
                for (std::uint32_t node_index = begin_node_index; node_index != end_node_index; ++node_index)
                    if (solver().data_tables().contains(node_index))
                    {
                        sala::NavigationGraph::Node const& n{ nav_graph().node(node_index) };
                        std::string const label =   "idx: " + std::to_string(node_index) +
                                                    ", fn: " + std::to_string(n.function) +
                                                    ", bb: " + std::to_string(n.basic_block) +
                                                    ", ei: " + std::to_string(n.instruction) +
                                                    " [rows: " + std::to_string(solver().data_tables().at(node_index).rows().size()) + "]"
                                                    ;

                        ImGuiTreeNodeFlags flags = ImGuiTreeNodeFlags_Leaf | ImGuiTreeNodeFlags_SpanAvailWidth;
                        if (selected_graph_node == node_index)
                            flags |= ImGuiTreeNodeFlags_Selected;

                        if (ImGui::TreeNodeEx(label.c_str(), flags, "%s", label.c_str()))
                        {
                            if (ImGui::IsItemClicked())
                                selected_graph_node = node_index;
                            ImGui::TreePop();
                        }
                    }

                ImGui::TreePop();
            }

            if (is_color_style_pushed)
                ImGui::PopStyleColor();

        }
    }
    ImGui::EndChild();

    ImGui::PushStyleVar(ImGuiStyleVar_ItemSpacing, ImVec2(0, 0));
    ImGui::SameLine();
    {
        ImGui::InvisibleButton("vsplitter", ImVec2(8.0f, -1)); // 8px wide
        if (ImGui::IsItemActive()) {
            split_x += ImGui::GetIO().MouseDelta.x; // Adjust size on drag
        }
    }
    ImGui::SameLine();
    ImGui::PopStyleVar();

    ImGui::BeginChild("RightPane", ImVec2(0, 0), true);
    {
        auto const table_it = solver().data_tables().find(selected_graph_node);
        if (table_it != solver().data_tables().end())
        {
            chickaree::DataTable const& table{ table_it->second };
            ImGui::Text("Comparator: %s", as_str(table.comparator()).c_str());

            std::map<std::uint32_t, int> header_input_indices;
            std::map<std::uint32_t, int> header_constant_indices;
            std::map<std::uint32_t, int> header_counter_indices;
            {
                std::set<std::uint32_t> header_inputs;
                std::set<std::uint32_t> header_constants;
                std::set<std::uint32_t> header_counters;
                for (auto const& row : table.rows())
                {
                    for (auto const& var : row.inputs)
                        header_inputs.insert(var.graph_node_index);
                    for (auto const& var : row.constants)
                        header_constants.insert(var.graph_node_index);
                    for (auto const& var : row.counters)
                        header_counters.insert(var.graph_node_index);
                }

                int idx{ 2 };
                for (auto const& var : header_inputs)
                    header_input_indices.insert({ var, idx++ });
                for (auto const& var : header_constants)
                    header_constant_indices.insert({ var, idx++ });
                for (auto const& var : header_counters)
                    header_counter_indices.insert({ var, idx++ });
            }

            if (ImGui::BeginTable(
                    "DataTable",
                    2 + header_input_indices.size() + header_constant_indices.size() + header_counter_indices.size(),
                    ImGuiTableFlags_BordersH | ImGuiTableFlags_BordersV | ImGuiTableFlags_ScrollX | ImGuiTableFlags_ScrollY
                    ))
            {
                ImGui::TableSetupColumn("Function");
                ImGui::TableSetupColumn("Predicate");

                for (auto const& var_and_idx : header_input_indices)
                {
                    std::string const label{ "i" + std::to_string(var_and_idx.first) };
                    ImGui::TableSetupColumn(label.c_str());
                }
                for (auto const& var_and_idx : header_constant_indices)
                {
                    std::string const label{ "c" + std::to_string(var_and_idx.first) };
                    ImGui::TableSetupColumn(label.c_str());
                }
                for (auto const& var_and_idx : header_counter_indices)
                {
                    std::string const label{ "k" + std::to_string(var_and_idx.first) };
                    ImGui::TableSetupColumn(label.c_str());
                }

                ImGui::TableHeadersRow();
            
                for (auto const& row : table.rows())
                {
                    ImGui::TableNextRow();

                    int col = 0;

                    ImGui::TableSetColumnIndex(0);
                    ImGui::Text("%f", row.evaluation.function);
                    ImGui::TableSetColumnIndex(1);
                    ImGui::Text("%s", row.evaluation.predicate ? "true" : "false");

                    for (auto const& var : row.inputs)
                    {
                        ImGui::TableSetColumnIndex(header_input_indices.at(var.graph_node_index));
                        ImGui::Text("%s", cps::value_as_str(var.value).c_str());
                    }
                    for (auto const& var : row.constants)
                    {
                        ImGui::TableSetColumnIndex(header_constant_indices.at(var.graph_node_index));
                        ImGui::Text("%s", cps::value_as_str(var.value).c_str());
                    }
                    for (auto const& var : row.counters)
                    {
                        ImGui::TableSetColumnIndex(header_counter_indices.at(var.graph_node_index));
                        ImGui::Text("%s", cps::value_as_str(var.value).c_str());
                    }
                }

                ImGui::EndTable();
            }
        }
    }
    ImGui::EndChild();
}


}
