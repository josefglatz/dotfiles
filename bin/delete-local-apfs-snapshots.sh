#!/usr/bin/env bash

# If you need to customize the path's please copy the file in your $DOTFILES_DIRECTORY_LOCAL/bin/
# folder and adopt it to your needs.

echo
echo "Local Snapshots:"
echo
tmutil listlocalsnapshots /
echo
echo "Deleting all Snapshots. This can take a while ..."
echo
for d in $(tmutil listlocalsnapshotdates|sed -n '1!p'); do tmutil deletelocalsnapshots $d; done
echo
echo
#echo "Local Snapshots case-sensitive volume:"
#echo
#tmutil listlocalsnapshots /Volumes/CS
#echo
#echo "Deleting all Snapshots. This can take a while ..."
#echo
#for d in $(tmutil listlocalsnapshotdates /Volumes/CS|sed -n '1!p'); do tmutil deletelocalsnapshots $d; done
#echo "DONE!"