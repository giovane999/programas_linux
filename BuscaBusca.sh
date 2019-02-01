#! /bin/bash

if [ -z $1 ]
then
	echo " "
    echo "============================================================"
	echo "Modo de uso : ./descobre http://alvo.com.br "
    echo "============================================================"
    echo " "
else

		echo ""
		echo "============================================================"
		echo "Procurando Links"
		echo "============================================================"
		echo ""

	wget $1

	cat index.html | grep href | cut -d "/" -f3 | grep "\." | sort -u | cut -d '"' -f1 > listaUrl
	rm index.html

	for url in $(cat listaUrl);do host $url;done | grep "has address"
	 
		echo ""
		echo "============================================================"
		echo "Procurando Sub-Dominios"
		echo "============================================================"
	 	echo ""

	for palavra in $(cat rato.txt)
	do
	    resposta1=$(curl -s -o /dev/null -w "%{http_code}" $palavra.$1)
	    if [ $resposta1 == "200" ]
	            then
	            echo "Diretorio encontrado -> http://$palavra.$1"
	    fi
	done

		echo ""
		echo "============================================================"
		echo "Procurando Pastas"
		echo "============================================================"
	 	echo ""

	for palavra in $(cat rato.txt)
	do
		resposta1=$(curl -s -o /dev/null -w "%{http_code}" $1/$palavra/)
		if [ $resposta1 == "200" ]
			then
			echo "Diretorio encontrado -> $1/$palavra"
		fi
	done

fi
