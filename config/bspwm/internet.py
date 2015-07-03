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

if strength <= 30:
	c = "\ue0ee"
elif strength <= 70:
	c = "\ue0ef"
else:
	c = "\ue0f0"

print("I{} {}".format(c, ssid))
