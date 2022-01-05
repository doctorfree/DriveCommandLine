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
**gdinfo** [ **-u** ] filename|foldername [file2|folder2 ...]
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
**gdlist**(1)

Full documentation and sources at: &lt;https://gitlab.com/doctorfree/DriveCommandLine&gt;

