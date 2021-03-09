#!/usr/bin/env bash

# Install script for # https://github.com/alyssais/secure-pbcopy

git clone --depth 1 git@github.com:alyssais/secure-pbcopy.git $TMPDIR/secure-pbcopy
cd $TMPDIR/secure-pbcopy && make Install
rm -rf $TMP/secure-pbcopy || true