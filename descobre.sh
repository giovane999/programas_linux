#! /bin/bash

if [ $1 == "" ]
then
	echo " "
        echo "------------------------------------------"
        echo "-                                        -"
        echo "---- Desenvolvido por Eric Rodrigues  ----"
	echo "---- Modo de uso : $1 http://alvo.com.br -"
        echo "----    Ericrodrigo999@gmail.com      ----"
	echo "-                                        -"
        echo "------------------------------------------"
        echo " "
else
	echo " "
	echo "Escaniando Aguarde..."
	echo " "

	#Diretorio#
	for palavra in $(cat rato.txt)

	do
		resposta1=$(curl -s -o /dev/null -w "%{http_code}" $1/$palavra/)
		if [ $resposta1 == "200" ]
			then
			echo "Diretorio encontrado -> $1/$palavra"
		fi
        done

        echo " "
        echo "------------------------------------------"
        echo " "
        echo "       Você rodou toda a WordList         "
        echo "        Ericrodrigo999@gmail.com          "
        echo " "
        echo "------------------------------------------"
        echo " "

fi
