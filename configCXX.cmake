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
