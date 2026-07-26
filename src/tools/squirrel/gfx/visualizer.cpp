#include <squirrel/gfx/visualizer.hpp>
#include <squirrel/gfx/renderer.hpp>
#include <GLFW/glfw3.h>
#include <imgui.h>
#include <imgui_impl_glfw.h>
#include <imgui_impl_opengl3.h>
#include <thread>
#include <mutex>
#include <chrono>
#include <memory>
#include <stdexcept>
#include <iostream>

namespace gfx {


struct Visualizer : public ::visualizer::VisualizerBase
{
    using Super = ::visualizer::VisualizerBase;

    Visualizer(DataSources const&  data);
    ~Visualizer();

    void next_frame() override;

private:

    static void glfw_error_callback(int error, char const* description);

    void render_begin();
    void render_end();

    GLFWwindow* m_window_ptr;
    Renderer*  m_renderer;
};


void Visualizer::glfw_error_callback(int const error, char const* const description)
{
    std::cerr << "GLFW Error " << error << " " << description << "\n";
}


Visualizer::Visualizer(DataSources const&  data)
    : Super{}
    , m_window_ptr{ nullptr }
    , m_renderer{ nullptr }
{
    glfwSetErrorCallback(glfw_error_callback);
    if (!glfwInit())
        return;

    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 0);

    float const main_scale = ImGui_ImplGlfw_GetContentScaleForMonitor(glfwGetPrimaryMonitor());
    m_window_ptr = glfwCreateWindow(
        (int)(1024 * main_scale),
        (int)(768 * main_scale),
        "Squirrel's visualizer",
        nullptr,
        nullptr
        );
    if (m_window_ptr == nullptr)
        return;
    glfwMakeContextCurrent(m_window_ptr);
    glfwSwapInterval(1); // Enable vsync

    // Setup Dear ImGui context
    IMGUI_CHECKVERSION();
    ImGui::CreateContext();
    ImGuiIO& gui_io = ImGui::GetIO();
    gui_io.ConfigFlags |= ImGuiConfigFlags_NavEnableKeyboard;     // Enable Keyboard Controls
    gui_io.ConfigFlags |= ImGuiConfigFlags_NavEnableGamepad;      // Enable Gamepad Controls

    // Setup Dear ImGui style
    ImGui::StyleColorsDark();
    //ImGui::StyleColorsLight();
    
    ImGuiStyle& style = ImGui::GetStyle();
    style.ScaleAllSizes(main_scale);        // Bake a fixed style scale. (until we have a solution for dynamic style scaling, changing this requires resetting Style + calling this again)
    style.FontScaleDpi = main_scale;        // Set initial font scale. (in docking branch: using io.ConfigDpiScaleFonts=true automatically overrides this for every window depending on the current monitor)

    // Setup Platform/Renderer backends
    ImGui_ImplGlfw_InitForOpenGL(m_window_ptr, true);
    char const* glsl_version = nullptr;
    ImGui_ImplOpenGL3_Init(glsl_version);

    glfwMaximizeWindow(m_window_ptr);

    m_renderer = new Renderer(data);
}


Visualizer::~Visualizer()
{
    delete m_renderer;
    m_renderer = nullptr;

    ImGui_ImplOpenGL3_Shutdown();
    ImGui_ImplGlfw_Shutdown();
    ImGui::DestroyContext();

    if (m_window_ptr != nullptr)
    {
        glfwDestroyWindow(m_window_ptr);
        m_window_ptr = nullptr;
    }

    glfwTerminate();
}


void Visualizer::next_frame()
{
    if (glfwWindowShouldClose(m_window_ptr))
    {
        std::lock_guard<std::mutex> const lock(s_mutex);
        s_stop_flag = true;
        s_render = false;
        return;
    }

    glfwPollEvents();
    if (glfwGetWindowAttrib(m_window_ptr, GLFW_ICONIFIED) != 0)
        return;

    render_begin();

    m_renderer->set_waiting_for_content(!can_render());
    m_renderer->next_frame();

    render_end();

    if (m_renderer->is_waiting_for_content())
        set_waiting_for_content();
}


void Visualizer::render_begin()
{
    ImGui_ImplOpenGL3_NewFrame();
    ImGui_ImplGlfw_NewFrame();
    ImGui::NewFrame();
}


void Visualizer::render_end()
{
    ImGui::Render();
    int display_w, display_h;
    glfwGetFramebufferSize(m_window_ptr, &display_w, &display_h);
    glViewport(0, 0, display_w, display_h);
    glClearColor(0.1f, 0.1f, 0.1f, 1.00f);
    glClear(GL_COLOR_BUFFER_BIT);
    ImGui_ImplOpenGL3_RenderDrawData(ImGui::GetDrawData());

    glfwSwapBuffers(m_window_ptr);
}


visualizer::ConstructorType get_visualizer_constructor(DataSources const& data)
{
    return [data](){ return std::make_unique<Visualizer>(data); };
}


}
