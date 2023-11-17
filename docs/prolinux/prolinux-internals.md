---
sidebar_position: 2
---

# ProLinux Internals & Architecture

Sineware ProLinux 2 is a GNU+Linux based operating system that features an immutable root filesystem and an A/B boot scheme. It uses Flatpak as the standard platform for application installation.

An immutable rootfs means that the core system files, such as those in /etc and /usr, are mounted as read-only and cannot be modified. The filesystem itself exists as a SquashFS image. This ensures the entire system can be updated at once, and ensures that system integrity is always maintained.

A/B booting means that two copies of the OS exists on the disk at once (prolinux\_a.squish, prolinux\_b.squish). When the system boots up, it boots into the currently selected file. When an update occurs, it is written to the offline file (ex. if you are booted into prolinux\_a.squish, the new update is written to prolinux\_b.squish) and the selected file is switched for the next boot. This allows seamless updates that does not require extended downtime and this allows a simple rollback in the event of an update that breaks the system.

ProLinux 2 uses Arch Linux and Arch Linux ARM for the base system image during build time, but an end-user is never directly exposed to this (ex. pacman does not work with a locked root, packages are installed in Flatpak runtimes).

## Filesystem Layout

todo

## Initramfs Boot Process
ProLinux boots using a 2-stage kexec boot process. The device firmware first loads the kernel and initramfs from the boot partition.
- Boot Partition Kernel+Initramfs gets loaded and started from PMOS\_BOOT.
- Initramfs finds and mounts the PMOS\_ROOT partition. 
- Initramfs reads the /data/prolinux.toml file and finds which A/B partition to boot into.
- Initramfs mounts the prolinux\_{a/b}.squish root image
- Initramfs executes kexec on the new kernel and initramfs.

KExec allows the currently running kernel to be replaced with a new kernel image. This boot strategy allows the kernel and initramfs to be shipped together with the OS root and be A/B redundant. The kernel+initramfs that exists in /boot is treated like firmware, since it is fundementally unredundant and is only updated if nessesary.

Once the new kernel is booted, the following occurs:
- New Initramfs finds and mounts the PMOS\_ROOT partition, reads the /data/prolinux.toml, mounts the prolinux\_{a/b}.squish file.
- If the root lock is enabled, a OverlayFS is mounted with the squish file and persistroot as the lower dir, and a tmpfs as the upper dir.
- If the root lock is disabled, a OverlayFS is mounted with the squish file as the lower dir, and the persistroot as the upper dir.
- /data/home is bind mounted into the OverlayFS.
- New Initramfs executes switch\_root and systemd begins booting in the constructured root.

## ProLinuxD
The ProLinux Daemon is the service that provides most of the "surface" or API of ProLinux. It is written in NodeJS and started as a systemd service. It performs system configuration (from /sineware/data/prolinux.toml, setting the hostname, etc), and creates a UNIX socket at /tmp/prolinuxd.socket that accepts a websocket connection, and communicates with JSON messages. User-facing tools such as *plctl* and the Qt-based GUI ProLinux Tool communicate with ProLinuxD over this socket to power their functionality.

ProLinuxD is also responsible for registering the device and communicating with Sineware Cloud for remote access and management.

** Example ProLinuxD local socket message **
```json
{
    "action": "string",
    "payload": {}
}
```