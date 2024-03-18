---
sidebar_position: 1
---

# About ProLinux Server

ProLinux Server is a container host platform powered by **podman**, an OCI compliant container manager with Docker compatibility, and standalone application server powered by **PM2**. Together they let you run any workload with ease.

ProLinux Server's immutable root and A/B atomic updates makes it a a trusted and reliable platform for running your applications.

# Managing Containers with Podman
ProLinux provides the native `podman` command as well as the `docker` command compatibility package.

Because of the immutable root, you should mount your directory volumes inside `/home/user/` for data persistence. Named volumes are persisted automatically.

[Podman Documentation](https://podman.io/docs)

# Managing Applications with PM2
The `pm2` command is a process manager that lets you spawn and run applications in the background, with logging/monitoring and auto restart features. It's a great way to clone your projects from git and run them as a service, launching a Node.JS or Python source file, script, or binary.

PM2 also has advanced features such as a built in load-balancer with the ability to spawn multiple of your server processes.

[PM2 Documentation](https://pm2.keymetrics.io/docs/usage/quick-start/)

# ProLinux 2 Server Roles
Server Roles define predefined infrastructure configuration for specific use cases. ProLinux 2 Server comes with the following roles:

- **Sineware SecureSwitch** - Configures a ProLinux Server with multiple NICs as a switch that passes traffic through [Suricata](https://suricata.io/), for Intrusion Detection and Prevention (IPS/IDS). 

Roles can be configured using `plctl server enable <role>` and `plctl server disable <role>` commands.
