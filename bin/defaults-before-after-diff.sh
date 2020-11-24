#!/usr/bin/env bash

defaults read > ~/settings-before.txt

    echo "Toggle your setting and press any key"
    read

defaults read > ~/settings-after.txt

# @TODO: use mktemp
ksdiff ~/settings-before.txt ~/settings-after.txt
