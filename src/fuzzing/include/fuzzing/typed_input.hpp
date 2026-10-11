#ifndef FUZZING_TYPED_INPUT_HPP_INCLUDED
#   define FUZZING_TYPED_INPUT_HPP_INCLUDED

#   include <fuzzing/basic_types.hpp>
#   include <utility/math.hpp>
#   include <utility/smart_ptr_wrapper.hpp>
#   include <memory>

namespace  fuzzing {


struct  typed_input
{
    typed_input(input_bytes_ptr  bytes, input_types_ptr  types, input_metadata_ptr  meta);

    input_bytes_ptr  bytes() const { return m_bytes; }
    input_types_ptr  types() const { return m_types; }
    input_metadata_ptr  meta() const { return m_meta; }

    input_bits const&  bits() const { return m_bits; }

    natural_32_bit  type_index(natural_32_bit  bit_index) const;
    natural_32_bit  type_start_bit_index(natural_32_bit const  type_index) const
    { return type_end_bit_index(type_index) + 1U - com::num_bits(m_types->at(type_index)); }
    natural_32_bit  type_end_bit_index(natural_32_bit const type_index) const { return m_bit_end_indices_of_types.at(type_index); }

    data_type  type_of_bit(natural_32_bit const  bit_index) const { return m_types->at(type_index(bit_index)); }

    natural_32_bit  type_start_metadata_byte_index(natural_32_bit  type_index) const { return get_metadata_indices().at(type_index); }
    natural_32_bit  type_end_metadata_byte_index(natural_32_bit  type_index) const  { return get_metadata_indices().at(type_index + 1U) - 1U; }
    //{ return type_index + 1U >= (natural_32_bit)m_types->size() ? (natural_32_bit)m_meta->size() - 1U : type_start_metadata_byte_index(type_index + 1U); }

private:

    vecu32 const&  get_metadata_indices() const;

    input_bytes_ptr  m_bytes;
    input_types_ptr  m_types;
    input_metadata_ptr  m_meta;
    input_bits  m_bits;
    vecu32  m_bit_end_indices_of_types;
    mutable unique_ptr_wrapper<vecu32>  m_metadata_start_indices;
};

using  typed_input_ptr = std::shared_ptr<typed_input>;


}

#endif
