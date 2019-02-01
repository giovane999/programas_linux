#! /bin/bash

if [ -z $1 ]
then
	echo " "
        echo "============================================================"
        echo "Desenvolvido por Eric Rodrigues"
	echo "Modo de uso : ./descobre http://alvo.com.br "
        echo "Ericrodrigo999@gmail.com"
        echo "============================================================"
        echo " "
else

wget $1

cat parsinurl.html | grep href | cut -d "/" -f3 | grep "\." | sort -u | cut -d '"' -f1 > listaUrl
rm index.html

for url in $(cat listaUrl);do host $url;done | grep "has address"


fi
