# Sample toolchain file for building for Windows from an Ubuntu Linux system.
#
# Typical usage:
#    *) install cross compiler: `sudo apt-get install mingw-w64`
#    *) cd build
#    *) cmake -DCMAKE_TOOLCHAIN_FILE=~/mingw-w64-x86_64.cmake ..

set(CMAKE_SYSTEM_NAME Windows)
set(TOOLCHAIN_PREFIX x86_64-w64-mingw32)

# make dir
set(CMAKE_MAKE_PROGRAM /usr/bin/make)

# Python
set(PYTHON /usr/bin/python3)
set(PYTHON_INCLUDE_DIRS /usr/include/python3.6)
set(PYTHON_LIBRARIES /usr/lib/python3.6/config-3.6m-x86_64-linux-gnu/libpython3.6.so)

# cross compilers to use for C, C++ and Fortran
set(CMAKE_C_COMPILER ${TOOLCHAIN_PREFIX}-gcc-7.3-posix)
set(CMAKE_CXX_COMPILER ${TOOLCHAIN_PREFIX}-gcc-7.3-posix)
set(CMAKE_RC_COMPILER ${TOOLCHAIN_PREFIX}-windres)



# target environment on the build host system
#set(CMAKE_FIND_ROOT_PATH /usr/bin/)

# modify default behavior of FIND_XXX() commands
#set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# NYAN
set(DOWNLOAD_NYAN YES)


