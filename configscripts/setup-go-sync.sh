#!/usr/bin/env bash

# Install script for # https://github.com/webdevops/go-sync/

UNAME=$( command -v uname)

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

GOSYNC_LATEST_VERSION=$(curl --silent "https://api.github.com/repos/webdevops/go-sync/releases/latest" | jq -r .tag_name)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/$NVM_LATEST_VERSION/install.sh | bash

# https://github.com/webdevops/go-sync/releases
DOWNLOAD_VERSION=$GOSYNC_LATEST_VERSION
DOWNLOAD_OS=$OS
DOWNLOAD_ARCH=x64

wget -O/usr/local/bin/gosync "https://github.com/webdevops/go-sync/releases/download/${DOWNLOAD_VERSION}/gosync-${DOWNLOAD_OS}-${DOWNLOAD_ARCH}"
chmod +x /usr/local/bin/gosync