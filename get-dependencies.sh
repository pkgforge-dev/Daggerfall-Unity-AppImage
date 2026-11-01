#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm bash

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

# Comment this out if you need an AUR package
#make-aur-package daggerfall-unity-bin

echo "Getting app..."
echo "---------------------------------------------------------------"
wget https://github.com/Interkarma/daggerfall-unity/releases/download/v1.1.1-cve-2025/dfu_linux_64bit-v1.1.1.zip




mkdir -p ./AppDir/bin
mv -v /usr/share/daggerfall-unity/settings-template.ini ./AppDir/bin
mv -v /opt/daggerfall-unity/* ./AppDir/bin
