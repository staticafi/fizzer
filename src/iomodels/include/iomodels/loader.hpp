#ifndef IOMODELS_LOADER_HPP_INCLUDED
#   define IOMODELS_LOADER_HPP_INCLUDED

#   include <iomodels/iomodel.hpp>
#   include <com/record_type.hpp>
#   include <com/input.hpp>
#   include <vector>

namespace  iomodels {


bool load_models(
    com::input_bytes const&  bytes,
    com::input_types const&  types,
    com::input_metadata const&  metadata,
    std::vector<iomodel*> const&  models
    );


}

#endif
