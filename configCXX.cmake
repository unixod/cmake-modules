include(selectSupportedCXXFlags)

selectSupportedCXXFlags(COMPILER_WALL_FLAG
    -Wall)

selectSupportedCXXFlags(COMPILER_CXX11_FLAG
    FIRST_VALID_OF
        -std=c++11
        -std=c++0x)

