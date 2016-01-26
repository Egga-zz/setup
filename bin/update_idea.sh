#!/usr/bin/env bash
set -e
set -x

ARCHIVE=ideaIU-15.0.tar.gz
cd /two/bin/intellij/

cp ~/Downloads/$ARCHIVE /two/bin/intellij/
tar -xzf $ARCHIVE


DIR=`ls -1dt */ | head -n 1`
echo $DIR


links=( idea.png ../idea.png ../idea.sh )
for LINKED_FILE in "${links[@]}"
do
    rm -f $LINKED_FILE
    ln -s /two/bin/intellij/${DIR}bin/`basename $LINKED_FILE` $LINKED_FILE
done

,
rm $ARCHIVE
