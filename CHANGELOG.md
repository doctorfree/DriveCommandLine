# Changelog

All notable changes to this project will be documented in this file.

04 January 2022, DriveCommandLine version 2.1.1 release 1:

This initial release of DriveCommandLine includes a build and packaging
of the gdrive command line utility from https://github.com/prasmussen/gdrive
along with several scripts to ease management of Google Drive with the
gdrive command line utility. Installation packages are provided in Debian
format, RPM format, compressed tar archive, and compressed zip archive formats.

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
