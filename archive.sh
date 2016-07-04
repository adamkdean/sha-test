#!/bin/bash

if [[ $# -lt 2 ]] ; then
  echo 'usage: script <source> <archive>'
  exit 1
fi

SOURCE_PATH=$1
ARCHIVE_PATH=$2

echo
echo "[step 1. clean down archive]"
echo
rm -rfv archive/*

echo
echo "[step 2. create archive of every file since ever]"
echo
FILES=($(find $SOURCE_PATH -mindepth 1 -type f | grep -v '/\.'))
for f in "${FILES[@]}"; do
  echo "[$f]"
  REVS=($(git log --follow --format=format:%H $f))

  for r in "${REVS[@]}"; do
    SRC=$(git show $r:$f)
    DIRNAME=$(dirname ${f#$SOURCE_PATH})
    FILENAME=$(basename "$f")

    mkdir -p $ARCHIVE_PATH/$r/$DIRNAME
    echo $SRC > $ARCHIVE_PATH/$r/$DIRNAME/$FILENAME
    echo "$ARCHIVE_PATH/$r/$DIRNAME/$FILENAME created"
  done

  echo
done
