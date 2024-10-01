---
title: Using ProLinux
menu_order: 1
---

# Using ProLinux

<!--## Debugging using SSH over USB
ProLinux Mobile devices expose an ethernet interface over their USB port. When plugged into a computer running Linux, you can ssh into the phone using `ssh user@172.16.42.1`. -->

## Installing Apps

Apps on ProLinux are installed using [Flatpak](https://flatpak.org/), a universal package manager and sandboxed software runtime.

You can use the Flatpak CLI (from [Flathub](https://flathub.org/en), the default repository) to install apps, or install them using the Discover app.

## Command Line Configuration
`plctl` is the main command that interacts with ProLinuxD to modify the system configuration.

![plctl help output](/_images/plctl-output.png)