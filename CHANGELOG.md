# Changelog

All notable changes to this project will be documented in this file.

09 January 2022, DriveCommandLine version 2.1.1 release 1:

This initial release of DriveCommandLine includes a build and packaging
of the gdrive command line utility from https://github.com/prasmussen/gdrive
along with several scripts to ease management of Google Drive with the
gdrive command line utility. Installation packages are provided in Debian
format, RPM format, compressed tar archive, and compressed zip archive formats.

DriveCommandLine supports installation package and distribution archives
for multiple platforms and architectures including:

aix_ppc64, android_386, android_amd64, android_arm64, darwin_amd64,
darwin_arm64, dragonfly_amd64, freebsd_386, freebsd_amd64, freebsd_arm64,
freebsd_arm, illumos_amd64, js_wasm, linux_386, linux_amd64, linux_arm64,
linux_arm, linux_mips64, linux_mips64le, linux_mips, linux_mipsle,
linux_ppc64, linux_ppc64le, linux_riscv64

Sun Jan 9 11:06:27 2022 -0800 96cfd68 :
   Use SRC_NAME rather than PKG_NAME
Sun Jan 9 10:04:53 2022 -0800 b269953 :
   Lead paragraphs for Motivation section
Sun Jan 9 09:55:34 2022 -0800 aa23376 :
   Add Manual removal to Removal section
Sun Jan 9 09:49:20 2022 -0800 fece940 :
   Add Removal section
Sun Jan 9 09:35:32 2022 -0800 045ca55 :
   Incorporate manual_uninstall.sh into Uninstall script
Sun Jan 9 09:28:22 2022 -0800 634cdef :
   Change zip/gzip distribution archive names to incorporate their scripted install in Install
Sat Jan 8 19:49:04 2022 -0800 ff1ac7d :
   Add Troubleshooting section and subsections to Limitations, skip non-directories in getfolderids if ONLY is set
Sat Jan 8 18:48:04 2022 -0800 7ee7be0 :
   Add -s flag to sync2drive and -t flag to gdget, update man pages
Sat Jan 8 18:03:06 2022 -0800 20f5ce3 :
   Missed another invocation of getfolderids in gdget
Sat Jan 8 17:46:39 2022 -0800 7efe854 :
   Fix syntax error in last change
Sat Jan 8 17:32:56 2022 -0800 6947d55 :
   Fix syntax error in last change
Sat Jan 8 17:18:30 2022 -0800 b486ec9 :
   Do not update folder ids when gdget is called from sync2drive
Sat Jan 8 16:06:23 2022 -0800 1a3d0aa :
   Use pipe to tee in order to use sudo in redirection of output
Sat Jan 8 14:45:52 2022 -0800 b5c9efa :
   Add note on managing multiple drives to Quick start section
Sat Jan 8 14:30:11 2022 -0800 3b7cf90 :
   Move all files from /usr/share to /usr/local/share to avoid weird filesystem protections on Mac
Sat Jan 8 13:29:44 2022 -0800 1c5e508 :
   See if --posix option to GNU tar will provide compatibility with bsdtar
Sat Jan 8 12:13:14 2022 -0800 b91ee47 :
   fix chown of gdrive binary
Sat Jan 8 12:10:52 2022 -0800 4a7d7da :
   Need to use sudo in more places in mkpkg after chowning the dist tree
Sat Jan 8 11:58:38 2022 -0800 0851308 :
   Use -opxzf tar options to extract distribution archive
Sat Jan 8 11:31:52 2022 -0800 cb40c72 :
   Updated markdown and man pages with maxfiles support
Sat Jan 8 11:24:48 2022 -0800 3156bee :
   Set ownership of distribution hierarchy in mkpkg, added scripts to manually install and uninstall
Sat Jan 8 08:51:31 2022 -0800 e25c19a :
   Added a Quick start guide section
Sat Jan 8 08:29:00 2022 -0800 9244909 :
   Add news of multiple platform support to News section
Sat Jan 8 08:08:21 2022 -0800 fdddf83 :
   Pass along -m maxfiles arg
Sat Jan 8 07:45:29 2022 -0800 b7996c4 :
   Update folder ids when syncing from drive
Sat Jan 8 07:37:40 2022 -0800 d7e44d6 :
   When downloading a directory, run getfolderids afterward
Fri Jan 7 21:03:21 2022 -0800 77f615a :
   Update Limitations section, fix bug in processing OPTARG in sync2drive
Fri Jan 7 20:29:50 2022 -0800 31cb5af :
   Fix typo for getfolderids invocation
Fri Jan 7 20:00:41 2022 -0800 23b9db4 :
   Use sudo if necessary to create config folders but check to see if we can avoid that
Fri Jan 7 18:44:43 2022 -0800 22aa9bd :
   Call getfolderids in sync2drive, clarify messages in getfolderids
Fri Jan 7 16:46:49 2022 -0800 4917c19 :
   Add FILES and ENVIRONMENT sections to man pages
Fri Jan 7 16:14:21 2022 -0800 69f82b6 :
   Add support for environment variable for multiple drives
Fri Jan 7 15:24:17 2022 -0800 db8492b :
   When passing alternate config arg along to anything other than gdrive, use -c rather than --config
Fri Jan 7 15:08:50 2022 -0800 88637d5 :
   Pass alternate config file path along to invoked scripts
Fri Jan 7 11:20:32 2022 -0800 be7068a :
   Modify Install to recognize package file names with architecture
Fri Jan 7 10:50:20 2022 -0800 ac6948f :
   Do not delete previously built gdrive binaries in build-all script
