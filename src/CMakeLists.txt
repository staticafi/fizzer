if(NOT DEFINED FIZZ_BUILD_ALSO_TOOLS)
    set(FIZZ_BUILD_ALSO_TOOLS "Yes" CACHE STRING "Build also tools? (Yes/No)" FORCE)
endif()
message("Build also tools: " ${FIZZ_BUILD_ALSO_TOOLS})

include_directories(
    "${PROJECT_SOURCE_DIR}/src/utility/include"
    "${PROJECT_SOURCE_DIR}/src/com/include"
    "${PROJECT_SOURCE_DIR}/src/iomodels/include"
    "${PROJECT_SOURCE_DIR}/src/connection/include"
    "${PROJECT_SOURCE_DIR}/src/target/include"
    )
message("Including the following libraries to the build:")
add_subdirectory(./com)
    message("  com")
add_subdirectory(./target)
    message("  target")
add_subdirectory(./iomodels)
    message("  iomodels")
add_subdirectory(./connection)
    message("  connection")
if(FIZZ_BUILD_LIBS_32_BIT STREQUAL "No")
    include_directories(
        "${PROJECT_SOURCE_DIR}/src/sala/include"
        "${PROJECT_SOURCE_DIR}/src/llvmutl/include"
        "${PROJECT_SOURCE_DIR}/src/cps/include"
        "${PROJECT_SOURCE_DIR}/src/chickaree/include"
        )
    add_subdirectory(./sala)
        message("  sala")
    add_subdirectory(./llvmutl)
        message("  llvmutl")
    add_subdirectory(./cps)
        message("  cps")
    add_subdirectory(./chickaree)
        message("  chickaree")
    set(LIBUTILITY_INSTALL_DIR "lib")
else()
    set(LIBUTILITY_INSTALL_DIR "lib32")
endif()
add_subdirectory(./utility)
    message("  utility")
    
if(FIZZ_BUILD_ALSO_TOOLS STREQUAL "Yes")
    if(FIZZ_BUILD_LIBS_32_BIT STREQUAL "No")
        include_directories(
            "${PROJECT_SOURCE_DIR}/src/fuzzing/include"
            "${PROJECT_SOURCE_DIR}/src/tools"
            "${PROJECT_SOURCE_DIR}/src/tools/salac"
            "${PROJECT_SOURCE_DIR}/src/tools/salat"
            "${PROJECT_SOURCE_DIR}/src/tools/squirrel"
            )
        add_subdirectory(./fuzzing)
            message("  fuzzing")
        add_subdirectory(./tools)
    endif()
endif()
