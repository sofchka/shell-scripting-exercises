# Exercice 17
#!/bin/sh

if [ $# -ne 1 ]
then
exit 1
fi

for f in "$1"/*
do
if [ -d "$f" ]
then
basename "$f"
"$0" "$f"
fi
done


# Exercice 18
#!/bin/sh

if [ $# -eq 1 ]
then
echo "$1"
fi

for f in "$1"/*
do
if [ -d "$f" ]
then
echo "$2+- `basename $f`"
"$0" "$f" "$2|  "
fi
done