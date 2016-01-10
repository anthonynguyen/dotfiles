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
	c = "\ue80a"
elif percentage < 11:
	c = "\ue808"
else:
	c = "\ue809"

if "Charging" in res:
	c = "\ue80b"

print("B{} {}%".format(c, percentage))
