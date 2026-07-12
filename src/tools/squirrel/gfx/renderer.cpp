#include <squirrel/gfx/renderer.hpp>

namespace gfx {


Renderer::Renderer(DataSources const&  data_sources)
    : m_waiting_for_content{ true }

    , m_data{ data_sources }

    , m_clear_color{ 0.1f, 0.1f, 0.1f, 1.00f }
{}

void Renderer::next_frame(ImGuiIO& gui_io)
{
        static float f = 0.0f;
        static int counter = 0;
        static bool check = false;

        ImGui::Begin("Hello, world!");                          // Create a window called "Hello, world!" and append into it.

        ImGui::Text("This is some useful text.");               // Display some text (you can use a format strings too)
        ImGui::Checkbox("Demo Window", &check);      // Edit bools storing our window open/close state

        ImGui::SliderFloat("float", &f, 0.0f, 1.0f);            // Edit 1 float using a slider from 0.0f to 1.0f
        ImGui::ColorEdit3("clear color", (float*)&m_clear_color); // Edit 3 floats representing a color

        if (ImGui::Button("Button"))                            // Buttons return true when clicked (most widgets return true when edited/activated)
            counter++;
        ImGui::SameLine();
        ImGui::Text("counter = %d", counter);

        ImGui::Text("Application average %.3f ms/frame (%.1f FPS)", 1000.0f / gui_io.Framerate, gui_io.Framerate);
        ImGui::End();
}


}
