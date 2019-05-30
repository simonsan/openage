# Cross compiling documentation

I use CLion, but we will also try to make documentation for other steps on setting up a cross building environment, e.g. docker.

## For Windows on Linux (VM)

### Install and set up Windows subsystem for Linux (WSL)
[Follow this guide to get WSL (ubuntu) up and running](https://docs.microsoft.com/en-us/windows/wsl/install-win10)

Afterwards start ubuntu one time to set up the OS part.

### CLion -> WSL
[Follow this guide to get CLion up and running with WSL](https://www.jetbrains.com/help/clion/how-to-use-wsl-development-environment-in-clion.html)

### Visual Studio Code -> WSL
[Follow this instructions to get VS Code up and running with WSL](https://code.visualstudio.com/docs/cpp/config-wsl)


### Visual Studio -> WSL
[Targeting the Windows Subsystem (WSL) for Linux from Visual Studio](https://devblogs.microsoft.com/cppblog/targeting-windows-subsystem-for-linux-from-visual-studio/)

### Install linux dependencies for openage and nyan

Install cmake, gcc, or/and clang (and optionally build-essentials package), as follows:

`sudo apt-get install gcc clang gdb build-essential cmake cython3 libeigen3-dev libepoxy-dev libfontconfig1-dev libfreetype6-dev libharfbuzz-dev libogg-dev libopus-dev libopusfile-dev libpng-dev libsdl2-dev libsdl2-image-dev python3-dev python3-jinja2 python3-numpy python3-pil python3-pip python3-pygments qml-module-qtquick-controls qtdeclarative5-dev flex mingw-w64 mingw-w64-x86-64-dev mingw-w64-tools libpython3.6-dbg python3.6-dbg`


## For Windows on Windows

The older Visual Studio 2017 Community Edition is not promoted by Microsoft anymore, so you'll need to download it from other websites, e.g. [Visual Studio Community 2017 on Techspot](https://www.techspot.com/downloads/downloadnow/6278/?evp=ec1cdb914a1b435daaf013a4a084b093&file=1).

Afterwards you should set up a [non cross compiling environment](https://github.com/SFTtech/openage/blob/master/doc/build_instructions/windows_msvc.md) for testing puproses and figuring out dependencies.


### Windows dependencies

  - cmake
  - Python
    - pip
    - precombiled std binaries
    - debug binaries
    - Python modules: cython numpy pillow pygments pyreadline Jinja2
  - Qt (see vcpkg, but also available as prebuilt)
    - qt5-base
    - qt5-declarative
    - qt5-quickcontrols
  - SDL2 (incl. sdl2, sdl2-image) (vcpkg)
  - vcpkg-packages 
    - including: dirent eigen3 fontconfig freetype harfbuzz libepoxy libogg libpng opus opusfile qt5-base qt5-declarative qt5-quickcontrols sdl2 sdl2-image
  - nyan
    - cmake
    - msvc
    - flex

### Dependencies seperated for target & host environment
#### host dependencies at build time
  - [ ] gcc >=7 or clang >=5
  - [ ] python >=3.4
  - [ ] cython >=0.25
  - [ ] cmake >=3.8.0
  - [ ] opengl >=3.3
  - [ ] libepoxy
  - [ ] libpng
  - [ ] eigen >=3
  - [ ] freetype2
  - [ ] fontconfig
  - [ ] harfbuzz >=1.0.0
  - [ ] nyan
  - [ ] ncurses (optional)
  - [ ] jinja2
  - [ ] sdl2
  - [ ] sdl2_image
  - [ ] opusfile
  - [ ] opus
  - [ ] ogg
  - [ ] pygments
  - [ ] qt5 >=5.9 (Core, Quick, Quickcontrols modules)
  - [ ] vulkan (optional)
  

#### target's dependencies for deployment
  - [ ] python >=3.4
  - [ ] numpy
  - [ ] python imaging library (PIL) -> pillow
  - [ ] opengl >=3.3
  - [ ] libepoxy
  - [ ] libpng
  - [ ] dejavu font
  - [ ] eigen >=3
  - [ ] freetype2
  - [ ] fontconfig
  - [ ] harfbuzz >=1.0.0
  - [ ] nyan
  - [ ] ncurses (optional)
  - [ ] sdl2
  - [ ] sdl2_image
  - [ ] opusfile
  - [ ] opus
  - [ ] ogg
  - [ ] qt5 >=5.9 (Core, Quick, Quickcontrols modules)
  - [ ] vulkan (optional)
  
  + Age of Empires II TC 1.0c, FE, HD<=4.3

# Notes

## cpack

  - Dependency: [NSIS](http://nsis.sourceforge.net) needs to be installed 

## openage
  - searches for SDL2d.dll in path, but not in the debug path --> add to instructions
    - <vcpkg-dir>\installed\x64-windows\debug\bin
    - vcpkg obviously hardcodes path-dirs in already compiled and installed packages (qt) --> recommended to recompile everything when moved to another dir
      - moved `<vcpkg-dir>\installed` to old location for qt-libraries
    - conversion not running thorugh, getting stuck at `INFO [py] [1338/3484] graphics/1008.slp`
      - even with `run.exe convert --devmode --force --gen-extra-files --verbose --no-pickle-cache`
      - will convert it on a linux build and try to run openage again
        - if it works --> converter debugging
        - if not --> search build log for errors
    - enum_-Test throws exception `unexpected value: ::testenum_value::foo`

## cmake for Flex with chocolatey
First invocation of cmake

`<path-to-cmake-dir>\cmake.exe -DCMAKE_TOOLCHAIN_FILE=C:/vcpkg/scripts/buildsystems/vcpkg.cmake -DDOWNLOAD_NYAN=YES -DFLEX_EXECUTABLE=C:/ProgramData/chocolatey/bin/win_flex.exe -G "Visual Studio 15 2017 Win64" ..`

Second invocation of cmake to build

`<path-to-cmake-dir>\cmake.exe --build . --config RelWithDebInfo -- /nologo /m /v:m`

## vcpkg

  - Clone directly in one of the higher directories for shorter `<path>` names while building procedures, build could fail for some packages otherwise

  - All MSBuild C++ projects can now #include any installed libraries. Linking will be handled automatically. Installing new libraries will make them instantly available.

  - CMake projects should use: `"-DCMAKE_TOOLCHAIN_FILE=<vcpkg dir>/scripts/buildsystems/vcpkg.cmake"`

  - you need the English language packages (`Modify` in VS installer) 

## package cmake targets

The package eigen3:x86-windows provides CMake targets:

    find_package(Eigen3 CONFIG REQUIRED)
    target_link_libraries(main PRIVATE Eigen3::Eigen)

The package libpng:x86-windows provides CMake targets:

    find_package(libpng CONFIG REQUIRED)
    target_link_libraries(main PRIVATE png)

The package freetype is compatible with built-in CMake targets:

    find_package(Freetype REQUIRED)
    target_link_libraries(main PRIVATE Freetype::Freetype)

The package fontconfig:x86-windows provides CMake targets:

    find_package(unofficial-fontconfig CONFIG REQUIRED)
    target_link_libraries(main PRIVATE unofficial::fontconfig::fontconfig)

The package harfbuzz:x86-windows provides CMake targets:

    find_package(harfbuzz CONFIG REQUIRED)
    target_link_libraries(main PRIVATE harfbuzz::harfbuzz)

The package libogg:x86-windows provides CMake targets:

    find_package(Ogg CONFIG REQUIRED)
    target_link_libraries(main PRIVATE Ogg::Ogg)

The package opus:x86-windows provides CMake targets:

    find_package(Opus CONFIG REQUIRED)
    target_link_libraries(main PRIVATE Opus::opus)

The package qt5-base:x86-windows provides CMake targets:

    find_package(Qt5Concurrent CONFIG REQUIRED)
    target_link_libraries(main PRIVATE Qt5::Concurrent Qt5::ConcurrentPrivate)

    find_package(Qt5Core CONFIG REQUIRED)
    target_link_libraries(main PRIVATE Qt5::Core Qt5::WinMain Qt5::CorePrivate rcc_object_${outfilename})

    find_package(Qt5DBus CONFIG REQUIRED)
    target_link_libraries(main PRIVATE Qt5::DBus Qt5::DBusPrivate)

    find_package(Qt5Gui CONFIG REQUIRED)
    # Note: 9 target(s) were omitted.
    target_link_libraries(main PRIVATE Qt5::Gui Qt5::Gui_EGL Qt5::GuiPrivate Qt5::Gui_GLESv2)

    find_package(Qt5Network CONFIG REQUIRED)
    target_link_libraries(main PRIVATE Qt5::Network Qt5::NetworkPrivate Qt5::QGenericEnginePlugin)

    find_package(Qt5OpenGL CONFIG REQUIRED)
    target_link_libraries(main PRIVATE Qt5::OpenGL Qt5::OpenGLPrivate)

    find_package(Qt5OpenGLExtensions CONFIG REQUIRED)
    target_link_libraries(main PRIVATE Qt5::OpenGLExtensions Qt5::OpenGLExtensionsPrivate)

    find_package(Qt5PrintSupport CONFIG REQUIRED)
    target_link_libraries(main PRIVATE Qt5::PrintSupport Qt5::PrintSupportPrivate Qt5::QWindowsPrinterSupportPlugin)

    find_package(Qt5Sql CONFIG REQUIRED)
    # Note: 1 target(s) were omitted.
    target_link_libraries(main PRIVATE Qt5::Sql Qt5::SqlPrivate Qt5::QODBCDriverPlugin Qt5::QPSQLDriverPlugin)

    find_package(Qt5Test CONFIG REQUIRED)
    target_link_libraries(main PRIVATE Qt5::Test Qt5::TestPrivate)

    find_package(Qt5Widgets CONFIG REQUIRED)
    target_link_libraries(main PRIVATE Qt5::Widgets Qt5::WidgetsPrivate Qt5::QWindowsVistaStylePlugin)

    find_package(Qt5Xml CONFIG REQUIRED)
    target_link_libraries(main PRIVATE Qt5::Xml Qt5::XmlPrivate)

The package qt5-declarative:x86-windows provides CMake targets:

    find_package(Qt5Qml CONFIG REQUIRED)
    # Note: 9 target(s) were omitted.
    target_link_libraries(main PRIVATE Qt5::Qml Qt5::QmlPrivate Qt5::QQmlDebugServerFactory Qt5::QQmlPreviewServiceFactory)

    find_package(Qt5Quick CONFIG REQUIRED)
    target_link_libraries(main PRIVATE Qt5::Quick Qt5::QuickPrivate Qt5::QSGD3D12Adaptation)

    find_package(Qt5QuickTest CONFIG REQUIRED)
    target_link_libraries(main PRIVATE Qt5::QuickTest Qt5::QuickTestPrivate)

    find_package(Qt5QuickWidgets CONFIG REQUIRED)
    target_link_libraries(main PRIVATE Qt5::QuickWidgets Qt5::QuickWidgetsPrivate)

The package sdl2:x86-windows provides CMake targets:

    find_package(SDL2 CONFIG REQUIRED)
    target_link_libraries(main PRIVATE SDL2::SDL2 SDL2::SDL2main)

The package sdl2-image:x86-windows provides CMake targets:

    find_package(sdl2-image CONFIG REQUIRED)
    target_link_libraries(main PRIVATE SDL2::SDL2_image)
