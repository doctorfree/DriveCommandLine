#!/bin/bash

SRC="${HOME}/src/DriveCommandLine"
[ "$1" ] && SRC="$1"
REL="${SRC}/releases"
BIN_PATH="${REL}/bin"

if [ "${GOPATH}" ]
then
    export GOPATH="${REL}:${GOPATH}"
else
    export GOPATH="${REL}"
fi

# Initialize bin dir
[ -d "${BIN_PATH}" ] || mkdir -p "${BIN_PATH}"

# Build binary for each platform this system's version of GO supports
for PLATFORM in `go tool dist list`
do
    GOOS=${PLATFORM%/*}
    GOARCH=${PLATFORM#*/}

    # Raspberrypi seems to need arm5 binaries
    if [ $GOARCH == "rpi" ]; then
        export GOARM=5
        GOARCH="arm"
    else
        unset GOARM
    fi

    export GOOS=${GOOS}
    export GOARCH=${GOARCH}
    GOPLAT="${GOOS}_${GOARCH}"

    # Skip some platforms
    [ "${GOPLAT}" == "android_arm" ] && continue
    [ "${GOPLAT}" == "ios_amd64" ] && continue
    [ "${GOPLAT}" == "ios_arm64" ] && continue

    if [ -d "${BIN_PATH}/${GOPLAT}" ]
    then
        echo "${BIN_PATH}/${GOPLAT} already built"
    else
        echo "Installing gdrive for ${GOPLAT} in ${GOPATH}"
        go install -ldflags '-w -s' github.com/prasmussen/gdrive@latest > /dev/null 2>&1
    fi
    [ -d "${BIN_PATH}/${GOPLAT}" ] || {
        if [ -x "${BIN_PATH}/gdrive" ]
        then
            [ -d "${BIN_PATH}/${GOPLAT}" ] || mkdir -p "${BIN_PATH}/${GOPLAT}"
            if [ -x "${BIN_PATH}/${GOPLAT}/gdrive" ]
            then
                echo "Duplicate build for ${GOPLAT} detected"
            else
                mv "${BIN_PATH}/gdrive" "${BIN_PATH}/${GOPLAT}/gdrive"
            fi
        else
            echo "Could not locate output of build for ${GOPLAT}"
        fi
    }
done

echo "All done"
