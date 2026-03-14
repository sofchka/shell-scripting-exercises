# script1.sh
#!/bin/sh
mkdir "$1"
cp "$2" "$1"


# script2.sh
#!/bin/sh
rm "$1"/*
rmdir "$1"


# script3.sh
#!/bin/sh
mkdir REP
ls *.txt > REP/liste.txt
ls *.sh >> REP/liste.txt
cp `tail -n 1 REP/liste.txt` REP
rm REP/liste.txt


# Exercice 9
#!/bin/sh
echo "Il y a `ls -al | grep -c '^-.*\.txt$'` fichiers .txt"
echo "Il y a `ls -al | grep -c '^-.*\.sh$'` fichiers .sh"
echo "Il y a `ls -al | grep -c '^-.* \.'` fichiers cachés"
echo "Il y a `ls -al | grep -v '\.txt$' | grep -v '\.sh$' | grep -v ' \.' | grep -c '^-'` autres fichiers"


# Exercice 10
cd
cp users/linfg/linfg0/S3/liste.txt .

tail -n +6 liste.txt | grep 'linfg[0-9]$' | sort -k3 | head -n1 | cut -f1 -d' '

tail -n +6 liste.txt | grep 'linfg[0-9]\{3\}$' | sort -k3 | tail -n1 | cut -f1 -d' '


#!/bin/sh
echo "Il y a `tail -n +6 liste.txt | cut -f1 -d' ' | grep '.\{'$1'\}' | grep -v '.\{'$2'\}' | wc -l | tr -d ' '` étudiants"