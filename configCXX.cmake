include(selectSupportedCXXFlags)

selectSupportedCXXFlags(COMPILER_CXX11_FLAG
    FIRST_VALID_OF
        -std=c++11
        -std=c++0x)

selectSupportedCXXFlags(COMPILER_CXX14_FLAG
    FIRST_VALID_OF
        -std=c++14
        -std=c++1y)

if(MSVC)
    selectSupportedCXXFlags(COMPILER_WALL_FLAG /W4)
else()
    selectSupportedCXXFlags(COMPILER_WALL_FLAG -Wall)

    selectSupportedCXXFlagsToString(COMPILER_ENABLE_SANITIZERS_FLAG
        -fno-sanitize-recover=all
        -fsanitize=address
        -fsanitize=undefined
        -g
        -fno-omit-frame-pointer
        -O1)
endif()

# Enable the eneration of debug symbols under Windows (MSVC), for more details
# see: https://www.wintellect.com/pdb-files-what-every-developer-must-know/
if(MSVC)
    add_compile_options(/Zi)

    # When doing sampling profiling, it might have reason to exchange /OPT:ICF with /OPT:NOICF
    # for more details see: https://blogs.msdn.microsoft.com/oldnewthing/20050322-00/?p=36113
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} /DEBUG /OPT:REF /OPT:ICF")
endif()
