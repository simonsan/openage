# Procedure for Microsoft Windows users (Windows 10) with MSYS2

__NOTE:__ We also have an installer for Win10 (x64), if you just want to play around with *openage* you can find it [here](https://github.com/SFTtech/openage/releases).

 Since Windows doesn't offer a native package manager, we use MSYS2 ecosystem and pull in dependencies for openage as [packages via Pacman](https://www.msys2.org/wiki/Using-packages/).

 *Please remember to replace the directories referenced below (written in <...>) with the appropriate values.*

## Dependencies
### MSYS2
  - Download and follow the install instructions for [MSYS2](https://www.msys2.org/)
  - Start a MSYS2-shell from `<MSYS2-directory>/msys2_shell.cmd`
  - Install the dependencies (make sure you have an up-to-date package database):

For gcc: `pacman -Syu --needed mingw-w64-x86_64-gcc`

For clang (untested): `pacman -Syu --needed mingw-w64-x86_64-clang`


`pacman -Syu --needed git mingw-w64-x86_64-cmake mingw-w64-x86_64-make mingw-w64-x86_64-eigen3 mingw-w64-x86_64-cython mingw-w64-x86_64-libepoxy mingw-w64-x86_64-libogg mingw-w64-x86_64-libpng mingw-w64-x86_64-ttf-dejavu mingw-w64-x86_64-freetype mingw-w64-x86_64-fontconfig mingw-w64-x86_64-harfbuzz mingw-w64-x86_64-SDL2_image mingw-w64-x86_64-SDL2 mingw-w64-x86_64-opusfile mingw-w64-x86_64-opus mingw-w64-x86_64-python mingw-w64-x86_64-python-pip mingw-w64-x86_64-python-pillow mingw-w64-x86_64-python-numpy mingw-w64-x86_64-cython mingw-w64-x86_64-python-pygments mingw-w64-x86_64-python-jinja mingw-w64-x86_64-python-pyreadline mingw-w64-x86_64-qt5`

__**Note:**__ You will need to set up [the dependencies for Nyan](https://github.com/SFTtech/nyan/blob/master/doc/building.md#windows) and build it.
We set `nyan_DIR` to the build directory containing `nyan.dll` later in the building step.


#### Add MingW64 Binary Directory To `$PATH`

Add the `bin`-directory to your `PATH` (in MSYS2 bash):
```
echo "export PATH=/mingw64/bin:mingw64\x86_64-w64-mingw32\bin:$PATH" >> ~/.bashrc
source ~/.bashrc
```

## Building openage
 Note that openage doesn't support completely out-of-source-tree builds yet.
 We will, however, use a separate `build` directory to build the binaries.

__**IMPORTANT:**__ [`MinGW Makefiles`](https://cmake.org/cmake/help/v3.12/generator/MinGW%20Makefiles.html#generator:MinGW%20Makefiles) flag for the generator, means that CMake generates makefiles for use with `mingw32-make`
under a Windows command prompt (CMD). So you need to add the path to the `<msys2-install-dir>/mingw64/bin` as well to your [Windows `PATH` environment variable](https://lmgtfy.com/?q=windows+add+folder+to+path+environment&s=d).
 
```
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_MAKE_PROGRAM=mingw32-make -Dnyan_DIR=<nyan-build-dir> -Wno-dev -G "CodeBlocks - MinGW Makefiles" ..
```

Navigate to the `build`-directory within your systems file explorer and put `cmd` into the adress bar. This should start up a cmd shell inside that folder.
Now start the build process in the cmd shell with this command:

`mingw32-make -j2 VERBOSE=1`


__**Note (manually prebuilt nyan):**__ If you built nyan separately and it wasn't automatically registered with CMake
you will need to set `-Dnyan_DIR=<nyan-Directory>` to the `build`-Directory [containing `nyan.dll`]

__**Note (automatically build nyan):**__ If you want to download and build Nyan automatically install these additional dependencies:

`pacman -Syu mingw-w64-x86_64-dlfcn flex`
and add `-DDOWNLOAD_NYAN=YES -DFLEX_EXECUTABLE=/usr/bin/flex.exe` to the first cmake command

## Running openage
> Work in Progress

## Packaging
> Work in Progress
