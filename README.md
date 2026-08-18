<div align="center">

# Eyedropper AppImage 🐧

[![GitHub Downloads](https://img.shields.io/github/downloads/pkgforge-dev/Eyedropper-AppImage/total?logo=github&label=GitHub%20Downloads)](https://github.com/pkgforge-dev/Eyedropper-AppImage/releases/latest)
[![CI Build Status](https://github.com//pkgforge-dev/Eyedropper-AppImage/actions/workflows/appimage.yml/badge.svg)](https://github.com/pkgforge-dev/Eyedropper-AppImage/releases/latest)
[![Latest Stable Release](https://img.shields.io/github/v/release/pkgforge-dev/Eyedropper-AppImage)](https://github.com/pkgforge-dev/Eyedropper-AppImage/releases/latest)

<p align="center">
  <img src="https://raw.githubusercontent.com/FineFindus/eyedropper/refs/heads/main/data/icons/com.github.finefindus.eyedropper.svg" width="128" />
</p>

| Latest Stable Release | Upstream URL |
| :---: | :---: |
| [Click here](https://github.com/pkgforge-dev/Eyedropper-AppImage/releases/latest) | [Click here](https://github.com/FineFindus/eyedropper) |

</div>

---

AppImage made using [quick-sharun](https://github.com/pkgforge-dev/Anylinux-AppImages/blob/main/useful-tools/quick-sharun.sh), which makes it extremely easy to turn any binary into a portable package reliably without using containers or similar tricks. 

**This AppImage bundles everything and it should work on any Linux distro, including old and musl-based ones.**

This AppImage doesn't require FUSE to run at all, thanks to the [uruntime](https://github.com/VHSgunzo/uruntime).

This AppImage is also supplied with the seamless self-updater by default, so any updates to this application won't be missed.  
Self-updater doesn't run if AppImage managers like [am](https://github.com/ivan-hc/AM) or [soar](https://github.com/pkgforge/soar) exist, which manage AppImage integration and updates.  
There is also a prompt and config for opting-out of self-updates if desired.

<details>
  <summary><b><i>Filesize efficiency compared to flatpak</i></b></summary>
    <img src="https://github.com/user-attachments/assets/29576c50-b39c-46c3-8c16-a54999438646" alt="Inspiration Image">
  </a>
</details>

More at: [AnyLinux-AppImages](https://pkgforge-dev.github.io/Anylinux-AppImages/)

---

## Known quirks

- Picking colors only works if the screenshot freedesktop portal is installed on the host (same as upstream).
- Global keyboard shortcut also depends on freedesktop portal and it doesn't work (at least on Gnome, KDE and other DEs are not tested)
- Search-provider integration works only on Gnome (same as upstream) & it depends on:
  - the desktop file being present (which AppImage managers like `soar` & `am` already take care of).  
    Desktop file needs to be named `com.github.finefindus.eyedropper.desktop` for it to work.  
    The only exception is the detection for desktop file `eyedropper-AM.desktop` in local directories, which is added as a support for `am` AppImage manager.
  - the `XDG_DATA_DIRS` variable having the `XDG_DATA_HOME` in path, which the AppImage will detect if not present + warn about & suggest the solution.
  - This operation won't be performed if search integration files already exist in `/usr/share/` or `/usr/local/share/`, as it's assumed that the packager and/or system-administrator already handled that integration to the system. Modifying `XDG_DATA_DIRS` in that case is not needed.
  - If you use the AppImage portable folders feature, those 2 files are made in host's `${HOME}`, which you can delete on app removal:
    - `${XDG_DATA_HOME}/gnome-shell/search-providers/com.github.finefindus.eyedropper.search-provider.ini`
    - `${XDG_DATA_HOME}/dbus-1/services/com.github.finefindus.eyedropper.SearchProvider.service`
  - When you click the color code entry to copy the code, it will copy it, but the notification about it won't show
