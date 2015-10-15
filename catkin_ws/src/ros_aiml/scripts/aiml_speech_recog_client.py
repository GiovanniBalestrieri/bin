#!/usr/bin/env python
import rospy
from std_msgs.msg import String

rospy.init_node('aiml_speech_recog_client')
pub = rospy.Publisher('chatter', String,queue_size=10)
r = rospy.Rate(1) # 10hz

#The output of pocketsphinx package is sending converted text to
#/recognizer/output topic. The following function is the callback
#of this topic. The text will receive and send through /chatter
#topic, which is received by AIML server

def get_speech(data):
	speech_text=data.data
	rospy.loginfo("I said:: %s",speech_text)
	pub.publish(speech_text)

#Creating a subscriber for pocketsphinx output topic
#/recognizer/output
def listener():
	rospy.loginfo("Starting Speech Recognition")
	rospy.Subscriber("/recognizer/output", String, get_speech)
	rospy.spin()

if __name__ == '__main__':
	listener()
