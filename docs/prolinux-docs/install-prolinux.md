---
title: Installing ProLinux
menu_order: 0
---

# Installing ProLinux 2

Currently ProLinux 2 images are shipped as complete disks images that can be flashed to a devices local storage. Dual-booting is currently not supported.


> The username is `user` and the default password is `147147`


## ProLinux 2 Desktop/Embedded & Server

### x86 & ARM64 UEFI
ProLinux 2 images for UEFI platforms are standard GPT-formatted disk images. Currently there is no standalone installation media, so there are a few alternative installation approaches. If you desire a live environment, you can simply flash and boot ProLinux from a USB. Otherwise, the easiest way is to:
- Flash ProLinux 2 to a USB and boot it, then dd the usb itself (/dev/sdX) to the disk

Then you'll want to expand the image to fill the disk space:
```bash
growpart /dev/sdX 2
resize2fs /dev/sdX2
```

**ARM64 builds are more experimental, and currently can only really be booted in virtual machines, or on devices with mainline Linux support and a compliant UEFI+ACPI implementation.**

## ProLinux 2 Mobile

Previously, ProLinux has shipped device-specific images based on a modified PostmarketOS image (modifying the initramfs in the process). For maintainability reasons those images have been deprecated, with the hope that mainline and U-Boot support can mature on more platforms. Therefore, the mobile images share identical hardware support to the desktop images as they are generic UEFI images.

This means that in the near future, the UEFI images will hopefully boot on the PinePhone and PinePhone Pro with Tow-Boot, and on Snapdragon 845 devices (such as the Oneplus 6 and Poco F1) with U-Boot.

<!--:::note

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
-->