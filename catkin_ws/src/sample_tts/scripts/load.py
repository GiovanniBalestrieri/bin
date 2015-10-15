#!/usr/bin/env
import aiml
import sys

myrobot = aiml.Kernel()
myrobot.setBotPredicate("name","Sakura")
myrobot.learn(sys.argv[1])

while True:
	print myrobot.respond(raw_input("Enter input >"))
