#
# Copyright (c) 2018 Eldar Zakirov
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
# A CMake module for the convenient adding unit-tests to a project.
#
# Usage:
#     addTest(test_name file_stem [OBJECT_LIBS deps...] [[LIBS] deps...])
#
# Description:
#
# This module, provides a function for adding (registering) unit-tests to
# a project using only one line of code.
#
# Example of usage:
#
#   ---------- CMakeLists.txt ----------
#
#   # Add a test with the name 'Foo' which is written in file 'foo.test.cpp'
#   addTest("Foo" foo)
#
#   # Add test 'Bar' which dependes on target 'some_dependency'
#   addTest("Bar" bar
#       some_dependency
#   )
#

include(CMakeParseArguments)

function(addTest test_name file_stem)
    cmake_parse_arguments(DEPS "" "" "LIBS;OBJECT_LIBS" ${ARGN})

    set(CPP_SOURCE_FILE_NAME
        "${file_stem}.test.cpp")

    get_filename_component(TEST_FILE_NAME ${file_stem} NAME)
    set(TEST_FILE_NAME "${TEST_FILE_NAME}.test")

    add_executable(${TEST_FILE_NAME}
        ${CPP_SOURCE_FILE_NAME}
        ${DEPS_OBJECT_LIBS})

    target_link_libraries(${TEST_FILE_NAME}
        ${DEPS_LIBS}
        ${DEPS_UNPARSED_ARGUMENTS})

    add_test(${test_name} ${TEST_FILE_NAME})
endfunction()
