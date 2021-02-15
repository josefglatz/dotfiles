#!/usr/bin/env bash

# Install script for # https://github.com/webdevops/clitools/

UNAME=$( command -v uname)
CLITOOLS_BINARY=/usr/local/bin/ct

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

CLITOOLS_LATEST_VERSION=$(curl --silent "https://api.github.com/repos/webdevops/clitools/releases/latest" | jq -r .tag_name)

# https://github.com/webdevops/go-sync/releases
DOWNLOAD_VERSION=$CLITOOLS_LATEST_VERSION
DOWNLOAD_OS=$OS
DOWNLOAD_ARCH=x64

wget -O$CLITOOLS_BINARY "https://github.com/webdevops/clitools/releases/download/${DOWNLOAD_VERSION}/clitools.phar"
chmod +x $CLITOOLS_BINARY

# @TODO: Setup clitools develop branch install script