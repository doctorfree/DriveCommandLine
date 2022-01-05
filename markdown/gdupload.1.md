---
title: GDUPLOAD
section: 1
header: User Manual
footer: gdupload 2.1.1
date: January 04, 2022
---
# NAME
**gdupload** - upload local files and folders to Google Drive

# SYNOPSIS
**gdupload** path/to/fileorfolder [file2 ...]
: Where 'path/to/file' or 'path/to/folder' are names of a local file or folder

# DESCRIPTION
The *gdupload* command uploads the specified local files and folders
to Google Drive. If the argument is a folder then it and its contents
are uploaded recursively.

# COMMAND LINE OPTIONS
path/to/filename
: upload local file `filename` to Google Drive folder `path/to`

path/to/foldername
: upload local folder `foldername` and its contents to Google Drive folder `path/to`

# EXAMPLES
**gdupload README**
: uploads local file `README` to top-level Google Drive folder

**gdupload foo/bar/spam**
: uploads local file `spam` located in folder `foo/bar` to Google Drive folder `foo/bar`

**gdupload foo/bar/spam**
: uploads local folder `spam` located in folder `foo/bar` and uploads all its contents recursively

# AUTHORS
Written by Ronald Record &lt;github@ronrecord.com&gt;

# LICENSING
GDUPLOAD is distributed under an Open Source license.
See the file LICENSE in the GDUPLOAD source distribution
for information on terms &amp; conditions for accessing and
otherwise using GDUPLOAD and for a DISCLAIMER OF ALL WARRANTIES.

# BUGS
Submit bug reports online at: &lt;https://gitlab.com/doctorfree/DriveCommandLine/issues&gt;

# SEE ALSO
**gdlist**(1)

Full documentation and sources at: &lt;https://gitlab.com/doctorfree/DriveCommandLine&gt;

