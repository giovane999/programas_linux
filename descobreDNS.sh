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
        echo " "
        echo "Escaniando Aguarde..."
        echo " "

        #Diretorio#
        #for palavra in $(cat /usr/share/dirb/wordlists/common.txt)
        for palavra in $(cat rato.txt)


        do
                #echo "$1/$palavra"
                resposta1=$(curl -s -o /dev/null -w "%{http_code}" $palavra.$1)
                if [ $resposta1 == "200" ]
                        then
                        echo "Diretorio encontrado -> http://$palavra.$1"
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
