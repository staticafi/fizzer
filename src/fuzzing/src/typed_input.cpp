#include <fuzzing/typed_input.hpp>
#include <utility/assumptions.hpp>
#include <algorithm>

namespace  fuzzing {


typed_input::typed_input(input_bytes_ptr const  bytes, input_types_ptr const  types, input_metadata_ptr const  meta)
    : m_bytes{ bytes }
    , m_types{ types }
    , m_meta{ meta }
    , m_bits{}
    , m_bit_end_indices_of_types{}
{
    bytes_to_bits(*bytes, m_bits);
    natural_32_bit  idx = 0U;
    m_bit_end_indices_of_types.reserve(types->size());
    for (data_type  type : *types)
    {
        idx += num_bits(type);
        m_bit_end_indices_of_types.push_back(idx - 1U);
    }
    ASSUMPTION(idx == m_bits.size());
}


natural_32_bit  typed_input::type_index(natural_32_bit const  bit_index) const
{
    ASSUMPTION(bit_index < (natural_32_bit)m_bits.size());
    return (natural_32_bit)std::distance(
                m_bit_end_indices_of_types.begin(),
                std::lower_bound(
                        m_bit_end_indices_of_types.begin(),
                        m_bit_end_indices_of_types.end(),
                        bit_index
                        )
                );
}


}
