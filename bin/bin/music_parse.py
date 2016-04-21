#!/usr/bin/env python3

import subprocess

o = subprocess.check_output(["mpc", "-f", "%title%"]).decode()

if "[playing]" in o:
	#p = o.split("\n")
	#print("{}  {}".format(u"\uf001", p[0]))
	print(u"\uf001")
else:
	print(u"\uf04c")