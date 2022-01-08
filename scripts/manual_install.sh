#!/bin/bash

PKG_NAME="DriveCommandLine"

usage() {
    echo "Usage: manual_install.sh distribution-file"
    exit 1
}

install_package() {
  debian=
  have_apt=`type -p apt`
  have_dpkg=`type -p dpkg`
  have_rpm=`type -p rpm`
  have_yum=`type -p yum`
  [ -f /etc/os-release ] && . /etc/os-release
  [ "${ID_LIKE}" == "debian" ] && debian=1
  [ "${debian}" ] || [ -f /etc/debian_version ] && debian=1

  SUF=deb
  if [ "${debian}" ]
  then
    ARCH=`dpkg --print-architecture`
  else
    SUF=rpm
    ARCH=`rpm --eval '%{_arch}'`
  fi
  [ "${ARCH}" == "x86_64" ] && ARCH="amd64"

  [ "${SUF}" == "${suffix}" ] || {
    echo "Distribution file suffix '${suffix}' does not match native platform"
    echo "installation package format suffix '${SUF}'"
    echo "Download the architecture '${ARCH}' with suffix '${SUF}' distribution file for this platform"
    usage
  }

  echo "Installing ${PKG}"
  if [ "${debian}" ]
  then
    if [ "${have_apt}" ]
    then
      sudo apt install "${PKG}"
    else
      if [ "${have_dpkg}" ]
      then
        sudo dpkg -i "${PKG}"
      else
        echo "Cannot locate either apt or dpkg to install."
      fi
    fi
  else
    if [ "${have_yum}" ]
    then
      sudo yum localinstall "${PKG}"
    else
      if [ "${have_rpm}" ]
      then
        sudo rpm -i "${PKG}"
      else
        echo "Cannot locate either yum or rpm to install."
      fi
    fi
  fi
}

[ "$1" ] || {
    echo "Distribution file argument required"
    usage
}

PKG="$1"

[ -f ${PKG} ] || {
    echo "Cannot locate distribution file ${PKG}"
    usage
}

pkg=`echo ${PKG} | awk -F '_' ' { print $1 } '`
[ "${pkg}" == ${PKG_NAME} ] || {
    echo "Distribution file ${PKG} is not a ${PKG_NAME} distribution"
    usage
}

suffix=`echo ${PKG} | awk -F '.' ' { print $NF } '`
# typ=`echo ${PKG} | awk -F '.' ' { print $(NF-1) } '`
# format="${typ}.${suffix}"

# Assumes we only distribute *.tar.gz, *.zip, *.rpm, *.deb
case ${suffix} in
    gz)
        echo "Gzip compressed tar archive"
        sudo tar -opxzf ${PKG} -C /
        ;;
    zip)
        echo "Zip compressed archive"
        sudo unzip ${PKG} -d /
        ;;
    deb)
        echo "Debian format installation package"
        install_package
        ;;
    rpm)
        echo "RPM format installation package"
        install_package
        ;;
    *)
        echo "Unrecognized/unsupported format distribution file"
        ;;
esac

echo "DriveCommandLine installation files and folders installed"
exit 0
