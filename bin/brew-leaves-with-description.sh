#!/usr/bin/env bash

echo "\nList installed formulae that are not dependencies of another installed formula:\n"
brew leaves | xargs -n1 brew desc
exit 0