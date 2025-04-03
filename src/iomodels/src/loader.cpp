#include <iomodels/loader.hpp>
#include <unordered_map>

namespace  iomodels {


bool load_models(
    com::input_bytes const&  bytes,
    com::input_types const&  types,
    com::input_metadata const&  metadata,
    std::vector<iomodel*> const&  models
    )
{
    std::unordered_map<com::record_type, iomodel*> models_map;
    for (auto model : models)
    {
        model->clear();
        models_map.insert({ model->get_record_type(), model });
    }
    com::input_bytes::const_iterator  it_bytes{ bytes.begin() };
    com::input_types::const_iterator  it_types{ types.begin() };
    com::input_metadata::const_iterator  it_meta{ metadata.begin() };
    while (it_types != types.end())
    {
        com::record_type const  rec_id{ com::from_record_id(*it_meta) };
        ++it_meta;
        iomodels::iomodel*  model;
        auto const  it{ models_map.find(rec_id) };
        if (it == models_map.end() || !it->second->parse_record(it_bytes, *it_types, it_meta))
            return false;
        it_bytes += com::num_bytes(*it_types);
        ++it_types;
    }
    return true;
}


}
