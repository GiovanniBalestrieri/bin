#!/usr/bin/env python
import rospy
import aiml
import os
import sys
from std_msgs.msg import String

rospy.init_node('aiml_server')
mybot = aiml.Kernel()
mybot.setBotPredicate("name","Sakura")
mybot.setBotPredicate("hometown","127.0.0.1")
mybot.setBotPredicate("password","noise")

#Creating a ROS publisher for the /response topic
response_publisher = rospy.Publisher('response',String,queue_size=10)

#Function to load AIML files using bootstrap() method
def load_aiml(xml_file):
	#Get the path of aiml data set. We have to mention this path
	# on launch file as a rosparameter
	data_path = rospy.get_param("aiml_path")
	os.chdir(data_path)
	if os.path.isfile("noise0001.brn"):
		mybot.bootstrap(brainFile = "noise0001.brn")
	else:
		mybot.bootstrap(learnFiles = xml_file, commands = "load aiml b")
	mybot.saveBrain("noise0001.brn")

#Callback function of /chatter topic. It will receive input from user
#and feed to respond() method of Kernel() object. and print the results
def callback(data):
	input = data.data
	response = mybot.respond(input)
	sleep(0.2)
	rospy.loginfo("You: %s",data.data)
	rospy.loginfo("Me: %s",response)
	response_publisher.publish(response)

#Method to create subscriber in /chatter topic
def listener():
	rospy.loginfo("Starting ROS AIML Server")
	rospy.Subscriber("chatter", String, callback)
	# spin() simply keeps python from exiting until this node is stopped
	rospy.spin()

if __name__ == '__main__':
	load_aiml('startup.xml')
	listener()
