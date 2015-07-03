#!/usr/bin/env python

import re
import subprocess

raw = subprocess.check_output(["amixer", "get", "Master"])
res = raw.decode()


m = re.search("(\d+)\%", res)

if m is None:
	print("V\ue200 No battery")
	exit()

percentage = int(m.group(1))

if percentage > 49:
	c = "\ue050"
else:
	c = "\ue04e"

if percentage == 0 or res.strip()[-4:] == "off]":
	c = "\ue04f"

print("V{} {}%%".format(c, percentage))
