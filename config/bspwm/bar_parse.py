#!/usr/bin/env python

winTitle = ""

batteryInfo = ""
volumeInfo = ""
clockInfo = ""
dateInfo = ""
inetInfo = ""
windowInfo = ""

COLOR_FOCUSED_FG="FFFFFF"
COLOR_FG="009966"
#COLOR_FG="009966"
COLOR_URGENT_FG="FF0000"

WHITE="CCCCCC"

HIGHLIGHT1="003322"
HIGHLIGHT2="00B377"
WHITE="FFFFFF"


def fg(s, c, o = "FF"):
	return "%{{F#{}{}}}{}%{{F-}}".format(o, c, s)

def bg(s, c, o = "FF"):
	return "%{{B#{}{}}}{}%{{B-}}".format(o, c, s)

while True:
	line = input()
	if line[0] == "B":
		batteryInfo = fg("{} {}".format(fg(line[1], HIGHLIGHT2), line[2:]), WHITE)
	elif line[0] == "V":
		volumeInfo = fg("%{{A1:~/bin/popup.sh $(~/bin/volume.sh) :}}%{{A4:~/bin/popup.sh $(~/bin/volume.sh +) :}}%{{A5:~/bin/popup.sh $(~/bin/volume.sh -) :}}{} {}%{{A}}%{{A}}%{{A}}".format(fg(line[1], HIGHLIGHT2), line[2:]), WHITE)
	elif line[0] == "I":
		inetInfo = fg("{} {}".format(fg(line[1], HIGHLIGHT2), line[2:]), WHITE)
	elif line[0] == "T":
		clockInfo = fg("{}  {}".format(fg("\ue80e", HIGHLIGHT2), line[1:]), WHITE)
	elif line[0] == "D":
		dateInfo = fg("{}  {}".format(fg("\ue80c", HIGHLIGHT2), line[1:]), WHITE)
	elif line[0] == "A":
		winTitle = line[1:]
	elif line[0] == "W":
		winfo = line[1:]
		windowInfo = ""
		for i in winfo.split(":"):
			if i[0] in "OF":  # focused, normal
				windowInfo += fg("%{{A:bspc desktop -f \"{}\":}}%{{+u}}   {}   %{{-u}}%{{A}}".format(i[1:], i[1:]), COLOR_FOCUSED_FG)
			elif i[0] == "U": # focused, urgent
				windowInfo += fg("%{{A:bspc desktop -f \"{}\":}}%{{+u}}   {}   %{{-u}}%{{A}}".format(i[1:], i[1:]), COLOR_URGENT_FG)
			elif i[0] == "o": # unfocused, normal, has windows
				windowInfo += fg("%{{A:bspc desktop -f \"{}\":}}   {}   %{{A}}".format(i[1:], i[1:]), COLOR_FG)
			elif i[0] == "f": # unfocused, normal, empty
				windowInfo += fg("%{{A:bspc desktop -f \"{}\":}}   {}   %{{A}}".format(i[1:], i[1:]), COLOR_FG)
			elif i[0] == "u": # unfocused, urgent
				windowInfo += fg("%{{A:bspc desktop -f \"{}\":}}   {}   %{{A}}".format(i[1:], i[1:]), COLOR_URGENT_FG)
		windowInfo += ""

	print("%{l}" + bg(windowInfo, HIGHLIGHT1) + "    " + fg(winTitle, WHITE) + "%{r} " + "      ".join([inetInfo, volumeInfo, batteryInfo, dateInfo, clockInfo]) + "   ")