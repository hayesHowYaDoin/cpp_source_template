# SPDX-License-Identifier: MIT
#
# SPDX-FileCopyrightText: Copyright (c) 2019-2023 Lars Melchior and contributors

set(CPM_DOWNLOAD_VERSION 0.40.2)
set(CPM_HASH_SUM "CPM_HASH_SUM_PLACEHOLDER")

if(CPM_SOURCE_CACHE)
  set(CPM_DOWNLOAD_LOCATION "${CPM_SOURCE_CACHE}/cpm/CPM.cmake")
elseif(DEFINED ENV{CPM_SOURCE_CACHE})
  set(CPM_DOWNLOAD_LOCATION "$ENV{CPM_SOURCE_CACHE}/cpm/CPM.cmake")
else()
  set(CPM_DOWNLOAD_LOCATION "${CMAKE_BINARY_DIR}/cmake/CPM.cmake")
endif()

# Expand relative path. This is important if the provided path contains a tilde (~)
get_filename_component(CPM_DOWNLOAD_LOCATION ${CPM_DOWNLOAD_LOCATION} ABSOLUTE)
message(STATUS "Downloading CPM.cmake to ${CPM_DOWNLOAD_LOCATION}")

file(DOWNLOAD
     https://github.com/cpm-cmake/CPM.cmake/releases/download/v${CPM_DOWNLOAD_VERSION}/CPM.cmake
     ${CPM_DOWNLOAD_LOCATION} STATUS DOWNLOAD_RESULTS
)

list(GET DOWNLOAD_RESULTS 0 DOWNLOAD_RESULT_CODE)
list(GET DOWNLOAD_RESULTS 1 DOWNLOAD_RESULT_STRING)
if(DOWNLOAD_RESULT_CODE GREATER 0)
  file(REMOVE ${CPM_DOWNLOAD_LOCATION})
  message(FATAL_ERROR "Failed to download CPM: ${DOWNLOAD_RESULT_STRING}")
endif()

get_filename_component(CPM_INCLUDE_DIRECTORY ${CPM_DOWNLOAD_LOCATION} DIRECTORY)
list(APPEND CMAKE_MODULE_PATH ${CPM_INCLUDE_DIRECTORY})