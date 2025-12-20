#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q eyedropper | awk '{print $2; exit}')
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.bg.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=/usr/share/icons/hicolor/scalable/apps/com.github.finefindus.eyedropper.svg
export DESKTOP=/usr/share/applications/com.github.finefindus.eyedropper.desktop
export STARTUPWMCLASS=com.github.finefindus.eyedropper # Default to Wayland's wmclass. For X11, GTK_CLASS_FIX will force the wmclass to be the Wayland one.
export GTK_CLASS_FIX=1

# Trace and deploy all files and directories needed for the application (including binaries, libraries and others)
quick-sharun /usr/bin/eyedropper

## Copy files needed for search integration
mkdir -p ./AppDir/share/gnome-shell/search-providers/
cp -v /usr/share/gnome-shell/search-providers/com.github.finefindus.eyedropper.search-provider.ini ./AppDir/share/gnome-shell/search-providers/com.github.finefindus.eyedropper.search-provider.ini
mkdir -p ./AppDir/share/dbus-1/services/
cp -v /usr/share/dbus-1/services/com.github.finefindus.eyedropper.SearchProvider.service ./AppDir/share/dbus-1/services/com.github.finefindus.eyedropper.SearchProvider.service

# Turn AppDir into AppImage
quick-sharun --make-appimage
