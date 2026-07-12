#include <squirrel/gfx/visualizer.hpp>
#include <squirrel/gfx/renderer.hpp>
#include <SDL3/SDL.h>
#include <glad/glad.h>
#include <imgui.h>
#include <imgui_impl_sdl3.h>
#include <imgui_impl_opengl3.h>
#include <thread>
#include <mutex>
#include <chrono>
#include <memory>
#include <stdexcept>

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

    void process_events();
    void render_begin();
    void render_end();

    Visualizer(Visualizer const&) = delete;
    Visualizer(Visualizer&&) = delete;
    Visualizer& operator=(Visualizer const&) = delete;
    Visualizer& operator=(Visualizer&&) = delete;

    SDL_Window* m_window_ptr;
    SDL_GLContext m_gl_context_ptr;
    ImGuiIO* m_gui_io_ptr;
    ImVec4 m_clear_color;
    Renderer*  m_renderer;
};


std::mutex  Visualizer::s_mutex{};
bool Visualizer::s_stop_flag{ false };
bool Visualizer::s_render{ false };


Visualizer::Visualizer()
    : m_window_ptr{ nullptr }
    , m_gl_context_ptr{ nullptr }
    , m_gui_io_ptr{ nullptr }
    , m_clear_color{ 0.45f, 0.55f, 0.60f, 1.00f }
    , m_renderer{ nullptr }
{
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, 4);
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, 2);
    SDL_GL_SetAttribute(SDL_GL_ACCELERATED_VISUAL, 1);
    SDL_GL_SetAttribute(SDL_GL_RED_SIZE, 8);
    SDL_GL_SetAttribute(SDL_GL_GREEN_SIZE, 8);
    SDL_GL_SetAttribute(SDL_GL_BLUE_SIZE, 8);
    SDL_GL_SetAttribute(SDL_GL_ALPHA_SIZE, 8);
    SDL_GL_SetAttribute(SDL_GL_DOUBLEBUFFER, 1);
    SDL_GL_SetAttribute(SDL_GL_DEPTH_SIZE, 24);

    float main_scale = SDL_GetDisplayContentScale(SDL_GetPrimaryDisplay());

    const SDL_PropertiesID props = SDL_CreateProperties();
    SDL_SetStringProperty(props, SDL_PROP_WINDOW_CREATE_TITLE_STRING, "Squirrel's visualizer");
    SDL_SetNumberProperty(props, SDL_PROP_WINDOW_CREATE_X_NUMBER, 0);
    SDL_SetNumberProperty(props, SDL_PROP_WINDOW_CREATE_Y_NUMBER, 0);
    SDL_SetNumberProperty(props, SDL_PROP_WINDOW_CREATE_WIDTH_NUMBER, 1024);
    SDL_SetNumberProperty(props, SDL_PROP_WINDOW_CREATE_HEIGHT_NUMBER, 768);
    SDL_SetNumberProperty(props, SDL_PROP_WINDOW_CREATE_FLAGS_NUMBER, SDL_WINDOW_OPENGL | SDL_WINDOW_RESIZABLE);
    m_window_ptr = SDL_CreateWindowWithProperties(props);
    if (m_window_ptr == nullptr)
        throw std::runtime_error("Error: The call 'SDL_CreateWindow' function has FAILED.");
    m_gl_context_ptr = SDL_GL_CreateContext(m_window_ptr);
    if (m_gl_context_ptr == nullptr)
        throw std::runtime_error("Error: The call 'SDL_GL_CreateContext' function has FAILED.");
    if (!gladLoadGLLoader((GLADloadproc)SDL_GL_GetProcAddress))
        throw std::runtime_error("Error: The call to 'gladLoadGLLoader' has FAILED.");
    SDL_GL_MakeCurrent(m_window_ptr, m_gl_context_ptr);
    SDL_GL_SetSwapInterval(1);
    SDL_ShowWindow(m_window_ptr);

    // Setup Dear ImGui context
    IMGUI_CHECKVERSION();
    ImGui::CreateContext();
    m_gui_io_ptr = &ImGui::GetIO();
    m_gui_io_ptr->ConfigFlags |= ImGuiConfigFlags_NavEnableKeyboard;     // Enable Keyboard Controls
    //m_gui_io_ptr->ConfigFlags |= ImGuiConfigFlags_NavEnableGamepad;      // Enable Gamepad Controls

    // Setup Dear ImGui style
    ImGui::StyleColorsDark();
    //ImGui::StyleColorsLight();
    
    ImGuiStyle& style = ImGui::GetStyle();
    style.ScaleAllSizes(main_scale);        // Bake a fixed style scale. (until we have a solution for dynamic style scaling, changing this requires resetting Style + calling this again)
    style.FontScaleDpi = main_scale;        // Set initial font scale. (in docking branch: using io.ConfigDpiScaleFonts=true automatically overrides this for every window depending on the current monitor)

    // Setup Platform/Renderer backends
    ImGui_ImplSDL3_InitForOpenGL(m_window_ptr, m_gl_context_ptr);
    const char* glsl_version = nullptr;
    ImGui_ImplOpenGL3_Init(glsl_version);

    m_renderer = new Renderer();
}


