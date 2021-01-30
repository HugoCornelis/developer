#!/bin/bash

# generate cscope index files in current directory
# the generated cscope index files also include go standard packages

if [ "$GOROOT" = "" ]
then
    echo "GOROOT is not set, skipping"
else
    go_pkg_src=$GOROOT/src

    find $go_pkg_src -name "*.go" -print > cscope.files
fi

find . -name "*.go" -print >> cscope.files
find . -name "*.c" -print >> cscope.files
find . -name "*.h" -print >> cscope.files

if cscope -b -k; then
echo "Done"
else
echo "Failed"
    exit 1
fi
