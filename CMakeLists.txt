#
# Note: this file isn't for direct use, it is meant for making this repository
# be fetchable by means of CMake FetchContent.
#
project(ez-cmake-modules LANGUAGES NONE)
list(APPEND CMAKE_MODULE_PATH
    ${CMAKE_CURRENT_LIST_DIR})

include(addTest)
