#!/usr/bin/env python

import re
import subprocess

raw = subprocess.check_output(["acpi", "-b"])
res = raw.decode()


m = re.search("(\d+)\%", res)

if m is None:
	print("B\xF1 No battery")
	exit()

percentage = int(m.group(1))

if percentage > 89:
	c = "\ue1ff"
elif percentage < 11:
	c = "\ue1fd"
else:
	c = "\ue1fe"

if "Charging" in res:
	c = "\ue200"

print("B{} {}%%".format(c, percentage))
