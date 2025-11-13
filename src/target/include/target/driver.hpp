#ifndef TARGET_DRIVER_HPP_INCLUDED
#   define TARGET_DRIVER_HPP_INCLUDED

#   include <connection/shared_memory.hpp>
#   include <iomodels/cmdline.hpp>
#   include <iomodels/simple.hpp>
#   include <com/target_termination.hpp>
#   include <memory>
#   include <mutex>

namespace  target {


struct driver
{
    static driver& instance();

    bool  valid() const { return m_valid; }
    bool  set_termination(com::target_termination  termination);

    connection::medium*  medium() { return &m_shared_memory; }
    std::mutex&  mutex() { return m_mutex; }

    com::target_termination  on_location_hit(
        com::location_id  loc_id,
        bool  direction,
        com::branching_value  value,
        bool  xor_like_branching_function,
        com::atomic_predicate  predicate
        );

    iomodels::cmdline&  io_cmdline() { return *m_io_cmdline; }
    iomodels::simple&  io_simple() { return *m_io_simple; }

private:
    driver();

    void set_invalid();

    bool  m_valid;
    connection::shared_memory  m_shared_memory;
    std::mutex m_mutex;
    natural_32_bit  m_trace_length;
    natural_32_bit  m_max_trace_length;
    natural_16_bit  m_max_exec_megabytes;
    iomodels::cmdline_ptr  m_io_cmdline;
    iomodels::simple_ptr  m_io_simple;
};


}

inline target::driver&  driver() { return target::driver::instance(); }

inline bool  set_termination(com::target_termination  termination) { return driver().set_termination(termination); }
void  check(com::target_termination  termination);

inline connection::medium*  medium() { return driver().medium(); }
inline std::mutex&  mutex() { return driver().mutex(); }

inline iomodels::cmdline&  io_cmdline() { return driver().io_cmdline(); }
inline iomodels::simple&  io_simple() { return driver().io_simple(); }


#endif
