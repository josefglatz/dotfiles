#!/usr/bin/env bash

defaults read > $TMPDIR/settings-before.txt

    echo "Toggle your setting and press any key"
    read

defaults read > $TMPDIR/settings-after.txt

ksdiff $TMPDIR/settings-before.txt $TMPDIR/settings-after.txt
