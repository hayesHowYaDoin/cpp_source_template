cmake_minimum_required(VERSION 3.16)

project(cpp_source_template)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/tools/cmake)

include(cpp)
include(get_cpm)

option(PACKAGE_TESTS "Build tests" ON)
if(PACKAGE_TESTS)
    include(test)
endif()

add_subdirectory(libs)