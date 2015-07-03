#!/usr/bin/env python

winTitle = ""

batteryInfo = ""
volumeInfo = ""
clockInfo = ""
dateInfo = ""
inetInfo = ""
windowInfo = ""

COLOR_FOCUSED_FG="F6F9FF"
COLOR_FOCUSED_URGENT_FG="34322E"
COLOR_FG="009966"
COLOR_URGENT_FG="FF0000"

STATUS_C="AAAAAA"

HIGHLIGHT="006644"
WHITE="FFFFFF"


def fg(s, c, o = "FF"):
	return "%{{F#{}{}}}{}%{{F-}}".format(o, c, s)

def bg(s, c, o = "FF"):
	return "%{{B#{}{}}}{}%{{B-}}".format(o, c, s)

while True:
	line = input()
	if line[0] == "B":
		batteryInfo = fg(" {}  ".format(line[1:]), STATUS_C)
	elif line[0] == "V":
		volumeInfo = fg(" {} ".format(line[1:]), STATUS_C)
	elif line[0] == "I":
		inetInfo = fg(" {} ".format(line[1:]), STATUS_C)
	elif line[0] == "T":
		clockInfo = fg(" \ue015 {}  ".format(line[1:]), WHITE)
	elif line[0] == "D":
		dateInfo = fg("  \ue225 {} ".format(line[1:]), WHITE)
	elif line[0] == "A":
		winTitle = line[1:]
	elif line[0] == "W":
		winfo = line[1:]
		windowInfo = " "
		for i in winfo.split(":"):
			if i[0] in "OF":  # focused, normal
				windowInfo += fg(" \ue000 ", COLOR_FOCUSED_FG)
			elif i[0] == "U": # focused, urgent
				windowInfo += fg(" \ue000 ", COLOR_FOCUSED_URGENT_FG)
			elif i[0] in "of": # unfocused, normal
				windowInfo += fg(" \ue001 ", COLOR_FG)
			elif i[0] == "u": # unfocused, urgent
				windowInfo += fg(" \ue001 ", COLOR_URGENT_FG)
		windowInfo += " "

	print("%{l}" + bg(windowInfo, HIGHLIGHT) + "  " + fg(winTitle, STATUS_C) + "%{r} " + inetInfo + volumeInfo + batteryInfo + bg(dateInfo + clockInfo, HIGHLIGHT))