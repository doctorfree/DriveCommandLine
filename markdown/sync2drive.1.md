---
title: SYNC2DRIVE
section: 1
header: User Manual
footer: sync2drive 2.1.1
date: January 04, 2022
---
# NAME
**sync2drive** - Sync a Google Drive folder and its contents with the locally stored folder

# SYNOPSIS
**sync2drive** [ **-k** ] [ **-l** ] [ **-p** ] [ **-m** maxfiles ] [ **-n** ] [ **-s** ] [ **-u** ] folder|path/to/folder
: Where 'folder' or 'path/to/folder' is the name of a Google Drive folder

# DESCRIPTION
The *sync2drive* command syncs a Google Drive folder and its contents with the
locally stored folder of the same name/path. Files and folders stored locally
are uploaded to Google Drive if they differ or are new. Extraneous files stored
on Google Drive in the specified folder and its subfolders are removed.

The *sync2drive* command creates a DriveCommandLine 'sync' folder. Subsequent
changes to this folder and its contents can be sync'd back to the local folder
using the *sync_from_drive* command. In addition, changes made locally can be
synchronized again by reissuing the *sync2drive* command.

Unlike Google Drive and the `gdrive` command, the DriveCommandLine commands
enable the creation of a Google Drive sync folder to an existing non-empty
Google Drive folder. In this case, the contents of the local sync folder
and the Google Drive folder to be sync'd are combined.

Files that are synced to google drive with *sync2drive* are tagged with an
`appProperty` so that the files on Google Drive can be traversed faster.
This means that you cannot upload files with `gdrive upload` into
a sync directory as the files would be missing the sync tag, and would be
ignored by the sync commands. However, this limitation is overcome
(optionally) when the DriveCommandLine utility `gdupload` is used to
upload to an existing sync folder.

# COMMAND LINE OPTIONS
**-k**
: indicates do not delete extraneous remote files

**-l**
: indicates list sync folders and exit

**-p**
: indicates list sync folders and display path and shared status"

**-m** 'maxfiles'
: specifies maximum number of file ids to return (default: 100)

**-n**
: indicates tell me what you would do but don't do it

**-s**
: indicates do not split path to identify name (useful when there is a slash in the folder name)

**-u**
: display usage message

foldername
: sync local folder `foldername` to Google Drive folder 'foldername'

# EXAMPLES
**sync2drive MagicMirror**
: syncs the local folder `MagicMirror` and its contents to the Google Drive folder `MagicMirror`

**sync2drive MagicMirror/config**
: syncs the local folder `MagicMirror/config` and its contents to the Google Drive folder `MagicMirror/config`

# AUTHORS
Written by Ronald Record &lt;github@ronrecord.com&gt;

# LICENSING
SYNC2DRIVE is distributed under an Open Source license.
See the file LICENSE in the SYNC2DRIVE source distribution
for information on terms &amp; conditions for accessing and
otherwise using SYNC2DRIVE and for a DISCLAIMER OF ALL WARRANTIES.

# BUGS
Submit bug reports online at: &lt;https://gitlab.com/doctorfree/DriveCommandLine/issues&gt;

# SEE ALSO
**gdget**(1), **gdinfo**(1), **gdlist**(1), **gdrm**(1), **gdupload**(1), **getfolderids**(1), **sync_from_drive**(1)

Full documentation and sources at: &lt;https://gitlab.com/doctorfree/DriveCommandLine&gt;

