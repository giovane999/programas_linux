import socket

try:

	ip = raw_input('Digite o alvo: ')
	begin_port = input('Digite a porta de inicio: ')
	end_port = input('Digite a porta de final: ')
	print('Escaniando aguarde...')
	for i in range(begin_port,end_port+1):

		sock = socket.socket()
		sock.settimeout(0.5)
		result = sock.connect_ex((str(ip),int(i)))
		
		if result == 0:
			print 'Port ' + str(i) + " is OPEN on " + str(ip)
			sock.close()
		else:
#			print 'Port ' + str(i) + " is CLOSE on " + str(ip) 
			sock.close()
except KeyboardInterrupt:
	print "exit ..."
	exit()
