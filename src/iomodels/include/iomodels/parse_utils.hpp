#ifndef IOMODELS_PARSE_UTILS_HPP_INCLUDED
#   define IOMODELS_PARSE_UTILS_HPP_INCLUDED

#   include <com/execution_results.hpp>
#   include <com/record_type.hpp>

namespace  connection { struct medium; }

namespace  iomodels {


/////////////////////////////////////////////////////////////////////////////////////
// Utility functions for general medium IO operations

bool  read_bytes(void*  bytes, natural_64_bit  count, connection::medium&  src);
template<typename T> inline bool  read_bytes(T&  value, connection::medium&  src) { return read_bytes(&value, sizeof(value), src); }
bool  append_bytes(connection::medium&  dst, void*  bytes, natural_64_bit  count);
template<typename T> inline bool  append_bytes(connection::medium&  dst, T  value) { return append_bytes(dst, &value, sizeof(value)); }


/////////////////////////////////////////////////////////////////////////////////////
// Utility functions useful in overrides of:
// bool  iomodel::parse_record(com::input_bytes::const_iterator&, com::input_types::const_iterator&, com::input_metadata::const_iterator&) = 0;

vecu8::const_iterator&  increment(vecu8::const_iterator&  it, com::data_type  type);
bool  append_typed_bytes(
        vecu8&  destination,
        vecu8::const_iterator&  it,
        com::input_types::const_iterator&  it_types
        );
bool  append_expected_bytes(
        vecu8&  destination,
        vecu8::const_iterator&  it,
        com::input_types::const_iterator&  it_types,
        com::data_type  expected_type
        );
bool  read_bytes(void*  destination, vecu8::const_iterator&  it, com::data_type  type);
bool  read_expected_bytes(
        void*  destination,
        vecu8::const_iterator&  it,
        com::input_types::const_iterator&  it_types,
        com::data_type  expected_type
        );


/////////////////////////////////////////////////////////////////////////////////////
// Utility functions useful in overrides of:
// bool  iomodel::parse_record(com::execution_results&  dst, connection::medium&  src) const = 0;

bool  append_typed_bytes(com::execution_results&  dst, connection::medium&  src);
bool  append_typed_bytes(com::execution_results&  dst, com::data_type  type, natural_64_bit  count, connection::medium&  src);
bool  append_typed_bytes(com::execution_results&  dst, com::data_type  type, connection::medium&  src, void*  dst2 = nullptr);
bool  append_metadata(com::execution_results&  dst, com::record_type  rec_type);
bool  append_metadata(com::execution_results&  dst, natural_64_bit  count, connection::medium&  src, void*  dst2 = nullptr);
template<typename T> inline bool  append_metadata(com::execution_results&  dst, T value) { push_back(*dst.get_metadata(), value); return true; }
template<typename T> inline bool  append_metadata(com::execution_results&  dst, connection::medium&  src, T* dst2 = nullptr)
{ return append_metadata(dst, sizeof(T), src, dst2); }


/////////////////////////////////////////////////////////////////////////////////////
// Utility functions useful in implementation of data collection 'on_*' methods in target's driver.

bool  append_metadata(connection::medium&  dst, com::record_type  rec_type);
bool  append_typed_bytes(connection::medium&  dst, com::data_type  type, void*  bytes);


}

#endif
