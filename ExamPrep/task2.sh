#!/bin/sh

if [ $# -lt 2 ]
then
echo "Usage: $0 extension file1 [...]"
exit 1
fi

ext="$1"
shift

for f in "$@"
do
if [ -f "$f" -a -w "$f" ]
then
mv "$f" "$f$ext"
else
echo "$f inaccessible"
fi
done