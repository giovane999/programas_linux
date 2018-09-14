#!/bin/bash
if ["$1" == ""]

then
	echo "Programa busca links e guarda em uma lista, em seguida faz um loop com o comando host para pegar o ip do servidor"
	echo "ParsingUrl - Eric"
	echo "Exemplo de uso $1 10.0.0.1"
else

wget $1

cat index.html | grep href | cut -d "/" -f3 | grep "\." | sort -u | cut -d '"' -f1 > listaUrl
rm index.html

for url in $(cat listaUrl);do host $url;done | grep "has address"


fi
