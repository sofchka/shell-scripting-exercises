#!/bin/sh

if [ $# -ne 1 ]
then
exit 1
fi

if [ ! -d "$1" ]
then
exit 1
fi

for f in "$1"/*
do
if [ -d "$f" -a -r "$f" -a -x "$f" ]
then
"$0" "$f"
elif [ -f "$f" ]
then
echo "$f"
fi
done