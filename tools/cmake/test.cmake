message("${CMAKE_CURRENT_SOURCE_DIR}: Including GTest...")

# Suppress GTest warnings
cmake_policy(SET CMP0003 NEW)
cmake_policy(SET CMP0012 NEW)

find_package(GTest REQUIRED)

enable_testing()
include(GoogleTest)