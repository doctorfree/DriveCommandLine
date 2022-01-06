#!/bin/bash

APP_NAME="gdrive"
# PLATFORMS="darwin/i386 darwin/amd64 darwin/arm darwin/arm64 dragonfly/amd64 freebsd/386 freebsd/amd64 freebsd/arm linux/386 linux/amd64 linux/arm linux/arm64 linux/ppc64 linux/ppc64le linux/mips64 linux/mips64le linux/rpi netbsd/386 netbsd/amd64 netbsd/arm openbsd/386 openbsd/amd64 openbsd/arm plan9/386 plan9/amd64 solaris/amd64 windows/386 windows/amd64"

SRC="${HOME}/src/DriveCommandLine"
BIN_PATH="${SRC}/releases/bin"

# Initialize bin dir
rm -rf $BIN_PATH
mkdir -p $BIN_PATH

# Remove any existing gdrive binary from HOME GOPATH bin
rm -f ${HOME}/go/bin/gdrive

# Build binary for each platform this system's version of GO supports
for PLATFORM in `go tool dist list`
do
    GOOS=${PLATFORM%/*}
    GOARCH=${PLATFORM#*/}
    BIN_NAME="${APP_NAME}-${GOOS/darwin/osx}-${GOARCH/amd64/x64}"

    if [ $GOOS == "windows" ]; then
        BIN_NAME="${BIN_NAME}.exe"
    fi

    # Raspberrypi seems to need arm5 binaries
    if [ $GOARCH == "rpi" ]; then
        export GOARM=5
        GOARCH="arm"
    else
        unset GOARM
    fi

    export GOOS=$GOOS
    export GOARCH=$GOARCH

    if [ -d ${HOME}/go/bin/${GOOS}_${GOARCH} ]
    then
        echo "${HOME}/go/bin/${GOOS}_${GOARCH} already built"
    else
        echo "Building $BIN_NAME"
        go install -ldflags '-w -s' github.com/prasmussen/gdrive@latest > /dev/null 2>&1
    fi
    if [ -d ${HOME}/go/bin/${GOOS}_${GOARCH} ]
    then
        cp -a ${HOME}/go/bin/${GOOS}_${GOARCH} ${BIN_PATH}/${GOOS}_${GOARCH}
    else
        if [ -x ${HOME}/go/bin/gdrive ]
        then
            [ -d ${BIN_PATH}/${GOOS}_${GOARCH} ] || mkdir -p ${BIN_PATH}/${GOOS}_${GOARCH}
            if [ -x ${BIN_PATH}/${GOOS}_${GOARCH}/gdrive ]
            then
                echo "Duplicate build for ${GOOS}_${GOARCH} detected"
            else
                mv ${HOME}/go/bin/gdrive ${BIN_PATH}/${GOOS}_${GOARCH}/gdrive
            fi
        else
            echo "Could not locate output of build for ${GOOS}_${GOARCH}"
        fi
    fi
done

echo "All done"
