---
title: GDSHARE
section: 1
header: User Manual
footer: gdshare 2.1.1
date: January 18, 2022
---
# NAME
**gdshare** - Manage Google Drive share permissions from the command line

# SYNOPSIS
**gdshare** [ **-c** configdir] [ **-m** maxfiles] [ **-r** role] [ **-t** type] [ **-e** email] [ **-d** domain] [ **-D** ] [ **-R** ] [ **-l** ] [ **-n** ] [ **-u** ] path/to/fileorfolder [file2 ...]
: Where 'path/to/file' or 'path/to/folder' are names of a Google Drive file or folder

# DESCRIPTION
The *gdshare* command manages the specified Google Drive files and folders
share permissions. If the argument is a folder then that folder's contents
will inherit the permissions. The `gdshare` command can be used to share
Google Drive files and folders, specifying the type of share, the share role,
the email address and Google Apps domain, and additional permissions. It can
also be used to revoke sharing permissions and control whether the file or
folder is exposed to search engines.

# COMMAND LINE OPTIONS
**-u**
: display a usage message

**-m** 'maxfiles'
: specifies maximum number of file ids to return (default: 1000)

**-c** 'configdir'
: specifies an alternative gdrive config folder (default: HOME/.gdrive)

**-r** 'role'
: specifies the share role: owner/writer/commenter/reader, default: reader

**-t** 'type'
: specifies the share type: user/group/domain/anyone, default: anyone

**-e** 'email'
: specifies the email address of the user or group to share the file with. Requires 'user' or 'group' as type

**-d** 'domain'
: specifies the name of Google Apps domain. Requires 'domain' as type

**-D**
: indicates make file discoverable by search engines

**-R**
: indicates delete all sharing permissions (owner roles will be skipped)

**-l**
: indicates list files share permissions

**-n**
: indicates tell me what you would do without doing it

path/to/filename
: Manage share permissions for Google Drive file or folder `path/to/filename`

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
**gdshare README**
: Sets share permissions on Google Drive file `README` to `type anyone` and `role reader`

**gdshare -l foo/bar/README**
: Lists share permissions on Google Drive file `foo/bar/README`

# AUTHORS
Written by Ronald Record &lt;github@ronrecord.com&gt;

# LICENSING
GDSHARE is distributed under an Open Source license.
See the file LICENSE in the GDSHARE source distribution
for information on terms &amp; conditions for accessing and
otherwise using GDSHARE and for a DISCLAIMER OF ALL WARRANTIES.

# BUGS
Submit bug reports online at: &lt;https://gitlab.com/doctorfree/DriveCommandLine/issues&gt;

# SEE ALSO
**gdget**(1), **gdinfo**(1), **gdlist**(1), **gdrm**(1), **gdupload**(1), **getfolderids**(1), **sync2drive**(1), **sync_from_drive**(1)

Full documentation and sources at: &lt;https://gitlab.com/doctorfree/DriveCommandLine&gt;

