#
# showFilesInIDE(file_patterns...)
#
# Parameters:
# file_patterns... -   files to show in IDE
#
# Description:
# Include directory content for convenience in editing in IDE
#
macro(showFilesInIDE)
    string(MD5 TMP_TARGET_NAME ${CMAKE_CURRENT_LIST_FILE})

    math(EXPR TMP_TARGETS_COUNTER "0${TMP_TARGETS_COUNTER} + 1")
    file(GLOB_RECURSE FILES_TO_SHOW ${ARGN})
    add_custom_target("${TMP_TARGET_NAME}${TMP_TARGETS_COUNTER}" ALL SOURCES ${FILES_TO_SHOW})
endmacro()

