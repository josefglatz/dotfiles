#!/usr/bin/env bash

# Install script for # https://github.com/webdevops/go-devtool/

UNAME=$( command -v uname)
GODEVTOOL_BINARY=/usr/local/bin/gdt
GODEVTOOL_REPOSITORY=webdevops/go-devtool

case $( "${UNAME}" | tr '[:upper:]' '[:lower:]') in
  linux*)
    OS=linux
    ;;
  darwin*)
    OS=osx
    ;;
  msys*|cygwin*|mingw*)
    # or possible 'bash on windows'
    OS=windows
    ;;
  nt|win*)
    OS=windows
    ;;
  *)
    OS=unknown
    exit 1
    ;;
esac

GODEVTOOL_LATEST_VERSION=$(curl --silent "https://api.github.com/repos/$GODEVTOOL_REPOSITORY/releases/latest" | jq -r .tag_name)

# https://github.com/webdevops/go-devtool/releases
DOWNLOAD_VERSION=$GODEVTOOL_LATEST_VERSION
DOWNLOAD_OS=$OS
DOWNLOAD_ARCH=x64

wget -O$GODEVTOOL_BINARY "https://github.com/$GODEVTOOL_REPOSITORY/releases/download/${DOWNLOAD_VERSION}/gdt-${DOWNLOAD_OS}-${DOWNLOAD_ARCH}"
chmod +x $GODEVTOOL_BINARY