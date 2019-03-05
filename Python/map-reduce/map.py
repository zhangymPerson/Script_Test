#/usr/bin/env python

# 
import sys

print "begining ..."

for word in sys.stdin:
	ss= word.split(" ")
	for w in  ss:
		print w


