---
title: GDRM
section: 1
header: User Manual
footer: gdrm 2.1.1
date: January 04, 2022
---
# NAME
**gdrm** - show info for Google Drive files or folders

# SYNOPSIS
**gdrm** [ **-n** ] [ **-r** ] [ **-s** ] [ **-u** ] path/to/fileorfolder [file2 ...]
: Where 'path/to/file' or 'path/to/folder' are names of a Google Drive file or folder

# DESCRIPTION
The *gdrm* command removes the specified Google Drive files and folders
from Google Drive. No changes are made to the local files or folders.
If a Google Drive folder is not empty then *gdrm* will not remove it.
To remove a non-empty Google Drive folder, use the **-r** command line
option to *gdrm*.

# COMMAND LINE OPTIONS
**-n**
: indicates tell me what you would do but don't do it

**-r**
: indicates remove directory and its contents recursively

**-s**
: indicates do not split path to identify name - useful when there is a slash in the filename

**-u**
: display usage message

path/to/filename
: remove Google Drive file `filename` in Google Drive folder `path/to`

path/to/foldername
: remove Google Drive file `foldername` in Google Drive folder `path/to`

# EXAMPLES
**gdrm README**
: removes top-level Google Drive file `README`

**gdrm foo/bar/spam**
: removes Google Drive file `spam` located in folder `foo/bar`

**gdrm -r foo/bar/spam**
: removes Google Drive folder `spam` located in folder `foo/bar` and removes all its contents recursively

# AUTHORS
Written by Ronald Record &lt;github@ronrecord.com&gt;

# LICENSING
GDRM is distributed under an Open Source license.
See the file LICENSE in the GDRM source distribution
for information on terms &amp; conditions for accessing and
otherwise using GDRM and for a DISCLAIMER OF ALL WARRANTIES.

# BUGS
Submit bug reports online at: &lt;https://gitlab.com/doctorfree/DriveCommandLine/issues&gt;

# SEE ALSO
**gdget**(1), **gdinfo**(1), **gdlist**(1), **gdupload**(1), **getfolderids**(1), **sync2drive**(1), **sync_from_drive**(1)

Full documentation and sources at: &lt;https://gitlab.com/doctorfree/DriveCommandLine&gt;

