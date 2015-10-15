#!/usr/bin/env python

import numpy as np
import cv2

cap  = cv2.VideoCapture(0)

while(True):

	#Caputer frame-by-frame
	ret, frame = cap.read()
	#Display the resulting frame 
	cv2.imwrite('houghlines5.jpg',frame)
	
	if cv2.waitKey(10):
		break
