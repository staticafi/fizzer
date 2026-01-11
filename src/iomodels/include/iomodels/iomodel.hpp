#ifndef IOMODELS_IOMODEL_HPP_INCLUDED
#   define IOMODELS_IOMODEL_HPP_INCLUDED

#   include <com/execution_results.hpp>
#   include <com/record_type.hpp>
#   include <utility/basic_numeric_types.hpp>
#   include <memory>

namespace  connection { struct medium; }

namespace  iomodels {


struct  iomodel
{
    virtual  ~iomodel() {}

    virtual void  clear() = 0;

    virtual com::record_type  get_record_type() const = 0;
    virtual natural_64_bit  max_data_in_medium() const = 0;
    virtual natural_64_bit  max_construction_data_in_medium() const = 0;

    virtual bool  save_construction_data(connection::medium&  dst) const = 0;
    virtual bool  parse_record(
            com::input_bytes::const_iterator&  it_bytes,
            com::input_types::const_iterator&  it_type,
            com::input_metadata::const_iterator&  it_metadata
            ) = 0;
    // virtual bool  parse_record(com::execution_results&  dst, connection::medium&  src) const = 0;
    // virtual bool  parse_value(com::execution_results&  dst, com::data_type  type, connection::medium&  src) const = 0;

    virtual void  on_load_complete() {}
};


}

#endif
