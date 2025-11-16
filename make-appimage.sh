#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q eyedropper | awk '{print $2; exit}')
export ARCH VERSION
export OUTPATH=./dist
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=/usr/share/icons/hicolor/scalable/apps/com.github.finefindus.eyedropper.svg
export DESKTOP=/usr/share/applications/com.github.finefindus.eyedropper.desktop
export DEPLOY_OPENGL=1
export STARTUPWMCLASS=eyedropper # For Wayland, this is 'com.github.finefindus.eyedropper', so this needs to be changed in desktop file manually by the user in that case until some potential automatic fix exists for this

# Trace and deploy all files and directories needed for the application (including binaries, libraries and others)
quick-sharun /usr/bin/eyedropper

# Turn AppDir into AppImage
quick-sharun --make-appimage
