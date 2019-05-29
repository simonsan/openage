# Sample toolchain file for building for Windows from an Ubuntu Linux system.
#
# Typical usage:
#    *) install cross compiler: `sudo apt-get install mingw-w64`
#    *) cd build
#    *) cmake -DCMAKE_TOOLCHAIN_FILE=~/mingw-w64-x86_64.cmake ..

set(CMAKE_SYSTEM_NAME Windows)
set(CMAKE_SYSROOT ../.)
set(BINARY_PREFIX /usr/bin/)
set(TOOLCHAIN_PREFIX x86_64-w64-mingw32)
set(COMPILER_PREFIX ${BINARY_PREFIX}${TOOLCHAIN_PREFIX})
#set(PY_VERSION 3)
#set(Python_ADDITIONAL_VERSIONS 3.6)

# make dir
set(CMAKE_MAKE_PROGRAM ${BINARY_PREFIX}make)

# cross compilers to use for C, C++ and Fortran
set(CMAKE_C_COMPILER ${COMPILER_PREFIX}-gcc-7.3-posix)
set(CMAKE_CXX_COMPILER ${COMPILER_PREFIX}-g++)

# TODO: GCC should link to -lstdc++ if we don't use g++
#set(CMAKE_CXX_COMPILER ${TOOLCHAIN_PREFIX}-gcc-7.3-posix)

set(CMAKE_RC_COMPILER ${COMPILER_PREFIX}-windres)

# target environment on the build host system
#set(CMAKE_FIND_ROOT_PATH /usr/lib/x86_64-linux-gnu/)
set(CMAKE_FIND_ROOT_PATH /usr/${TOOLCHAIN_PREFIX})

# modify default behavior of FIND_XXX() commands
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

##################################################
# include buildsystem features

# Python
# TODO: Fix command to find include dirs automatically
#find_package(Python ${PY_VERSION} REQUIRED)
#set(PYTHON ${BINARY_PATH}python3)
set(PYTHON_EXECUTABLE ${BINARY_PATH}python3)

#set(PYTHON_INCLUDE_DIR `python3 -c 'from distutils.sysconfig import get_python_inc; print(get_python_inc())'`)
#set(PYTHON_LIBRARY `python3 -c 'import distutils.sysconfig as sysconfig; print(sysconfig.get_config_var("LIBDIR"))'`)

# Manually set
#set(PYTHON_INCLUDE_DIR /usr/include/python3.6m)
#set(PYTHON_LIBRARY /usr/lib/)
#set(PYTHON_LIBRARIES /usr/lib/)


# NYAN
set(DOWNLOAD_NYAN YES)


