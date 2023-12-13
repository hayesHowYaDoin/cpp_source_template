cmake_minimum_required(VERSION 3.28 FATAL_ERROR)
project(header_template)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

add_library(header_template INTERFACE)
add_library(template::example ALIAS header_template)

target_include_directories(header_template INTERFACE include)

option(BUILD_TESTING "Build tests" ON)

add_subdirectory(test)

# if(BUILD_TESTING AND EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/test/CMakeLists.txt")

#   add_subdirectory(test)

# endif()
