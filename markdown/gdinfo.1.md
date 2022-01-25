---
title: GDINFO
section: 1
header: User Manual
footer: gdinfo 2.1.1
date: January 04, 2022
---
# NAME
**gdinfo** - show info for Google Drive files or folders

# SYNOPSIS
**gdinfo** [ **-c** configdir ] [ **-u** ] filename|foldername [file2|folder2 ...]
: Where 'filename' or 'foldername' are names of a Google Drive file or folder

# DESCRIPTION
The *gdinfo* command retrieves and displays information for the specified
Google Drive files and folders.

# COMMAND LINE OPTIONS
**-u**
: display usage message

filename
: display info for Google Drive file 'filename'

foldername
: display info for Google Drive folder 'foldername'

# FILES
**HOME/.gdrive/token_v2.json**
: The Google Drive authentication and access token. See gdrive(1) for more details.

**HOME/.gdrive/gdhome**
: The default DriveCommandLine configuration file used to set the location of
the local Google Drive management folder.

**GDHOME/.folderid**
: Each of the folders in the local Google Drive management folder specified by
`~/.gdrive/gdhome` is populated with the file `.folderid` which contains the
Google Drive ID for that folder. The command `getfolderids` is used to retrieve
and populate the local Google Drive management folders.

# ENVIRONMENT
**GDRIVE_CONFIG_DIR**
: If non-null the full pathname for an alternate configuration folder.
Overridden by the `-c configdir` option.

# EXAMPLES
**gdinfo README**
: Displays information for the top-level Google Drive file `README`

**gdinfo foo/bar/spam**
: Displays information for the Google Drive file `spam` located in folder `foo/bar`

# AUTHORS
Written by Ronald Record &lt;github@ronrecord.com&gt;

# LICENSING
GDINFO is distributed under an Open Source license.
See the file LICENSE in the GDINFO source distribution
for information on terms &amp; conditions for accessing and
otherwise using GDINFO and for a DISCLAIMER OF ALL WARRANTIES.

# BUGS
Submit bug reports online at: &lt;https://gitlab.com/doctorfree/DriveCommandLine/issues&gt;

# SEE ALSO
**gdget**(1), **gdlist**(1), **gdrm**(1), **gdupload**(1), **gdshare**(1), **getfolderids**(1), **sync2drive**(1), **sync_from_drive**(1)

Full documentation and sources at: &lt;https://gitlab.com/doctorfree/DriveCommandLine&gt;

