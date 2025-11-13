# Eyedropper-AppImage 🐧

[![GitHub Downloads](https://img.shields.io/github/downloads/pkgforge-dev/Eyedropper-AppImage/total?logo=github&label=GitHub%20Downloads)](https://github.com/pkgforge-dev/Eyedropper-AppImage/releases/latest)
[![CI Build Status](https://github.com//pkgforge-dev/Eyedropper-AppImage/actions/workflows/blank.yml/badge.svg)](https://github.com/pkgforge-dev/Eyedropper-AppImage/releases/latest)

<p align="center">
  <img src="https://raw.githubusercontent.com/FineFindus/eyedropper/refs/heads/main/data/icons/com.github.finefindus.eyedropper.svg" width="128" />
</p>

* [Latest Stable Release](https://github.com/pkgforge-dev/Eyedropper-AppImage/releases/latest)

---

AppImage made using [sharun](https://github.com/VHSgunzo/sharun), which makes it extremely easy to turn any binary into a portable package without using containers or similar tricks. 

**This AppImage bundles everything and should work on any linux distro, even on musl based ones.**

It is possible that this appimage may fail to work with appimagelauncher, I recommend these alternatives instead: 

* [AM](https://github.com/ivan-hc/AM) `am -i eyedropper` or `appman -i eyedropper`

* [dbin](https://github.com/xplshn/dbin) `dbin install eyedropper.appimage`

* [soar](https://github.com/pkgforge/soar) `soar install eyedropper`

This appimage works without fuse2 as it can use fuse3 instead, it can also work without fuse at all thanks to the [uruntime](https://github.com/VHSgunzo/uruntime)

<details>
  <summary><b><i>raison d'être</i></b></summary>
    <img src="https://github.com/user-attachments/assets/d40067a6-37d2-4784-927c-2c7f7cc6104b" alt="Inspiration Image">
  </a>
</details>

More at: [AnyLinux-AppImages](https://pkgforge-dev.github.io/Anylinux-AppImages/)

---

## Known quirks

- Picking colors only works if the screenshot freedesktop portal is installed on the host (same as upstream).
- Global keyboard shortcut doesn't work (at least in Gnome, KDE is not tested)
- Search-provider integration works only on Gnome (same as upstream) & it depends on:
  - the desktop file being present (which AppImage managers like `soar` & `am` already take care of).  
    Desktop file needs to be named `com.github.finefindus.eyedropper.desktop` for it to work.  
    The only exception is the detection for desktop file `authenticator-AM.desktop` in local directories, which is added as a support for `am` AppImage manager.
  - the `XDG_DATA_DIRS` variable having the `XDG_DATA_HOME` in path, which the AppImage will detect if not present + warn about & suggest the solution.
  - This operation won't be performed if search integration files already exist in `/usr/share/` or `/usr/local/share/`, as it's assumed that the packager and/or system-administrator already handled that integration to the system. Modifying `XDG_DATA_DIRS` in that case is not needed.
  - If you use the AppImage portable folders feature, you only need to use portable `appimage-filename.config` and `appimage-filename.cache` folder to make the search-provider functionality work.
    - Those are the files that need to be in host's `${XDG_DATA_HOME}` for search-provider functionality to work, which you can delete after the app uninstallation, along with other app dotfiles:
      - `${XDG_DATA_HOME}/gnome-shell/search-providers/com.github.finefindus.eyedropper.search-provider.ini`
      - `${XDG_DATA_HOME}/dbus-1/services/com.github.finefindus.eyedropper.SearchProvider.service`
  - When you click the color code entry to copy the code, it will copy it, but the notification about it won't show
