#!/bin/sh
set -e

TARFILE=$(find /tarfile -type f -regex '.*\.[tgz]*' | head -1)

if [ ! -z $TAR_VERBOSE_FLAG ] && [ $TAR_VERBOSE_FLAG == "true" ]; then
    TAR_VERBOSE=-v
fi

if [ ! -z $TARFILE ] && [ -f $TARFILE ]; then
    echo "$TARFILE first found in /tarfile. Extracting it to /volume ..."
    exec /bin/tar $TAR_EXTRA_ARGUMENT $TAR_VERBOSE -x -z -f $TARFILE -C /volume
else
    echo "No archive file has not been found. Aborting..."
    exec false
fi