Fri Jan 7 10:43:34 2022 -0800 2956b47 :
   Support for 'clean' and 'clean all' to preserve built gdrive binaries
Fri Jan 7 10:38:56 2022 -0800 153d26a :
   First pass at support for multiple gdrive configurations and Google Drives
Fri Jan 7 08:50:19 2022 -0800 c03d3a7 :
   Add OS name to RPM filename macro
Fri Jan 7 08:11:26 2022 -0800 a4f4441 :
   Make sure build-all script is executable
Fri Jan 7 08:08:10 2022 -0800 72aa90e :
   Move scripts to bin and bin to scripts, add OS to package file names
Thu Jan 6 18:10:33 2022 -0800 2bd57a5 :
   Build distribution packages for all platforms that GO supports
Thu Jan 6 14:52:55 2022 -0800 689ba8a :
   Added scripts to build gdrive binaries for multiple platforms and upload to Google Drive
Thu Jan 6 14:42:54 2022 -0800 bad7a2f :
   Add to Prerequisites section, add subsections on OS and Architecture
Thu Jan 6 13:03:19 2022 -0800 f5a195e :
   Add commands to show system architecture
Thu Jan 6 11:52:44 2022 -0800 f219d05 :
   Finish off Synopsis and Examples sections for now
Thu Jan 6 11:37:53 2022 -0800 97e9087 :
   More work on Synopsis and Examples
Thu Jan 6 11:17:06 2022 -0800 e0433bf :
   Additional work on Synopsis of commands and Examples
Thu Jan 6 10:36:26 2022 -0800 c59fd45 :
   Added to currently supported features
Thu Jan 6 10:25:43 2022 -0800 6fdc6ec :
   Add man page and markdown for gdlist, add getopts processing to gdlist
Thu Jan 6 10:01:14 2022 -0800 427785e :
   Start on Synopsis and Examples sections
Thu Jan 6 08:55:56 2022 -0800 0db41c5 :
   Updated table of contents with new section
Thu Jan 6 08:51:52 2022 -0800 6845acb :
   Section on Initial setup
Wed Jan 5 19:57:47 2022 -0800 3d93388 :
   Add subsection on introduction to the command line
Wed Jan 5 19:48:25 2022 -0800 8033a54 :
   Add man page for gdrive
Wed Jan 5 19:11:13 2022 -0800 db7d34b :
   Add instructions to clone repo and create package
Wed Jan 5 19:04:06 2022 -0800 47d3c82 :
   gdinfo takes -i id to get info on id, sync2drive takes a -p to list sync folder paths and shared status
Wed Jan 5 17:51:54 2022 -0800 1789fcc :
   Use platform architecture in package filename
Wed Jan 5 16:26:51 2022 -0800 46b93a4 :
   Redirect output from go install of gdrive
Wed Jan 5 16:20:52 2022 -0800 d23a998 :
   Enable sync folder creation to existing non-empty Google Drive folders, add options to gdget to enable downloads to specified path
Wed Jan 5 10:12:22 2022 -0800 3c2658e :
   Expand section on compiling from source and add subsection on cool GO feature
Wed Jan 5 09:43:32 2022 -0800 af06361 :
   Added section on Motivation
Wed Jan 5 08:36:09 2022 -0800 97df6b6 :
   Prompt user in cases where there is an existing Google Drive folder and upload would create duplicate
Tue Jan 4 21:50:38 2022 -0800 4ead0ff :
   Fixing gdget and gdupload
Tue Jan 4 21:11:59 2022 -0800 3a5d34b :
   Make scripts work with files and folder names that contain spaces
Tue Jan 4 20:22:06 2022 -0800 844bd71 :
   Install/Uninstall support for RPM as well as Debian. No Mac OS X yet
Tue Jan 4 19:23:13 2022 -0800 ecd194f :
   Add release.md for use in release notes
Tue Jan 4 18:56:33 2022 -0800 51aa3ea :
   Add gdget and gdupload scripts and man pages
Tue Jan 4 16:05:35 2022 -0800 5958ba4 :
   Add markdown and man pages for several commands
Tue Jan 4 13:40:14 2022 -0800 e66ef8c :
   Populate rpm buildroot in install
Tue Jan 4 13:08:47 2022 -0800 52ffe5c :
   Setup BUILDROOT in mkpkg for RPM build, locate gdrive in GOPATH if it exists
Tue Jan 4 11:59:40 2022 -0800 741c11c :
   Added AUTHORS and CHANGELOG
Tue Jan 4 11:51:02 2022 -0800 307bce3 :
   Clarify the nature of this repo and simplify the license
Tue Jan 4 11:36:57 2022 -0800 abb7ed5 :
   Delete all files from original repository, use 'go install ...' in mkpkg to install gdrive binary
Tue Jan 4 11:13:17 2022 -0800 97c0ef8 :
   Add compile to CI build
Tue Jan 4 11:05:39 2022 -0800 777d212 :
   Rename RPM spec file
Tue Jan 4 11:04:38 2022 -0800 05ea342 :
   First pass at revised README with installation procedures for Debian and RPM format packages
Tue Jan 4 10:09:25 2022 -0800 84906ac :
   Build gdrive binary in both CI and standalone with mkpkg
Tue Jan 4 10:05:21 2022 -0800 53834c5 :
   Revise with new gitlab go ci workflow
Tue Jan 4 10:01:58 2022 -0800 3afa46f :
   Fix repo name in gitlab ci
Tue Jan 4 09:51:47 2022 -0800 8824b2b :
   Initial DriveCommandLine repository based on prasmussen/gdrive
