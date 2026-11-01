#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm bash

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

echo "Getting app..."
echo "---------------------------------------------------------------"
VERSION=1.1.1
echo "$VERSION" > ~/version
wget https://github.com/Interkarma/daggerfall-unity/releases/download/v1.1.1-cve-2025/dfu_linux_64bit-v${VERSION}.zip
wget -O DaggerfallGameFiles.zip "https://drive.usercontent.google.com/download?id=0B0i8ZocaUWLGWHc1WlF3dHNUNTQ&export=download&confirm=yes"

mkdir -p ./AppDir/bin/engine ./AppDir/bin/data
bsdtar -xf dfu_linux_64bit-v${VERSION}.zip -C ./AppDir/bin/engine
bsdtar -xf DaggerfallGameFiles.zip -C ./AppDir/bin/data
