# Exercice 1
ls users/linfg/linfg0/S4/*.txt

echo Le renard dit \"Oh, Monsieur du Corbeau\"
echo J\'ai gagne \$100 a l\'Alcazar
echo Commentaire : \\\* Initialisation \*\\


# Exercice 2
cd
pwd

mkdir -p REP/SOUSREP

cp users/linfg/linfg0/S4/liste.txt REP/SOUSREP

cd REP/SOUSREP
ls

mv liste.txt ..

cd
rmdir REP/SOUSREP
rm REP/liste.txt
rmdir REP


# Exercice 3
cd
cp users/linfg/linfg0/S4/liste.txt .

more liste.txt

ls -l

chmod u-w liste.txt

ls -l

chmod u+w liste.txt


# Exercice 4
tail -n -5 liste.txt
tail -n +5 liste.txt
head -5 liste.txt
head liste.txt


# Exercice 5
tail -n +6 liste.txt | grep 'linfg[0-9]$' | sort -k 3 > temp
tail -n +6 liste.txt | grep 'linfg[0-9]\{2\}$' | sort -k 3 >> temp
tail -n +6 liste.txt | grep 'linfg[0-9]\{3\}$' | sort -k 3 >> temp
cat temp
rm temp

tail -n +6 liste.txt | sort -k 2


# Exercice 6
grep ' LAURENT ' liste.txt

tail -n +5 liste.txt | grep -v 'linfg[0-9]\{3\}$'

grep 'linfg.*1' liste.txt


# Exercice 7
echo Est-ce que j\'arrive > tdm01.txt
echo a rediriger la >> tdm01.txt
echo sortie standard \? >> tdm01.txt

cat liste.txt
cat liste.txt > liste2.txt
rm liste2.txt
cat liste.txt | tail -5

head -n 10 liste.txt | tail -n +5