# Useful links regarding crosscompiling on linux for windows


## MingW64
  - [MingW64 not finding system headers](https://stackoverflow.com/questions/55197902/cmake-cross-compiling-linux-to-windows-with-mingw-does-not-find-some-system-hea)
  - [Use mingw and cmake toolchain to cross compile](https://gitlab.kitware.com/cmake/community/wikis/doc/cmake/cross_compiling/Mingw)
  - [Static and Dynamic/Shared Linking with MinGW](https://stackoverflow.com/questions/15852677/static-and-dynamic-shared-linking-with-mingw)
  - [Mingw wiki on gentoo.org](https://wiki.gentoo.org/wiki/Mingw)
  - [Python + Windows + distutils + SWIG + gcc MinGW](https://sebsauvage.net/python/mingw.html)
  - [Setting up a MinGW-w64 build environment](http://ascend4.org/Setting_up_a_MinGW-w64_build_environment#MinGW-w64)
  - [Cross-compiling Windows DLL using MingW on Linux (mxml example)](https://github.com/michaelrsweet/mxml/issues/188)
  - [Guide to Using Microsoft DLLs when Compiling Cygwin or Mingw Programs](http://web.archive.org/web/20100504145028/http://www.emmestech.com:80/moron_guides/moron1.html)
  - [MinGW and Python](https://groups.google.com/forum/#!topic/comp.lang.python/F1WK28BT8m0)
    - [MingW/Python support for MinGW Open Source Compiler](https://groups.google.com/forum/#!topic/comp.lang.python/xq-R7QILSgU%5B1-25%5D)


## cmake
  - [cross compiling with cmake](https://gitlab.kitware.com/cmake/community/wikis/doc/cmake/CrossCompiling)
  - [cmake toolchains from cmake-Manual](https://cmake.org/cmake/help/latest/manual/cmake-toolchains.7.html)
  - [Use mingw and cmake toolchain to cross compile](https://gitlab.kitware.com/cmake/community/wikis/doc/cmake/cross_compiling/Mingw)
  - [cmake example toolchain also for SDL2](https://stackoverflow.com/questions/53800368/how-do-i-cross-compile-from-linux-targeting-windows-using-cmake)
  - [cmake templates for mingW-w64 search (Google)](https://www.google.com/search?hl=en&q=cmake%20toolchain%20mingw-w64)
  - [Use gold linker in cmake toolchain file](https://github.com/frobware/c-hacks/blob/master/cmake/use-gold-linker.cmake)
  - [FindPythonLibs in cmake toolchain file](https://github.com/apache/arrow/blob/master/cpp/cmake_modules/FindPythonLibsNew.cmake)
    - [Find python libs in cmake toolchain](https://stackoverflow.com/questions/24174394/cmake-is-not-able-to-find-python-libraries)
    - [Find Python interpreter, compiler and development environment](https://cmake.org/cmake/help/latest/module/FindPython.html)
  - [cmake toolchain example from mxml with pthreads etc.](https://github.com/tonytheodore/mxml/commit/c362ee66b7d5d0097abd17bb3d7f9a2a01eb5105)
    - [part2](https://github.com/tonytheodore/mxml/commit/d9349f2e57710074235ffa04a97505f688216886)

## msys2
  - [Platform checks in msys2](https://github.com/msys2/msys2/wiki/Porting#platform-checks)  

## docker
  - [Dockerfile for cross compiling toolchain](https://github.com/dockcross/dockcross/blob/master/windows-shared-x64-posix/Dockerfile.in)

## python
  - [Cross-compiling a single Python script on Linux into a Windows executable](https://stackoverflow.com/questions/2950971/cross-compiling-a-python-script-on-linux-into-a-windows-executable/35605479#35605479)
  - [Windows Compilers for python](https://wiki.python.org/moin/WindowsCompilers#GCC_-_MinGW-w64_.28x86.2C_x64.29)
  - [Python + Windows + distutils + SWIG + gcc MinGW](https://sebsauvage.net/python/mingw.html)
  - [Notes on Python compiled with MinGW-w64](https://matthew-brett.github.io/pydagogue/mingw_python.html)
  - [MinGW and Python](https://groups.google.com/forum/#!topic/comp.lang.python/F1WK28BT8m0)
    - [MingW/Python support for MinGW Open Source Compiler](https://groups.google.com/forum/#!topic/comp.lang.python/xq-R7QILSgU%5B1-25%5D)

## Qt
  - [Qt for Windows - Deployment](https://doc.qt.io/qt-5/windows-deployment.html)


## useful tools
  - [Visual Studio Community 2017](https://www.techspot.com/downloads/downloadnow/6278/?evp=ec1cdb914a1b435daaf013a4a084b093&file=1)
  - [crosstool-ng](https://crosstool-ng.github.io/)
  - [mingw-w64-Python package (AUR)](https://aur.archlinux.org/packages/mingw-w64-python)
  - [ELLCC Embedded Compiler Collection clang/LLVM](http://ellcc.org/?page_id=295)
  -[MXE - M cross environment (SDL, Qt, cmake, autotools, pre-compiled binaries, static, shared)](https://github.com/mxe/mxe/)
    - [Website](https://mxe.cc/)
    - [MXE package repository (SDL, etc.)](https://pkg.mxe.cc/pkg/)
  - [Cross compiling toolchains in Docker images](https://github.com/dockcross/dockcross)
  - [Win-builds packages for building](http://win-builds.org/doku.php/download_and_installation_from_windows)
    - [Installation and dependencies on linux](http://win-builds.org/doku.php/download_and_installation_from_linux)
  - [Cross compile environment for python (python>=3.6)](https://pypi.org/project/crossenv/)
  - [Crossdev wrapper scripts for gentoo](https://wiki.gentoo.org/wiki/Crossdev)
    - [Cross build environment with crossdev on gentoo](https://wiki.gentoo.org/wiki/Cross_build_environment)
  - [msys2 mingw packages](https://github.com/msys2/MINGW-packages)
    - [mingw-python 3 patches (msys2)](https://github.com/msys2/MINGW-packages/tree/master/mingw-w64-python3)

## openage issues/PR regarding windows support
  - [Issue #9: Msys2 for building](https://github.com/SFTtech/openage/issues/9)
  - [PR #233: Crosscompile with MingW, run with WINE](https://github.com/SFTtech/openage/pull/233)
  - [PR #867: Windows native support using MSVC](https://github.com/SFTtech/openage/pull/867)
  - [PR #609: Crosscompile for windows with MXE](https://github.com/SFTtech/openage/pull/609)
  - [Issue #934: Compiling in msys2](https://github.com/SFTtech/openage/issues/934)
  - [PR #207: Windows support Msys2](https://github.com/SFTtech/openage/pull/207)
  - [VS2017 support for openage commits](https://github.com/schnema123/openage/commits/VS2017)


## status/recent files
- [cmake toolchain file](https://github.com/simonsan/openage/blob/feature/cc-win10/win64-cc/mingw-w64-x86_64.cmake)
- [Cross compiling documentation](https://github.com/simonsan/openage/blob/feature/cc-win10/win64-cc/cc-doc.md)