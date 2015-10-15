#!/usr/bin/env python
import aiml
import sys
import os
#Change the current path to your aiml files path
os.chdir('./alice')
mybot = aiml.Kernel()
mybot.setBotPredicate("name","Sakura")
#Learn startup.xml
mybot.learn('startup.xml')
#Calling load aiml b for loading all AIML files
mybot.respond('load aiml b')

while True:
	print mybot.respond(raw_input("Enter input >"))
