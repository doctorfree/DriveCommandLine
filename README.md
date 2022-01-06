> **"The cosmic operating system uses a command line interface. It runs on
> something like a teletype, with lots of noise and heat; punched-out bits
> flutter down into its hopper like drifting stars. The demiurge sits at his
> teletype, pounding out one command line after another, specifying the values
> of fundamental constants of physics:**
>
> `universe -G 6.672e-11 -e 1.602e-19 -h 6.626e-34 -protonmass 1.673e-27`
>
> **and when he’s finished typing out the command line, his right pinky hesitates
> above the enter key for an aeon or two, wondering what’s going to happen;
> then down it comes—and the whack you hear is another Big Bang."**
>
> ― Neal Stephenson, In the Beginning...Was the Command Line

# DriveCommandLine
This repository maintains a collection of scripts to initialize,
configure, monitor, and manage Google Drive. The packaging includes
a build of the [gdrive command line utility](https://github.com/prasmussen/gdrive).
DriveCommandLine provides several user-friendly features such as native platform
intallation packaging and wrapper scripts that hopefully make the gdrive
utility easier to use. The gdrive binary included in the installation packages
is built from the latest version of the original gdrive repository maintained
by Petter Rasmussen. No changes have been made to the gdrive utility and its
use is described below. What you are getting here is packaging for ease of
installation and maintenance along with user-friendly wrapper scripts and
documentation.

## Table of contents

1. [Overview](#overview)
1. [News](#news)
1. [Prerequisites](#prerequisites)
1. [Installation](#installation)
    1. [Debian package installation](#debian-package-installation)
    1. [RPM package installation](#rpm-package-installation)
    1. [Manual installation](#manual-installation)
1. [Initial setup](#initial-setup)
    1. [Authentication and access](#authentication-and-access)
    1. [DriveCommandLine GDHOME local storage location](#drivecommandline-gdhome-local-storage-location)
1. [Documentation](#documentation)
1. [Motivation](#motivation)
    1. [Introduction to Using the Command Line](#introduction-to-using-the-command-line)
    1. [Why would I need or want command line control of Google Drive](#why-would-i-need-or-want-command-line-control-of-google-drive)
    1. [Why would I need or want the DriveCommandLine wrappers](#why-would-i-need-or-want-the-drivecommandline-wrappers)
1. [Usage](#usage)
    1.  [Getting started](#getting-started)
    1.  [Direct invocation of gdrive](#direct-invocation-of-gdrive)
    1. [Synopsis of gdrive command](#synopsis-of-gdrive-command)
    1. [Synopsis of DriveCommandLine commands](#synopsis-of-drivecommandline-commands)
    1. [Examples](#examples)
1. [Limitations](#limitations)
1. [Compile from source](#compile-from-source)
    1. [Cool feature used by this repository](#cool-feature-used-by-this-repository)

## Overview
The DriveCommandLine package includes gdrive, a command line utility for
interacting with Google Drive and several wrapper scripts for easily performing
many of the Google Drive management tasks the gdrive utility enables from
the command line.

The DriveCommandLine Debian and RPM format installation packages automate
the installation and configuration process.

Currently DriveCommandLine and control scripts include support for:

- Creating local folder IDs for each Google Drive folder or specified folders
- Retrieving info on files or folders in Google Drive by file/folder name
- Listing, downloading, uploading, and removing Google Drive files and folders
- Syncing specified folders to Google Drive
- Syncing from Google Drive
- Retrieving Google Drive folder IDs
- Creation and maintenance of Google Drive sync folders
    - `sync2drive` and `gdupload` can create sync folders from existing non-empty Google Drive folders
    - `sync2drive` and `gdupload` can upload to Google Drive sync folders without limitation
- Unix style manual pages for all commands (see the [DriveCommandLine wiki](https://gitlab.com/doctorfree/DriveCommandLine/-/wikis/home).

## News
#### 28.05.2021
gdrive is finally verified for using sensitive scopes which should fix the
`This app is blocked` error. Note that the project name will show up as
`project-367116221053` when granting access to you account.

## Prerequisites
None, binaries are statically linked.
If you want to [compile from source](#compile-from-source) you need the
[go toolchain](http://golang.org/doc/install) version 1.5 or higher.

## Installation

DriveCommandLine can be installed on Linux systems using
either the Debian packaging format or the Red Hat Package Manager (RPM).
Other systems will require a manual installation described below.

### Debian package installation

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
sudo apt install ./DriveCommandLine_<version>-<release>.deb
```
or
```console
sudo dpkg -i ./DriveCommandLine_<version>-<release>.deb
```

### RPM package installation

Red Hat Linux, SUSE Linux, and their derivatives use the RPM packaging
format. RPM based Linux distributions include Fedora, AlmaLinux, CentOS,
openSUSE, OpenMandriva, Mandrake Linux, Red Hat Linux, and Oracle Linux.

To install on an RPM based Linux system, download the latest RPM format
package from the
[DriveCommandLine Releases](https://gitlab.com/doctorfree/DriveCommandLine/-/releases).

Install the DriveCommandLine package by executing the command

```bash
sudo yum localinstall ./DriveCommandLine_<version>-<release>.rpm
```
or
```console
sudo rpm -i ./DriveCommandLine_<version>-<release>.rpm
```

### Manual installation

Download the latest compressed tar archive release for your platform
from the latest
[DriveCommandLine Releases](https://gitlab.com/doctorfree/DriveCommandLine/-/releases).

As root, extract the archive from the root directory. For example, to install
from the gzip'd tar archive:

```bash
sudo -i
cd /
tar xzf /path/to/downloaded/DriveCommandLine_2.1.1-1-dist.tar.gz
```

## Initial setup

After installing DriveCommandLine it is necessary to perform a couple
of one-time initialization setup tasks. The `gdrive` app must be given
access rights to Google Drive and the DriveCommandLine utilities need
to know where the local Google Drive storage folders reside.

### Authentication and access

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

### DriveCommandLine GDHOME local storage location

The DriveCommandLine utilities use the environment variable **GDHOME**
to access the locally stored mirror of the Google Drive they manage.
This variable is set in the file `$HOME/.gdrive/gdhome`

To initialize this setting, if it was not done during the installation of
the DriveCommandLine package, simply execute any of the DriveCommandLine
utilities. If this variable has not previously been configured, the utility
will prompt you for a path to your local Google Drive storage. For example,
execute the command `gdlist`. If no GDHOME has been set the command will
prompt you to Initialize gdrive home to the current working directory.
If that is where you wish to maintain local Google Drive storage then
enter 'y' or 'Y'. If you prefer another location for local storage then
enter 'n' or 'N' and you will be prompted to "Enter your gdrive home".
Enter the full absolute path to your gdrive home and your GDHOME will
be configured in `$HOME/.gdrive/gdhome`.

These two initialization steps need only be performed once, prior to first
use of the system. Subsequent invocations of `gdrive` or the DriveCommandLine
utilities should not require further initialization unless you wish to
change the location of your local storage or the authentication token expires.

Once you have initialized DriveCommandLine you can populate your local storage
folder with Google Drive folder IDs by running the `getfolderids` command.

## Documentation

Many DriveCommandLine commands have manual pages. Execute `man <command-name>`
to view the manual page for a command. Most commands also have help/usage messages
that can be viewed with the **-u** argument option, e.g. `sync2drive -u`.

Manual pages for these DriveCommandLine commands can be viewed by executing
any of the following commands (click to view the man page online):

- [man gdget](https://gitlab.com/doctorfree/DriveCommandLine/-/blob/master/markdown/gdget.1.md)
- [man gdinfo](https://gitlab.com/doctorfree/DriveCommandLine/-/blob/master/markdown/gdinfo.1.md)
- [man gdlist](https://gitlab.com/doctorfree/DriveCommandLine/-/blob/master/markdown/gdlist.1.md)
- [man gdrm](https://gitlab.com/doctorfree/DriveCommandLine/-/blob/master/markdown/gdrm.1.md)
- [man gdupload](https://gitlab.com/doctorfree/DriveCommandLine/-/blob/master/markdown/gdupload.1.md)
- [man getfolderids](https://gitlab.com/doctorfree/DriveCommandLine/-/blob/master/markdown/getfolderids.1.md)
- [man sync2drive](https://gitlab.com/doctorfree/DriveCommandLine/-/blob/master/markdown/sync2drive.1.md)
- [man sync_from_drive](https://gitlab.com/doctorfree/DriveCommandLine/-/blob/master/markdown/sync_from_drive.1.md)

## Motivation

### Introduction to Using the Command Line

The command line has a long and storied history in computing. Read some of that
history, learn how to open a command line terminal window on various systems,
how to get started using the command line, and see some examples of why the command
line interface is so powerful by reading the DriveCommandLine wiki article
[Introduction to Using the Command Line](https://gitlab.com/doctorfree/DriveCommandLine/-/wikis/Introduction-to-Using-the-Command-Line).

### Why would I need or want command line control of Google Drive

Google Drive provides an easy to use graphical user interface. There is
a browser based user interface and Google Drive apps for most platforms.
These work well enough and suffice for basic upload, download, and sync.

Some users (mostly old propeller head codgers) are comfortable at the
command line and prefer to use it over the tedious mouse clicks required
to get anything done in a graphical user interface.
Different lanes for different brains.

Typically the most significant use case for command line control of anything
is automation. For example, command line control of a service can be used to
schedule uploads/downloads/sync/whatever triggered by some event - time of
day or day of week or modified file/folder. But Google Drive for Desktop
takes care of automated synchronization fairly well.

With Google Drive, for me, the case for command line control is somewhat
different than simple automation. Google Drive presents its own mysteries
and difficulties. For example, scripted/programmatic downloads of files
and folders require the knowledge of the file/folder ID in Google Drive.
That is, Google Drive doesn't uniquely identify assets by name or path
but by an id. The id can be obtained by examining the Google Drive share
link and trimming off most of the url. That's a tedious operation if you
have very many files you wish to add to a programmatic download. Further
complicating matters, in Google Drive two unique and different files or
folders can have the exact same path and name with different IDs.

The primary case for command line control of Google Drive, for me, is the
ability to script/program Google Drive actions. Yes, there is an API and
one could employ the API but that requires significant effort and can be
prone to error.
[Petter Rasmussen's gdrive](https://github.com/prasmussen/gdrive)
has already implemented an excellent command line Google Drive interface
so why not just use that?

Scripting Google Drive actions is especially useful when there are many
files and folders to maintain. For example, if I need to publicly share
several hundred files but privately hide some others in a folder, to do
so manually in the Google Drive app or web interface is extremely tedious.
I can perform this action quickly and easily with a scripted command line.

For some, a good reason for command line control is simple convenience.
If you spend a lot of time in a Shell environment then it is just easier
to type a command that does what you would like than it is to switch windows,
bring up a GUI, click a few times to find what you want, and click to
get it done, then go back to your terminal window and Shell env.

Finally, the command line interface and the associated Google Drive API
can provide capabilities not available in the Google Drive GUI. Searching,
listing, and filtering can be augmented by the plethora of tools available
in a typical Shell environment. You can pipe the output of a `gdrive` command
to grep, sed, awk, and other standard utilities to produce results unavailable
in the GUI. That is, command line control along with the API and Shell
utilities/builtins can extend the capabilities of the Google Drive file
storage and synchronization service.

### Why would I need or want the DriveCommandLine wrappers

Ok, so now we are convinced command line control of Google Drive can be
of benefit. What value, if any, do the DriveCommandLine wrapper scripts
provide? Can't I just use the `gdrive` command with all its useful
features and options? Why install this extra package?

The DriveCommandLine package scripts provide significantly improved usage
over direct invocation of `gdrive`. Many of the operations carried out by
`gdrive` require the Google Drive file or folder ID as an argument to the
command. Often the Google Drive user knows the name of the file/folder but
seldom to we know its ID. We can discover it but it is tedious to do so.
The DriveCommandLine commands wrap the `gdrive` command in a way that
abstracts the Google Drive IDs of files and folders. They allow you to address
your Google Drive files and folders by name and path rather than by ID.

DriveCommandLine commands get around some of the irritating "features"
of Google Drive in a safe and secure manner. For example, Google Drive
and, by extension, the `gdrive` command, will not create a sync folder
for an existing non-empty Google Drive folder. The DriveCommandLine commands
`sync2drive` and `gdupload` overcome this limitation and enable the creation
of sync folders to existing non-empty Google Drive folders wihout losing content.

Furthermore, many `gdrive` commands require a query to identify the Google
Drive asset(s) to act upon. These queries can be difficult to construct and
prone to error. The DriveCommandLine utilities attempt to alleviate this
requirement on the part of the user and construct the appropriate queries
based upon the command line arguments and detected Google Drive IDs.

Finally, the DriveCommandLine utilities not only wrap `gdrive` in a user
friendly and protected manner but extend the capabilities of command line
control of Google Drive. This is primarily accomplished by initializing
a mirror of the user's Google Drive folders in local storage. Each mirrored
local folder is populated with its Google Drive ID. These locally stored
Google Drive IDs can be used to quickly and easily traverse a user's
Google Drive and locate where and if actions should be performed. Other
extensions such as detecting the potential for duplicate file or folder
name creation in Google Drive are also implemented in DriveCommandLine.

## Usage

### Getting started

To get started with DriveCommandLine management of Google Drive, invoke any of
the DriveCommandLine wrapper scripts. These currently include:

- `gdget` - download files/folders from Google Drive
- `gdinfo` - get info on Google Drive files and folders
- `gdlist` - list Google Drive files and folders
- `gdrm` - remove Google Drive files and folders
- `gdupload` - upload files and folders to Google Drive
- `getfolderids` - retrieve Google Drive folder IDs and populate local folders with IDs
- `sync2drive` - sync local files and folders to Google Drive (upload)
- `sync_from_drive` - sync Google Drive files and folders to local storage (download)

The initial invocation of a DriveCommandLine command will prompt to initialize
gdrive home, providing the current working directory as the default. Either accept
the default and use the current working directory as your gdrive home or enter
a path to where you want to manage Google Drive locally. This location, the
"gdrive home", is where local files and folders will be stored and where folder
IDs will be maintained. It can be any folder, preferably not one with other
unrelated work in it and a location with sufficient disk space for your
Google Drive activity.

Once the "gdrive home" has been set and stored in the file `~/.gdrive/gdhome`
and `gdrive` has been authenticated and access granted (see the section on
[Authentication and access](#authentication-and-access)), initialize the local
Google Drive storage home by executing the `getfolderids` command.

This will populate your configured gdrive home with folders that mirror your
Google Drive folders and folder IDs in the file `.folderid` in each of the
mirrored folders.

See the [Documentation section](#documentation) for links to the man pages
for several of the DriveCommandLine commands.

### Direct invocation of gdrive

Most of the actions performed by the DriveCommandLine commands are carried out
by the `gdrive` command. The DriveCommandLine commands simply act as a user
friendly front-end to `gdrive`. All of these actions can be performed by directly
invoking the `gdrive` command if you know the required command syntax and in
many cases, the Google Drive file or folder ID.

The DriveCommandLine utilities do not yet implement every feature and option
supported in `gdrive`. It may on occasion be necessary to invoke `gdrive`
directly to accomplish a task.

An in depth review of `gdrive` command usage along with documentation
and example usage of the `gdrive` command is available in the
[DriveCommandLine wiki man page for gdrive](https://gitlab.com/doctorfree/DriveCommandLine/-/wikis/gdrive.1). The gdrive man page is also available via the
`man` command by executing the command `man gdrive`.

### Synopsis of gdrive command

```
gdrive [global] list [options]                                 List files
gdrive [global] download [options] <fileId>                    Download file or directory
gdrive [global] download query [options] <query>               Download all files and directories matching query
gdrive [global] upload [options] <path>                        Upload file or directory
gdrive [global] upload - [options] <name>                      Upload file from stdin
gdrive [global] update [options] <fileId> <path>               Update file, this creates a new revision of the file
gdrive [global] info [options] <fileId>                        Show file info
gdrive [global] mkdir [options] <name>                         Create directory
gdrive [global] share [options] <fileId>                       Share file or directory
gdrive [global] share list <fileId>                            List files permissions
gdrive [global] share revoke <fileId> <permissionId>           Revoke permission
gdrive [global] delete [options] <fileId>                      Delete file or directory
gdrive [global] sync list [options]                            List all syncable directories on drive
gdrive [global] sync content [options] <fileId>                List content of syncable directory
gdrive [global] sync download [options] <fileId> <path>        Sync drive directory to local directory
gdrive [global] sync upload [options] <path> <fileId>          Sync local directory to drive
gdrive [global] changes [options]                              List file changes
gdrive [global] revision list [options] <fileId>               List file revisions
gdrive [global] revision download [options] <fileId> <revId>   Download revision
gdrive [global] revision delete <fileId> <revId>               Delete file revision
gdrive [global] import [options] <path>                        Upload and convert file to a google document, see 'about import' for available conversions
gdrive [global] export [options] <fileId>                      Export a google document
gdrive [global] about [options]                                Google drive metadata, quota usage
gdrive [global] about import                                   Show supported import formats
gdrive [global] about export                                   Show supported export formats
gdrive version                                                 Print application version
gdrive help                                                    Print help
gdrive help <command>                                          Print command help
gdrive help <command> <subcommand>                             Print subcommand help
```

### Synopsis of DriveCommandLine commands

This section provides a brief synopsis of the command line syntax and options
available for the DriveCommandLine commands. Additional info on each command
is available in the
[DriveCommandLine wiki](https://gitlab.com/doctorfree/DriveCommandLine/-/wikis/home).
Each command also has a manual page available via the `man` command by
executing the command `man <command-name>`, e.g. `man gdinfo`.

#### Get files
```
gdget [-d] [-f] [-n] [-r] [-s] [-p path] [-o] [-u] path/to/fileorfolder [file2 ...]

options:
  -n                    Indicates tell me what you would do but don't do it
  -d                    Indicates delete remote file when download is successful
  -f                    Indicates force overwrite of existing file
  -p <path>             Specifies a download path
  -o                    Indicates write file content to stdout
  -r                    Indicates download directory and its contents recursively
  -s                    Indicates skip existing files
  -u                    Displays this usage message
  path/to/filename      Download Google Drive file `filename` to local folder `path/to`
  path/to/foldername    Download Google Drive folder `foldername` and its contents to local folder `path/to`
```

#### List files
```
gdlist [-m maxfiles] [-u] [path/to/folder]

options:
  -m <maxfiles>              Max files to list, default: 100
  -u                         Display a usage message and exit
  path/to/folder             Path of folder to list. If none provided, list all
```

### Examples
#### Get files
**gdget README**
: downloads top-level Google Drive file `README`

**gdget -o README | grep AUTHOR**
: downloads top-level Google Drive file `README` to stdout and pipes that to the `grep` utility

**gdget foo/bar**
: downloads Google Drive folder `bar` located in folder `foo` and downloads all its contents recursively

**gdget foo/bar/spam**
: downloads Google Drive file `spam` located in folder `foo/bar`

**gdget -p tmp foo/bar/spam**
: downloads Google Drive file `spam` located in Google Drive folder `foo/bar` to local folder 'tmp'

#### List files
```
$ gdlist
Id                             Name                    Type   Size     Created
0B3X9GlR6EmbnZ3gyeGw4d3ozbUk   drive-windows-x64.exe   bin    6.6 MB   2015-07-18 16:43:58
0B3X9GlR6EmbnTXlSc1FqV1dvSTQ   drive-windows-386.exe   bin    5.2 MB   2015-07-18 16:43:53
0B3X9GlR6EmbnVjIzMDRqck1aekE   drive-osx-x64           bin    6.5 MB   2015-07-18 16:43:50
0B3X9GlR6EmbnbEpXdlhza25zT1U   drive-osx-386           bin    5.2 MB   2015-07-18 16:43:41
0B3X9GlR6Embnb095MGxEYmJhY2c   drive-linux-x64         bin    6.5 MB   2015-07-18 16:43:38
```

## Limitations

The initial release of DriveCommandLine includes only a few wrapper scripts.
Future releases will expand the number and functionality of DriveCommandLine commands.

The initial release of DriveCommandLine supports only a single Google Drive instance.
Future releases will incorporate support for multiple Google Drive instances and
switching between them.

Currently there is no support for Microsoft Windows platforms outside of the untested
use of the Microsoft Linux subsystem.

## Compile from source

If you want to [compile from source](#compile-from-source) you need the
[go toolchain](http://golang.org/doc/install) version 1.5 or higher.

To compile the `gdrive` binary and install it locally, issue the command:

```bash
go install github.com/prasmussen/gdrive@latest
```

The gdrive binary should now be available at `$GOPATH/bin/gdrive`

If you want to create your own custom DriveCommandLine package then you
need the appropriate packaging tools installed on your system.

For the creation of Debian format installable packages the `build-essential`
package is required and the `devscripts` package is useful for maintainers.

For the creation of RPM format installable packages several packages are
required/useful.

On Fedora, CentOS 8, and RHEL 8:

```bash
dnf install gcc rpm-build rpm-devel rpmlint make python bash coreutils diffutils patch rpmdevtools
```

On CentOS 7 and RHEL 7:

```bash
yum install gcc rpm-build rpm-devel rpmlint make python bash coreutils diffutils patch rpmdevtools
```

Once you have the appropriate development environment installed you can create
DriveCommandLine packages by cloning the repository and running `mkpkg`:

```bash
git clone https://gitlab.com/doctorfree/DriveCommandLine.git
cd DriveCommandLine
./mkpkg
```

The DriveCommandLine package can then be installed by executing the `Install` command:

```bash
./Install
```

and, similarly, removed by executing the `Uninstall` command.

### Cool feature used by this repository

I am a GO fanboy but I was unaware of the ease with which GO builds and installs
can be performed and integrated into a repository's continuous integration.

The DriveCommandLine packages include the `gdrive` command line control of Google
Drive. This is a GO binary. Rather than fork or clone the entire `gdrive`
repository, this repository's CI build of DriveCommandLine packages employs
the remote build and installation of `gdrive` by the simple invocation of the
command:

`go install github.com/prasmussen/gdrive@latest`

during package creation. That is, I am able to build and install from a remote
repository during this repository's packaging process. I thought that was
pretty cool.
