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
**gdupload** [ **-c** configdir ] [ **-m** maxfiles ] [ **-u** ] path/to/fileorfolder [file2 ...]
: Where 'path/to/file' or 'path/to/folder' are names of a local file or folder

# DESCRIPTION
The *gdupload* command uploads the specified local files and folders
to Google Drive. If the argument is a folder then it and its contents
are uploaded recursively.

In order to avoid the creation of multiple Google Drive folders with the
same name and path, if *gdupload* detects an existing Google Drive folder
with the same name as would be uploaded then it prompts the user to
select an option for the upload, offering the following choices:

- "Preserve Existing Folder and Create Sync Folder"
- "Delete Existing Folder and Upload New"
- "Create New Duplicate Folder Name"
- "Skip Upload"

Files that are synced to google drive with *sync2drive* are tagged with an
`appProperty` so that the files on Google Drive can be traversed faster.
This means that you cannot upload files with `gdrive upload` into
a sync directory as the files would be missing the sync tag, and would be
ignored by the sync commands. However, this limitation is overcome
(optionally) when the DriveCommandLine utility `gdupload` is used to
upload to an existing sync folder.

# COMMAND LINE OPTIONS
**-u**
: display a usage message

**-m** 'maxfiles'
: specifies maximum number of file ids to return (default: 1000)

path/to/filename
: upload local file `filename` to Google Drive folder `path/to`

path/to/foldername
: upload local folder `foldername` and its contents to Google Drive folder `path/to`

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
**gdget**(1), **gdinfo**(1), **gdlist**(1), **gdrm**(1), **getfolderids**(1), **sync2drive**(1), **sync_from_drive**(1)

Full documentation and sources at: &lt;https://gitlab.com/doctorfree/DriveCommandLine&gt;

