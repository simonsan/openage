# Todo list for (cross) compiling openage

  - [ ] add nyan win build dependencies and note to openage building instructions
  - [ ] write bootstrap.bat fo easy setting up the environment before first running openage
  - [ ] figure out if it is worth to try to build on MSVC19
  - [ ] what win specific dependencies exist
    - [ ] what has to be manually done and what is taken from system package managers

## Bugs to fix
  - [ ] enum_-Test still fails
    - "The test isn't written in a portable manner - the expected value is dependent on an "implementation-defined" (compiler-specific) value. 
    - Specifically, in `libopenage/util/enum_test.cpp:40,44` the test should be substring find instead of string compare.
  - [ ] find the root cause of run.exe not working with conversion (gets stuck at `INFO [py] [1338/3484] graphics/1008.slp`)
    - workaround: try running `python run.py` instead of run.exe (with the same arguments) -> `run.exe convert --devmode --force --gen-extra-files --verbose --no-pickle-cache`
    - assuming it has something to do with the initialization of global objects in the python process

## Next steps

  - [ ] Create bootstrap.sh/bootstrap.ps1 simplify compiling process
    - [ ] Pull in dependencies automatically


## Dependencies seperated for target & host environment
### host dependencies to fulfill at build time (on Linux)
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
  

### target's dependencies to fulfill for conversion and running (on Windows)
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