message("${CMAKE_CURRENT_SOURCE_DIR}: Including GTest...")

include(CPM)

CPMAddPackage(
  NAME googletest
  GITHUB_REPOSITORY google/googletest
  GIT_TAG v1.15.2
  VERSION 1.15.2
  OPTIONS "INSTALL_GTEST ON" "gtest_force_shared_crt"
)

include(GoogleTest)

enable_testing()
