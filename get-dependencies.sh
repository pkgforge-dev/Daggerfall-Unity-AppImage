#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm \
    libdecor \
    sdl2

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

# Comment this out if you need an AUR package
make-aur-package daggerfall-unity-bin
sed -i "s@DATA_DIR=\"/opt/daggerfall-unity/data\"@DATA_DIR=\"\$APPDIR/bin/data\"@; s@/opt/daggerfall-unity/engine/DaggerfallUnity.x86_64@\$APPDIR/bin/DaggerfallUnity.x86_64@; s@CONFIG_TEMPLATE=\"/usr/share/daggerfall-unity/settings-template.ini\"@CONFIG_TEMPLATE=\"\$APPDIR/bin/settings-template.ini\"@" /usr/bin/daggerfall-unity
mkdir -p ./AppDir/bin
mv -v /usr/bin/daggerfall-unity ./AppDir/bin
mv -v /usr/share/daggerfall-unity/settings-template.ini ./AppDir/bin
mv -v /opt/daggerfall-unity/* ./AppDir/bin

# If the application needs to be manually built that has to be done down here

# if you also have to make nightly releases check for DEVEL_RELEASE = 1
#
# if [ "${DEVEL_RELEASE-}" = 1 ]; then
# 	nightly build steps
# else
# 	regular build steps
# fi
