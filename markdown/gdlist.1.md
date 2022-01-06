---
title: GDLIST
section: 1
header: User Manual
footer: gdlist 2.1.1
date: January 05, 2022
---
# NAME
**gdlist** - list Google Drive files or folders

# SYNOPSIS
**gdlist** [ **-m** maxfiles ] [ **-u** ] path/to/folder [folder2 ...]

# DESCRIPTION
The *gdlist* command lists the contents of the specified Google Drive folders.
If no path/to/folder is provided on the command line, all Google Drive files
and folders are listed, up to the maximum number specified by *maxfiles*.

# COMMAND LINE OPTIONS
**-m** 'maxfiles'
: specifies the maximum number of files to list (default: 100)

**-u**
: display usage message

foldername
: list contents of Google Drive folder 'foldername'

# EXAMPLES
**gdlist**
: Lists up to 100 Google Drive files and folders

**gdlist -m 1000**
: Lists up to 1000 Google Drive files and folders

**gdlist foo/bar/spam**
: Lists the contents of Google Drive folder `foo/bar/spam`

# AUTHORS
Written by Ronald Record &lt;github@ronrecord.com&gt;

# LICENSING
GDLIST is distributed under an Open Source license.
See the file LICENSE in the GDLIST source distribution
for information on terms &amp; conditions for accessing and
otherwise using GDLIST and for a DISCLAIMER OF ALL WARRANTIES.

# BUGS
Submit bug reports online at: &lt;https://gitlab.com/doctorfree/DriveCommandLine/issues&gt;

# SEE ALSO
**gdget**(1), **gdinfo**(1), **gdrm**(1), **gdupload**(1), **getfolderids**(1), **sync2drive**(1), **sync_from_drive**(1)

Full documentation and sources at: &lt;https://gitlab.com/doctorfree/DriveCommandLine&gt;

