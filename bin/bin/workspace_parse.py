#!/usr/bin/env python3

symbols = [
	u"\uf015", # home
	u"\uf0b1", # briefcase
	u"\uf069", # asterisk
	u"\uf067", # plus
]

def resolve(n):
	try:
		s = symbols[n]
	except:
		s = str(n)

	return s

while True:
	a = input()
	p = a.split()
	if "_NET_CURRENT_DESKTOP" in p[0]:
		print(resolve(int(p[2])))