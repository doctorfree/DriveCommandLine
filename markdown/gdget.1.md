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
**gdget** [ **-d** ] [ **-f** ] [ **-n** ] [ **-r** ] [ **-s** ] [ **-p**  path] [ **-o** ] [ **-u** ] path/to/fileorfolder [file2 ...]
: Where 'path/to/file' or 'path/to/folder' are names of a Google Drive file or folder

# DESCRIPTION
The *gdget* command downloads the specified Google Drive files and folders
from Google Drive. If the 'file/folder' argument is a folder on Google Drive
then it and its contents are downloaded recursively.

# COMMAND LINE OPTIONS
**-n**
: indicates tell me what you would do but don't do it

**-d**
: indicates delete remote file when download is successful

**-f**
: indicates force overwrite of existing file

**-p** 'path'
: specifies a download path

**-o**
: indicates write file content to stdout

**-r**
: indicates download directory and its contents recursively

**-s**
: indicates skip existing files

**-u**
: displays this usage message

path/to/filename
: download Google Drive file `filename` to local folder `path/to`

path/to/foldername
: download Google Drive folder `foldername` and its contents to local folder `path/to`

# EXAMPLES
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
**gdinfo**(1), **gdrm**(1), **gdupload**(1), **getfolderids**(1), **sync2drive**(1), **sync_from_drive**(1)

Full documentation and sources at: &lt;https://gitlab.com/doctorfree/DriveCommandLine&gt;

