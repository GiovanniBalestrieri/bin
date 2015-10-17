#!/usr/bin/env python
import aiml
import sys
import time 
import os
#Change the current path to your aiml files path
os.chdir('./basic')
#os.chdir('./alice')
sakura = aiml.Kernel()
sakura.setBotPredicate("name","Sakura")
sakura.setBotPredicate("hometown","170.01.5.5")
#Learn startup.xml
sakura.learn('startup.xml')
sakura.learn("drugs.aiml")
#Calling load aiml b for loading all AIML files
sakura.respond('load aiml b')

while True:
	quest = raw_input(">: ")
	if quest == "quit":
			exit()
	#else quest == "save":
	#	sakura.saveBrain("noise0001.brn")
	else:
		bot_response = sakura.respond(quest)
	time.sleep(0.4)
	print bot_response
