---
title: GDGET
section: 1
header: User Manual
footer: gdget 2.1.1
date: January 04, 2022
---
# NAME
**gdget** - download Google Drive files or folders

# SYNOPSIS
**gdget** path/to/fileorfolder [file2 ...]
: Where 'path/to/file' or 'path/to/folder' are names of a Google Drive file or folder

# DESCRIPTION
The *gdget* command downloads the specified Google Drive files and folders
from Google Drive. If the argument is a folder on Google Drive then it and
its contents are downloaded recursively. Local files and folders, if they
exist, are overwritten.

# COMMAND LINE OPTIONS
path/to/filename
: download Google Drive file `filename` to local folder `path/to`

path/to/foldername
: download Google Drive folder `foldername` and its contents to local folder `path/to`

# EXAMPLES
**gdget README**
: downloads top-level Google Drive file `README`

**gdget foo/bar/spam**
: downloads Google Drive file `spam` located in folder `foo/bar`

**gdget foo/bar/spam**
: downloads Google Drive folder `spam` located in folder `foo/bar` and downloads all its contents recursively

# AUTHORS
Written by Ronald Record &lt;github@ronrecord.com&gt;

# LICENSING
GDGET is distributed under an Open Source license.
See the file LICENSE in the GDGET source distribution
for information on terms &amp; conditions for accessing and
otherwise using GDGET and for a DISCLAIMER OF ALL WARRANTIES.

# BUGS
Submit bug reports online at: &lt;https://gitlab.com/doctorfree/DriveCommandLine/issues&gt;

# SEE ALSO
**gdlist**(1)

Full documentation and sources at: &lt;https://gitlab.com/doctorfree/DriveCommandLine&gt;

