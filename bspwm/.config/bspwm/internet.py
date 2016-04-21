#!/usr/bin/env python

import re
import subprocess

raw = subprocess.check_output(["iwconfig", "wlp4s0"])
res = raw.decode()


m = re.search("Link Quality=(\d+)/(\d+)", res)
n = re.search("ESSID:\"(.+?)\"", res)

if m is None or n is None:
	print("I\ue0f0 D/C")
	exit()

strength = int(int(m.group(1)) / int(m.group(2)) * 100)
ssid = n.group(1)

print("I\ue804  {} ({}%)".format(ssid, strength))
