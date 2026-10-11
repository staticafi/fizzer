#include <fuzzing/typed_input.hpp>
#include <iomodels/parse_utils.hpp>
#include <utility/assumptions.hpp>
#include <algorithm>

namespace  fuzzing {


typed_input::typed_input(input_bytes_ptr const  bytes, input_types_ptr const  types, input_metadata_ptr const  meta)
    : m_bytes{ bytes }
    , m_types{ types }
    , m_meta{ meta }
    , m_bits{}
    , m_bit_end_indices_of_types{}
    , m_metadata_start_indices{ nullptr }
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


vecu32 const&  typed_input::get_metadata_indices() const
{
    if (m_metadata_start_indices == nullptr)
    {
        m_metadata_start_indices = make_unique_wrapper<vecu32>();
        m_metadata_start_indices->reserve(m_types->size() + 1UL);
        m_metadata_start_indices->push_back(0U);
        while (m_metadata_start_indices->back() < (natural_32_bit)m_meta->size())
        {
            natural_32_bit const num_bytes{ iomodels::metadata_record_bytes_count(m_meta->data() + m_metadata_start_indices->back()) };
            m_metadata_start_indices->push_back(m_metadata_start_indices->back() + num_bytes);
        }
        INVARIANT(m_metadata_start_indices->size() == m_types->size() + 1UL);
    }
    return *m_metadata_start_indices;
}


}
