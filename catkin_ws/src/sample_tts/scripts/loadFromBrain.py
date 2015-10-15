#!/usr/bin/env python
import aiml
import sys
import os

os.chdir('./alice')
mybot = aiml.Kernel()
mybot.setBotPredicate("name","Sakura")

if os.path.isfile("standard.brn"):
	mybot.bootstrap(brainFile = "standard.brn")
else:
	#load all AIML files and save a new brain
	mybot.bootstrap(learnFiles = "startup.xml", commands = "load aiml b")

#mybot.saveBrain("standard.brn")
#mybot.learn('startup.xml')
#mybot.respond('load aiml b')
#Saving loaded patterns into a brain file
#mybot.saveBrain('standard.brn')
while True:
	print mybot.respond(raw_input("Enter input >"))
