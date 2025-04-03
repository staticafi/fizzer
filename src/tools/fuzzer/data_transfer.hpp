#ifndef IOMODELS_DATA_TRANSFER_HPP_INCLUDED
#   define IOMODELS_DATA_TRANSFER_HPP_INCLUDED

#   include <iomodels/iomodel.hpp>
#   include <connection/data_transfer_manager.hpp>

namespace iomodels {


struct  iomanager;


struct  data_transfer final : public connection::data_transfer_manager
{
    data_transfer(iomanager*  manager);

    void  set_data(com::input_bytes_ptr bytes, com::input_metadata_ptr  metadata);

private:
    void  write_to(connection::medium&  dst) override;
    void  on_target_finished(connection::medium&  dst, int  exit_code, bool  killed) override;
    void  read_from(connection::medium&  src) override;

    iomanager*  m_manager;
};


}

#endif
