add_executable(test-example)

file(GLOB_RECURSE tests CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/test_*.cpp")
file(GLOB_RECURSE headers CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/*.h")
target_sources(test-example PRIVATE ${tests} ${headers})

target_include_directories(test-example
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
        $<INSTALL_INTERFACE:test-example-${PROJECT_VERSION}>
)

target_link_libraries(test-example
    PUBLIC
        GTest::gtest
        GTest::gtest_main
    PRIVATE 
        ${PROJECT_NAME}::example
)

gtest_discover_tests(test-example)