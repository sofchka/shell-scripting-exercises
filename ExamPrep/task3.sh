#!/bin/sh

if [ $# -ne 1 ]
then
echo "Usage: $0 REP"
exit 1
fi

for f in "$1"/*
do
if [ -f "$f" -a -r "$f" ]
then
total=0
while read l
do
n=`echo -n "$l" | wc -c`
echo $n
total=`expr $total + $n`
done < "$f"

echo $total
fi
done