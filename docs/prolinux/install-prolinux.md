---
sidebar_position: 1
---

# Installing ProLinux 2

Currently ProLinux 2 images are shipped as complete disks images that can be flashed to a devices local storage. Dual-booting is currently not supported.


## ProLinux 2 Mobile
### Standard Devices
For mobile devices such as a Pine64 PinePhone or PinePhine Pro, installing is as easy as writing the .img file to an SD Card using dd or Etcher.

### Android-based Devices

For Android-based mobile devices such as the OnePlus 6, there are two files that need to be flashed, the root image (userdata) and the boot image:
```bash
$ fastboot flash boot boot.img
$ fastboot flash userdata oneplus-echilada.img
```

## ProLinux 2 Embedded / Server

### x86 UEFI
ProLinux 2 images for UEFI platforms are standard GPT-formatted disk images. Currently there is no standalone installation media, so there are a few alternative installation approaches.
- Boot a live OS from a USB, copy/download the ProLinux 2 disk image to external storage, and flash it with dd.
- Flash ProLinux 2 to a USB and boot it, then dd the usb itself (/dev/sdX) to the disk (less recommended)