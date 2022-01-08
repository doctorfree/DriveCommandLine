#!/bin/bash

BINS="sync2drive \
      getfolderids \
      gdinfo \
      gdlist \
      gdrive \
      gdupload \
      gdget \
      gdrm \
      sync_from_drive"

MANS="gdupload.1 \
      gdrm.1 \
      sync2drive.1 \
      gdget.1 \
      getfolderids.1 \
      sync_from_drive.1 \
      gdinfo.1 \
      gdlist.1 \
      gdrive.1"

DOCS="DriveCommandLine"

[ -d /usr/local/bin ] && {
    cd /usr/local/bin
    sudo rm -f ${BINS}
}
[ -d /usr/share/man/man1 ] && {
    cd /usr/share/man/man1
    sudo rm -f ${MANS}
}
[ -d /usr/share/doc ] && {
    cd /usr/share/doc
    sudo rm -rf ${DOCS}
}

echo "DriveCommandLine installation files and folders removed"
exit 0