Visualizer::~Visualizer()
{
    delete m_renderer;
    m_renderer = nullptr;

    if (m_gl_context_ptr != nullptr)
    {
        SDL_GL_DestroyContext(m_gl_context_ptr);
        m_gl_context_ptr = nullptr;
    }
    if (m_window_ptr != nullptr)
    {
        SDL_DestroyWindow(m_window_ptr);
        m_window_ptr = nullptr;
    }
    SDL_Quit();
}


void Visualizer::next_frame()
{
    process_events();

    if (SDL_GetWindowFlags(m_window_ptr) & SDL_WINDOW_MINIMIZED)
    {
        SDL_Delay(10);
        return;
    }

    render_begin();

    bool do_render;
    {
        std::lock_guard<std::mutex> const lock(s_mutex);
        do_render = !s_stop_flag && s_render;
    }

    m_renderer->set_waiting_for_content(!do_render);
    m_renderer->next_frame();

    render_end();

    if (m_renderer->is_waiting_for_content())
    {
        std::lock_guard<std::mutex> const lock(s_mutex);
        s_render = false;
    }
}


void Visualizer::process_events()
{
    SDL_Event event;
    while (SDL_PollEvent(&event))
    {
        ImGui_ImplSDL3_ProcessEvent(&event);

        switch (event.type)
        {
        case SDL_EVENT_QUIT:
            {
                std::lock_guard<std::mutex> const lock(s_mutex);
                s_stop_flag = true;
                s_render = false;
            }
            break;
        case SDL_EVENT_WINDOW_CLOSE_REQUESTED:
            if (event.window.windowID == SDL_GetWindowID(m_window_ptr))
            {
                std::lock_guard<std::mutex> const lock(s_mutex);
                s_stop_flag = true;
                s_render = false;
            }
            break;
        case SDL_EVENT_WINDOW_RESIZED:
        case SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED :
            if (event.window.windowID == SDL_GetWindowID(m_window_ptr)) {
            }
            break;
        case SDL_EVENT_WINDOW_MINIMIZED:
            break;
        case SDL_EVENT_WINDOW_MAXIMIZED:
        case SDL_EVENT_WINDOW_RESTORED:
            break;
        case SDL_EVENT_WINDOW_MOUSE_ENTER:
            break;
        case SDL_EVENT_WINDOW_MOUSE_LEAVE:
            break;
        case SDL_EVENT_WINDOW_FOCUS_GAINED:
            break;
        case SDL_EVENT_WINDOW_FOCUS_LOST:
            break;
        default:
            break;
        }
    }
}


void Visualizer::render_begin()
{
    ImGui_ImplOpenGL3_NewFrame();
    ImGui_ImplSDL3_NewFrame();
    ImGui::NewFrame();
}


void Visualizer::render_end()
{
    ImGui::Render();
    glViewport(0, 0, (int)m_gui_io_ptr->DisplaySize.x, (int)m_gui_io_ptr->DisplaySize.y);
    glClearColor(
        m_clear_color.x * m_clear_color.w,
        m_clear_color.y * m_clear_color.w,
        m_clear_color.z * m_clear_color.w,
        m_clear_color.w
        );
    glClear(GL_COLOR_BUFFER_BIT);
    ImGui_ImplOpenGL3_RenderDrawData(ImGui::GetDrawData());
    SDL_GL_SwapWindow(m_window_ptr);
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
