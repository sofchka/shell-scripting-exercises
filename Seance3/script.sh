# Exercice 11
#!/bin/sh

date=`date -R`
jour=`echo $date | cut -f1 -d' '`
numjour=`echo $date | cut -f2 -d' '`
mois=`echo $date | cut -f3 -d' '`
annee=`echo $date | cut -f4 -d' '`
heure=`echo $date | cut -f5 -d' '`

case $jour in
Sun,) jour=Dimanche ;;
Mon,) jour=Lundi ;;
Tue,) jour=Mardi ;;
Wed,) jour=Mercredi ;;
Thu,) jour=Jeudi ;;
Fri,) jour=Vendredi ;;
Sat,) jour=Samedi ;;
esac

case $mois in
Jan) mois=Janvier ;;
Feb) mois=Février ;;
Mar) mois=Mars ;;
Apr) mois=Avril ;;
May) mois=Mai ;;
Jun) mois=Juin ;;
Jul) mois=Juillet ;;
Aug) mois=Aout ;;
Sep) mois=Septembre ;;
Oct) mois=Octobre ;;
Nov) mois=Novembre ;;
Dec) mois=Décembre ;;
esac

echo "$jour $numjour $mois $annee $heure"


# Exercice 12
#!/bin/sh
while read ligne
do
    trad=""
    for mot in $ligne
    do
        t=`grep "^$mot " dico.txt | cut -f2 -d' '`
        trad="$trad $t"
    done
    echo $trad >> f_francais.txt
done < f_anglais.txt


# Exercice 13
#!/bin/sh
choix=0

while [ $choix -ne -2 ]
do
pwd
i=1

for d in *
do
    if [ -d "$d" ]
    then
        echo "$i $d"
        i=`expr $i + 1`
    fi
done

read choix

if [ "$choix" -eq -1 ]
then
    cd ..
fi

if [ "$choix" -gt 0 ]
then
    i=1
    for d in *
    do
        if [ -d "$d" ]
        then
            if [ $i -eq "$choix" ]
            then
                cd "$d"
            fi
            i=`expr $i + 1`
        fi
    done
fi
done