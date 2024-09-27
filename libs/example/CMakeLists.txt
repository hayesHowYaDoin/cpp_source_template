add_library(example STATIC)
add_library(${PROJECT_NAME}::example ALIAS example)

file(GLOB_RECURSE headers CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/include/*.h")
file(GLOB_RECURSE sources CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp" "${CMAKE_CURRENT_SOURCE_DIR}/include/*.h")
target_sources(example PRIVATE ${headers} ${sources})

target_include_directories(example 
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include/example-${PROJECT_VERSION}>
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/src
)

if(PACKAGE_TESTS)
    add_subdirectory(test)
endif()