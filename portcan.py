#!/usr/bin/dev python 

import socket

try:

    ip = input("Digite o ip do Alvo: ")
    portaInicial = int(input("Porta inicial: "))
    portaFinal = int(input("Porta final: "))
    print("Escaniando...")

    for i in range(portaInicial,portaFinal+1):
        sock = socket.socket()
        sock.settimeout(0.5)
        resultado = sock.connect_ex((str(ip), int(i)))

        if resultado == 0: 
            print("Porta {} Aberta {}".format(i,ip))
            sock.close()
        else:
            sock.close()

except KeyboardInterrupt:
    print("Fim")
    exit()
