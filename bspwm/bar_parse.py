#!/usr/bin/env python

musicInfo = ""
clockInfo = ""
windowInfo = ""

COLOR_FOCUSED_FG='#FFF6F9FF'
COLOR_FOCUSED_BG ='#FFCC4444'
COLOR_FOCUSED_URGENT_BG='#FF662222'
COLOR_FOCUSED_URGENT_FG='#FF34322E'
COLOR_FG='#FF777777'
COLOR_BG='#FF333333'
COLOR_URGENT_FG='#FFFF0000'
COLOR_TITLE_FG='#FFAAAAAA'
COLOR_STATUS_FG='#FFA3A6AB'

COLOR_INACTIVE_BG='#FF333333'

MPD_LIGHT='#FFAAE3FF'

TIME_LIGHT='#FFFFAAAA'

while True:
	line = input()
	if line[0] == "S":
		musicInfo = "%{{A:urxvt -e ncmpcpp:}} %{{F{}}} {} %{{F-}}%{{A}}".format(MPD_LIGHT, line[1:])
	elif line[0] == "T":
		clockInfo = "%{{A:xclock:}}%{{F{}}} {} %{{F-}} %{{A}}".format(TIME_LIGHT, line[1:])
	elif line[0] == "W":
		winfo = line[1:]
		windowInfo = ""
		for i in winfo.split(":"):
			if i[0] in "OF":
				windowInfo += "%{{A:bspc desktop -f {}:}}%{{B{}}}%{{F{}}} {} %{{F-}}%{{B-}}%{{A}}".format(i[1:], COLOR_FOCUSED_BG, COLOR_FOCUSED_FG, i[1:])
			elif i[0] == "U":
				windowInfo += "%{{A:bspc desktop -f {}:}}%{{B{}}}%{{F{}}} {} %{{F-}}%{{B-}}%{{A}}".format(i[1:], COLOR_FOCUSED_URGENT_BG, COLOR_FOCUSED_URGENT_FG, i[1:])
			elif i[0] in "of":
				windowInfo += "%{{A:bspc desktop -f {}:}}%{{B{}}}%{{F{}}} {} %{{F-}}%{{B-}}%{{A}}".format(i[1:], COLOR_INACTIVE_BG, COLOR_FG, i[1:])
			elif i[0] == "u":
				windowInfo += "%{{A:bspc desktop -f {}:}}%{{B{}}}%{{F{}}} {} %{{F-}}%{{B-}}%{{A}}".format(i[1:], COLOR_INACTIVE_BG, COLOR_URGENT_FG, i[1:])
	print("%{l}" + windowInfo + "%{r}%{B" + COLOR_INACTIVE_BG + "}" + musicInfo + " " + clockInfo + "%{B-}")
