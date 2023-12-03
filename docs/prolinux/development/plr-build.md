# Remote Building KDE Components (plr-build)

If you want to hack on the Plasma shell or other KDE apps installed on a ProLinux 2 Mobile device, you can use `plr-build`, a utility shipped with the ProLinux Build System that automates the process of compiling and installing a source tree (from your x86_64 development computer) on an aarch64 device, using distcc in a container with a cross-compiling toolchain to speed up the build.

plr-build connects to the phone over SSH and
- sets up kdesrc-build on the phone
- rsyncs the source tree to the phone
- starts the distcc daemon container on your host
- runs kdesrc-build on the phone


# Requirements
You must have `docker` installed on your development computer to run the distcc daemon container.

# Installing
Checkout the ProLinux Build System repo:
```bash
$ git clone https://github.com/Sineware/prolinux-2
```

plr-build is located under `sdk/plr-build`. So, if you cloned prolinux-2 to your folder, you can invoke it like:
```bash
$ ~/prolinux-2/sdk/plr-build
```

# Usage
Your mobile device must be connected over USB, and the device should be accessible over the USB network at "172.16.42.1". 
Your device's root lock must also be disabled (`plctl root-lock off`), and your device must be connected to the internet.

```bash
$ ~/prolinux-2/sdk/plr-build <kdesrc-build package name> <path to the source tree>
```

<hr />

Let's say you have the plasma-mobile repo checked out on your computer and you made some shell changes. To compile them, you can run:
```bash
$ ~/prolinux-2/sdk/plr-build plasma-mobile .
```
in the plasma-mobile directory. Then, you can restart the shell on your device to see the changes!