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


struct Visualizer
{
    static std::mutex  s_mutex;
    static bool s_stop_flag;
    static bool s_render;

    Visualizer();
    ~Visualizer();

    void next_frame();

private:

    static void glfw_error_callback(int error, char const* description);

    void render_begin();
    void render_end();

    Visualizer(Visualizer const&) = delete;
    Visualizer(Visualizer&&) = delete;
    Visualizer& operator=(Visualizer const&) = delete;
    Visualizer& operator=(Visualizer&&) = delete;

    GLFWwindow* m_window_ptr;
    ImGuiIO* m_gui_io_ptr;
    Renderer*  m_renderer;
};


std::mutex  Visualizer::s_mutex{};
bool Visualizer::s_stop_flag{ false };
bool Visualizer::s_render{ false };


void Visualizer::glfw_error_callback(int const error, char const* const description)
{
    std::cerr << "GLFW Error " << error << " " << description << "\n";
}


Visualizer::Visualizer()
    : m_window_ptr{ nullptr }
    , m_gui_io_ptr{ nullptr }
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
    m_gui_io_ptr = &ImGui::GetIO();
    m_gui_io_ptr->ConfigFlags |= ImGuiConfigFlags_NavEnableKeyboard;     // Enable Keyboard Controls
    m_gui_io_ptr->ConfigFlags |= ImGuiConfigFlags_NavEnableGamepad;      // Enable Gamepad Controls

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

    m_renderer = new Renderer();
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
    {
        ImGui_ImplGlfw_Sleep(10);
        return;
    }

    render_begin();

    bool do_render;
    {
        std::lock_guard<std::mutex> const lock(s_mutex);
        do_render = !s_stop_flag && s_render;
    }

    m_renderer->set_waiting_for_content(!do_render);
    m_renderer->next_frame(*m_gui_io_ptr);

    render_end();

    if (m_renderer->is_waiting_for_content())
    {
        std::lock_guard<std::mutex> const lock(s_mutex);
        s_render = false;
    }
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
    ImVec4 const& clear_color = m_renderer->clear_color();
    glClearColor(
        clear_color.x * clear_color.w,
        clear_color.y * clear_color.w,
        clear_color.z * clear_color.w,
        clear_color.w
        );
    glClear(GL_COLOR_BUFFER_BIT);
    ImGui_ImplOpenGL3_RenderDrawData(ImGui::GetDrawData());

    glfwSwapBuffers(m_window_ptr);
}


///////////////////////////////////////////////////////////////////////////
// Next follows thread managements and interaction between threads.
///////////////////////////////////////////////////////////////////////////


static void visualizer_thread_procedure();
static std::thread  s_visualizer_thread{};


static void visualizer_thread_procedure()
{
    std::unique_ptr<Visualizer>  visualizer_ptr{ std::make_unique<Visualizer>() };
    while (true)
    {
        {
            std::lock_guard<std::mutex> const lock(Visualizer::s_mutex);
            if (Visualizer::s_stop_flag)
                break;
        }
        try
        {
            visualizer_ptr->next_frame();
        }
        catch (...)
        {
            break;
        }
    }
    std::lock_guard<std::mutex> const lock(Visualizer::s_mutex);
    visualizer_ptr = nullptr;
    Visualizer::s_stop_flag = true;
}


void  create_visualizer()
{
    if (s_visualizer_thread.joinable())
        return;
    Visualizer::s_stop_flag = false;
    Visualizer::s_render = false;
    s_visualizer_thread = std::thread(visualizer_thread_procedure);
}


void  destroy_visualizer()
{
    if (!s_visualizer_thread.joinable())
        return;

    {
        std::lock_guard<std::mutex> const lock(Visualizer::s_mutex);
        Visualizer::s_stop_flag = true;
        Visualizer::s_render = false;
    }
    if (s_visualizer_thread.joinable())
        s_visualizer_thread.join();
}


void  visualize()
{
    if (!s_visualizer_thread.joinable())
        return;

    {
        std::lock_guard<std::mutex> const lock(Visualizer::s_mutex);
        if (Visualizer::s_stop_flag)
            return;
        Visualizer::s_render = true;
    }

    while (s_visualizer_thread.joinable())
    {
        {
            std::lock_guard<std::mutex> const lock(Visualizer::s_mutex);
            if (!Visualizer::s_render || Visualizer::s_stop_flag)
                break;
        }
        std::this_thread::yield();
        std::this_thread::sleep_for(std::chrono::microseconds(100));
    }
}


}
