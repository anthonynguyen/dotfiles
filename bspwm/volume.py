#!/usr/bin/env python

import re
import subprocess

raw = subprocess.check_output(["amixer", "get", "Master"])
res = raw.decode()


m = re.search("(\d+)\%", res)

if m is None:
	print("V\ue200 --")
	exit()

percentage = int(m.group(1))

if percentage > 59:
	c = "\ue807"
else:
	c = "\ue806"

if percentage == 0 or res.strip()[-4:] == "off]":
	c = "\ue805"

print("V{} {}%".format(c, percentage))
