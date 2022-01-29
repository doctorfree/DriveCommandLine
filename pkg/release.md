## Overview

The DriveCommandLine package includes gdrive, a command line utility for
interacting with Google Drive and several wrapper scripts for easily performing
many of the Google Drive management tasks the gdrive utility enables from
the command line.

DriveCommandLine can be installed on Linux systems using
either the Debian packaging format or the Red Hat Package Manager (RPM).
Other systems will require a manual installation described below.

## Installation

1. [Debian Package installation](#debian-package-installation)
1. [RPM Package installation](#rpm-package-installation)
1. [Manual installation](#manual-installation)
1. [Authentication and access](#authentication-and-access)

## Debian Package installation

Many Linux distributions, most notably Ubuntu and its derivatives, use the
Debian packaging system.

To tell if a Linux system is Debian based it is usually sufficient to
check for the existence of the file `/etc/debian_version` and/or examine the
contents of the file `/etc/os-release`.

To install on a Debian based Linux system, download the latest Debian format
package from the
[DriveCommandLine Releases](https://gitlab.com/doctorfree/DriveCommandLine/-/releases).

Install the DriveCommandLine package by executing the command

```bash
sudo apt install ./DriveCommandLine_<version>-<release>.linux_<architecture>.deb
```
or
```console
sudo dpkg -i ./DriveCommandLine_<version>-<release>.linux_<architecture>.deb
```

## RPM Package installation

Red Hat Linux, SUSE Linux, and their derivatives use the RPM packaging
format. RPM based Linux distributions include Fedora, AlmaLinux, CentOS,
openSUSE, OpenMandriva, Mandrake Linux, Red Hat Linux, and Oracle Linux.

To install on an RPM based Linux system, download the latest RPM format
package from the
[DriveCommandLine Releases](https://gitlab.com/doctorfree/DriveCommandLine/-/releases).

Install the DriveCommandLine package by executing the command

```bash
sudo yum localinstall ./DriveCommandLine_<version>-<release>.linux_<architecture>.rpm
```
or
```console
sudo rpm -i ./DriveCommandLine_<version>-<release>.linux_<architecture>.rpm
```

## Manual installation

Download the latest compressed tar archive release for your platform
from the latest
[DriveCommandLine Releases](https://gitlab.com/doctorfree/DriveCommandLine/-/releases).

As root, extract the archive. For example, to install on Mac OS X
from the gzip'd tar archive:

```bash
tar xzf /path/to/downloaded/DriveCommandLine_2.1.1-1.darwin_amd64.tgz
```

## Authentication and access

The first time gdrive is launched (i.e. run `gdrive about` in your
terminal not just `gdrive`), you will be prompted for a verification code.
The code is obtained by following the printed url and authenticating with the
google account for the drive you want access to. This will create a token file
inside the .gdrive folder in your home directory. Note that anyone with access
to this file will also have access to your google drive.
If you want to manage multiple drives you can use the global `--config` flag
or set the environment variable `GDRIVE_CONFIG_DIR`.
Example: `GDRIVE_CONFIG_DIR="/home/user/.gdrive-secondary" gdrive list`
You will be prompted for a new verification code if the folder does not exist.

