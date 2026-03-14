# Exercice 14
#!/bin/sh

while [ $# -ne 0 ]
do
if [ -f "$1" -a -r "$1" ]
then
cat "$1"
else
echo "$1 inaccessible"
fi
shift
done


# Exercice 15
#!/bin/sh

if [ $# -ne 1 -a $# -ne 2 ]
then
echo "Usage : inverse.sh f1 [f2]"
exit 1
fi

if [ $# -eq 2 ]
then
cp "$1" "$2"
"$0" "$2"
else
n=`cat "$1" | wc -l | tr -s ' ' | cut -f2 -d' '`

while [ $n -gt 0 ]
do
head -$n "$1" > .inv1
tail -1 .inv1 >> .inv2
n=`expr $n - 1`
done

cp .inv2 "$1"
rm .inv1 .inv2
fi


# Exercice 16
#!/bin/sh

affichage_menu()
{
echo "commande Unix"
echo "fin"
echo "relancer n"
}

chemin=`pwd`
echo "" > temp

read cmd arg

until [ "$cmd" = fin ]
do

if [ "$cmd" = relancer ]
then
grep '^\$ ' temp | tail -$arg | cut -c3- | while read c
do
echo "\$ $c"
eval "$c" | tee -a temp
done

else
echo "\$ $cmd $arg" >> temp
eval "$cmd" $arg | tee -a temp
fi

read cmd arg
done

rm temp