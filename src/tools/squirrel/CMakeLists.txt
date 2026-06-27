set(THIS_TARGET_NAME squirrel)

file(GLOB "${THIS_TARGET_NAME}_HPP" "./*.hpp")
file(GLOB "${THIS_TARGET_NAME}_CPP" "./*.cpp")

add_executable(${THIS_TARGET_NAME}
    "${${THIS_TARGET_NAME}_HPP}"
    "${${THIS_TARGET_NAME}_CPP}"
    )

target_link_libraries(${THIS_TARGET_NAME}
    com
    utility
    sala
    cps
    chickaree
    iomodels
    Threads::Threads
    ${BOOST_LIST_OF_LIBRARIES_TO_LINK_WITH}
    )

if (LIBRT)
    target_link_libraries(${THIS_TARGET_NAME} ${LIBRT})
endif()

set_target_properties(${THIS_TARGET_NAME} PROPERTIES
    DEBUG_OUTPUT_NAME "${THIS_TARGET_NAME}_${CMAKE_SYSTEM_NAME}_Debug"
    RELEASE_OUTPUT_NAME "${THIS_TARGET_NAME}_${CMAKE_SYSTEM_NAME}_Release"
    RELWITHDEBINFO_OUTPUT_NAME "${THIS_TARGET_NAME}_${CMAKE_SYSTEM_NAME}_RelWithDebInfo"
    )

install(TARGETS ${THIS_TARGET_NAME} DESTINATION "tools")
