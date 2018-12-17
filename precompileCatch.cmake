#
# Copyright (c) 2018 Eldar Zakirov
#
# Dear Reader,
#
# This software can be freely used for any purposes that don't go against
# norms of Islam. Hence, this software shouldn't be used to implement, fix
# or improve the solutions for riba-based banks and other organizations
# that are prohibited in Islam.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#
# -----------------------------------------------------------------------------
# A CMake module for the precompilation of Catch2 unit-test framework.
#
# Usage:
#     precompileCatch(target_to_create)
#
# Description:
#
# The functionality provided in this module is aimed to increase the
# compilation speed of unit-tests based on testing framework Catch2.
#
# The provided macro creates a target with the name ${target_to_create}
# which points to a translation unit with defined CATCH_CONFIG_MAIN and
# included <catch2/catch.hpp>.
# For more details about precompilation and CATCH_CONFIG_MAIN see:
# https://github.com/catchorg/Catch2/blob/master/docs/slow-compiles.md
#
# The usual way to use this macro is:
#
#   ---------- MyTestsConfig.cmake ----------
#
#   # Create a target my_tests_config which will be linked to all your tests.
#   precompileCatch(my_tests_config)
#
#   target_compile_options(my_tests_config
#       PUBLIC
#       ...prefered compiler options for all your tests...
#   )
#
#   target_include_directories(my_tests_config
#       PUBLIC
#       ...path to Catch2's include directory....
#   )
#

macro(precompileCatch target_to_create)
    if(NOT TARGET ${target_to_create})
        if (NOT EXISTS ${CMAKE_CURRENT_BINARY_DIR}/catch.precompiled.cpp)
            file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/catch.precompiled.cpp
                "#define CATCH_CONFIG_MAIN\n#include <catch2/catch.hpp>"
            )
        endif()

        add_library(${target_to_create} STATIC
            ${CMAKE_CURRENT_BINARY_DIR}/catch.precompiled.cpp
        )
    endif()
endmacro()
