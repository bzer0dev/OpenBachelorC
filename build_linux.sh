#!/usr/bin/env bash
set -e

# Build a standalone Linux executable (onedir) of the OpenBachelorC launcher.
# Mirrors build_exe.ps1 but for Linux.
#
# Requires: pipx + poetry (the project's venv must be set up first, see setup.cmd / Makefile).

pipx run poetry run pyinstaller \
    --collect-all frida \
    --collect-all lief \
    src/win_binary/main.py

# The launcher resolves its data relative to the executable's directory,
# so copy the runtime assets next to it (same as build_exe.ps1).
cp -r conf frida-gadget frida-server platform-tools rel dist/main/

echo
echo "built: dist/main/main"
echo "next: put your Arknights.exe path in dist/main/ak_exe_filepath.txt"
echo "      (or run setup_pc.py from inside dist/main/ to generate it)"
