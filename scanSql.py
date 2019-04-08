#!/usr/bin/env python

#importa a funcao de acessar e ler o html da pagina
from urllib.request import urlopen
import socket, os 


#Pega a URL
print("Ex: http://testphp.vulnweb.com/listproducts.php?cat=1\n")
url = input("Digite a url: ")
 
#Coloca aspas 
x = url.split('=')
p = x[0]+"='"

print("\n\n------------------------------------------------------------------------------------\n")
print("Buscando Vulnerabilidade -> ",p)
print("\n------------------------------------------------------------------------------------\n")

pagina = urlopen(p) 
texto = pagina.read().decode('utf8')

#remove os espacamentos da tecla TAB
#texto = texto.replace("\t", "")
 


# manipulando arquivos em python:

arquivo = open('texto.txt', 'w')
texto = texto
arquivo.write(texto)
arquivo.close()

arquivo = open('texto.txt', 'r')
texto = arquivo.read()
arquivo.close()

os.system("clear")
for linha in open("texto.txt"):
    if 'sql' in linha:
       print("\nRESULTADOS\n==============================================================================\n\n \033[31m Vulneravel \033[m ->",url)
       print(" \033[31m Erro \033[m ->",linha,"\n==============================================================================\n")
 
os.system("rm texto.txt")
