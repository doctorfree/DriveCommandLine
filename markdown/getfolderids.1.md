---
title: GETFOLDERIDS
section: 1
header: User Manual
footer: getfolderids 2.1.1
date: January 04, 2022
---
# NAME
**getfolderids** - recursively retrieve folder IDs from Google Drive for the specified folder and its subfolders

# SYNOPSIS
**getfolderids** [ **-c** configdir ] [ **-f** ] [ **-m** maxfiles ] [ **-n** ] [ **-u** ] [ **-v** ] [path/to/folder]
: Where 'path/to/folder' is the (optional) name of a Google Drive folder. If no folder is specified then all Google Drive folders are searched and their folder IDs returned.

# DESCRIPTION
The *getfolderids* command recursively retrieves folder IDs for the specified
Google Drive folder and its subfolders. If no folder is specified then all folder
IDs are retrieved. The local DriveCommandLine Google Drive storage folders are
populated with their folder IDs in the file `.folderid` in each folder.

# COMMAND LINE OPTIONS
**-u**
: display usage message

**-f**
: indicates 'files'. In addition to retrieving and populating the folder IDs, create a list of file IDs (slower)

**-m** 'maxfiles'
: specifies the maximum number of files in query return (default: 500)

**-n**
: indicates tell me what you would do but don't do it

**-v**
: indicates verbose mode

foldername
: recursively retrieve folder IDs for Google Drive folder 'foldername' and its subfolders

In the absence of a 'path/to/folder' getfolderids will retrieve
and populate all local folders with folder IDs.

If a 'path/to/folder' argument is provided then getfolderids will retrieve
and populate 'path/to/folder' and its subfolders with folder IDs.

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
**getfolderids MagicMirror**
: retrieve and populate folder IDs in the 'MagicMirror' folder and all subfolders within, ignoring files located in that hierarchy.

**getfolderids -f -m 1000**
: retrieve and populate folder IDs for all Google Drive folders. In addition, create a list of file and folder IDs and set the maximum number of matching query items to 1000.

# AUTHORS
Written by Ronald Record &lt;github@ronrecord.com&gt;

# LICENSING
GETFOLDERIDS is distributed under an Open Source license.
See the file LICENSE in the GETFOLDERIDS source distribution
for information on terms &amp; conditions for accessing and
otherwise using GETFOLDERIDS and for a DISCLAIMER OF ALL WARRANTIES.

# BUGS
Submit bug reports online at: &lt;https://gitlab.com/doctorfree/DriveCommandLine/issues&gt;

# SEE ALSO
**gdget**(1), **gdinfo**(1), **gdlist**(1), **gdrm**(1), **gdupload**(1), **sync2drive**(1), **sync_from_drive**(1)

Full documentation and sources at: &lt;https://gitlab.com/doctorfree/DriveCommandLine&gt;

