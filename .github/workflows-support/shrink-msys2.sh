#!/bin/bash

# This file was taken from dosbox-staging,
# Copyright (c) 2019-2020 Kevin R Croft <krcroft@gmail.com>
# It's licensed under the terms of the GPL-2.0-or-later license.
# Modifications Copyright 2020-2020 the openage authors.
# See copying.md for further legal info.

# This script reduces the size of an MSYS2 and MingGW installation
# under Windows. Its main use is to shrink these areas to fit within
# GitHub's cache limits; however it can also be used by end-users wanting
# to save space.
#
# Usage: ./shrink-msys2.sh
#
set -xuo pipefail
set +e

# Clean all the package archives from pacman
pacman -Scc --noconfirm

# TODO Stripping part is temporarily disabled due to GitHub CI problems
#
# Strip binaries using their associated striping tool
for dir in /usr /mingw32 /mingw64; do

# Enter our directory if we have it
cd "${dir}" || continue

# Check if we have an associated stripping tool
if [[ ! -f "bin/strip.exe" ]]; then continue; fi

# Start stripping
find . -type f              \
  \( -iname '*.exe'       \
     -or -iname '*.a'     \
     -or -iname '*.dll'   \
     -or -iname '*.so'    \
  \)                      \
  -a ! -iname 'strip.exe' \
  -print0                 \
| xargs -0 ./bin/strip.exe --strip-unneeded
done

# Delete documentation directories
rm -rf /mingw*/share/man
rm -rf /mingw*/share/doc

# This entire script is best-effort, so always return success
exit 0
