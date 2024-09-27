add_executable(example)

file(GLOB_RECURSE headers CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/include/*.h")
file(GLOB_RECURSE sources CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp")

target_sources(example PRIVATE ${headers} ${sources})

target_link_libraries(example PRIVATE ${PROJECT_NAME}::example)