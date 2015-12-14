#
# showFilesInIDE(file_paths...)
#
# Parameters:
# file_paths... -   files that shall be accessible from IDE
#
# Description:
# Include directory content for convenience in editing in IDE
#
macro(showFilesInIDE)
    string(MD5 TMP_TARGET_NAME ${CMAKE_CURRENT_LIST_FILE})

    math(EXPR TMP_TARGETS_COUNTER "0${TMP_TARGETS_COUNTER} + 1")
    add_custom_target("${TMP_TARGET_NAME}${TMP_TARGETS_COUNTER}" ALL SOURCES ${ARGN})
endmacro()

