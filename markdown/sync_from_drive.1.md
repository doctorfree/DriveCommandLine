---
title: SYNC_FROM_DRIVE
section: 1
header: User Manual
footer: sync_from_drive 2.1.1
date: January 04, 2022
---
# NAME
**sync_from_drive** - Sync a locally stored folder and its contents to a Google Drive folder

# SYNOPSIS
**sync_from_drive** [ **-l** ] [ **-n** ] [ **-u** ] folder | path/to/folder
Where:
: Where 'folder' or 'path/to/folder' is the name of a Google Drive folder

# DESCRIPTION
The *sync_from_drive* command syncs a Google Drive folder and its contents
to a local folder. Files and folders stored on Google Drive are downloaded
to to a local folder if they differ or are new. Extraneous files stored
locally in the specified folder and its subfolders are removed.

Only sync folders previously created using *sync2drive* can be used by
the *sync_from_drive* command. Subsequent changes to the local folder
and its contents can be sync'd back to Google Drive using the
*sync2drive* command. In addition, changes made remotely on Google Drive
can be synchronized again by reissuing the *sync_from_drive* command.

# COMMAND LINE OPTIONS
-n**
: indicates tell me what you would do but don't do it

-l**
: indicates list sync folders and exit

**-u**
: display usage message

foldername
: sync Google Drive folder `foldername` to local folder 'foldername'

# EXAMPLES
**sync_from_drive MagicMirror**
: syncs the local folder `MagicMirror` and its contents to the Google Drive folder `MagicMirror`

**sync_from_drive MagicMirror/config**
: syncs the local folder `MagicMirror/config` and its contents to the Google Drive folder `MagicMirror/config`

# AUTHORS
Written by Ronald Record &lt;github@ronrecord.com&gt;

# LICENSING
SYNC_FROM_DRIVE is distributed under an Open Source license.
See the file LICENSE in the SYNC_FROM_DRIVE source distribution
for information on terms &amp; conditions for accessing and
otherwise using SYNC_FROM_DRIVE and for a DISCLAIMER OF ALL WARRANTIES.

# BUGS
Submit bug reports online at: &lt;https://gitlab.com/doctorfree/DriveCommandLine/issues&gt;

# SEE ALSO
**sync2drive**(1)

Full documentation and sources at: &lt;https://gitlab.com/doctorfree/DriveCommandLine&gt;
