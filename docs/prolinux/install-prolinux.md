---
sidebar_position: 1
---

# Installing ProLinux 2

Currently ProLinux 2 images are shipped as complete disks images that can be flashed to a devices local storage. Dual-booting is currently not supported.


:::tip

The default password is `147147`

:::


## ProLinux 2 Mobile

:::note

These are very experimental images, so many phone features like calling and SMS are not supported!

:::

### Standard Devices
For mobile devices such as a Pine64 PinePhone or PinePhine Pro, installing is as easy as writing the .img file to an SD Card using dd or Etcher.

### Android-based Devices

For Android-based mobile devices such as the OnePlus 6, there are two files that need to be flashed, the root image (userdata) and the boot image:
```bash
$ fastboot flash boot boot.img
$ fastboot flash userdata oneplus-echilada.img
```

:::tip

The version of fastboot distributed by distros can have issues flashing ProLinux. You may want to use fastboot from the (Google Platform SDK Tools)[https://developer.android.com/tools/releases/platform-tools]

:::

:::warning

The KExec-based boot mechanism is currently disabled by default on Android/SDM845 devices (the modem keeps crashing, we'd love help debugging this!)

This means you **must** download and flash boot.img **after every system update**, or your device will not boot if the kernel modules in the squashfs root have been updated.

:::

## ProLinux 2 Embedded / Server

### x86 UEFI
ProLinux 2 images for UEFI platforms are standard GPT-formatted disk images. Currently there is no standalone installation media, so there are a few alternative installation approaches. If you desire a live environment, you can simply flash and boot ProLinux from a USB. Otherwise,
- Boot a alternate live OS from a USB (ex. Fedora, Ubuntu), and `curl https://cdn.sineware.ca/repo/prolinux/embedded/dev/x64/tablet-x64uefi.img.gz | gunzip | dd of=/dev/sdX bs=4M status=progress` 
- Boot a alternate live OS from a USB, copy/download the ProLinux 2 disk image to external storage, and flash it with dd.
- Flash ProLinux 2 to a USB and boot it, then dd the usb itself (/dev/sdX) to the disk (less recommended)