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

curl http://api.hackertarget.com/hostsearch/?q=$1 -m 30 | sed 's/,/ /' | awk '{print $1}' | grep "$1" > /tmp/onlineFoundSubdomains

curl http://api.hackertarget.com/hostsearch/?q=$1 -m 30 | sed 's/,/ /' | awk '{print $1}' | grep "$1" >> /tmp/onlineFoundSubdomains

curl https://www.virustotal.com/en/domain/$1/information/ -H 'Host: www.virustotal.com' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' -H 'Accept-Language: en-US,en;q=0.5' --compressed -m 30 | grep information | grep "$1" | awk '{print $3}' | sed 's/\// /g' | awk '{print $4}' >> /tmp/onlineFoundSubdomains

onlineSub=$(cat /tmp/onlineFoundSubdomains | sort | uniq)
echo "$onlineSub"

fi


echo ""
echo ""
read -p "Aperte Enter para rodar o dirb..."
echo "-------------------DIRB-------------------"

file="$(echo "$onlineSub")"
for url in $file; do
	xterm -e bash -c 'dirb http://'$url'/ /usr/share/dirb/wordlists/big.txt -f ; exec bash' &
done


echo ""
echo ""
read -p "Aperte Enter para rodar o nmap..."
echo "-------------------DIRB-------------------"

file="$(echo "$onlineSub")"
for url in $file; do
	xterm -e bash -c 'nmap -sV -Pn -v '$url'; exec bash' &
done
