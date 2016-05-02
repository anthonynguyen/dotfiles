#!/usr/bin/env python3

import re
import subprocess
import sys

_LENGTH = 20

try:
	action = sys.argv[1]
except:
	action = None

if action == "+":
	subprocess.call(["amixer", "set", "Master", "5%+"])
elif action == "-":
	subprocess.call(["amixer", "set", "Master", "5%-"])
elif action == "mute":
	subprocess.call(["amixer", "set", "Master", "toggle"])

volumere = re.compile(r"\[(\d+)%\].+\[(on|off)\]")

ret = subprocess.check_output(["amixer"]).decode()

m = volumere.search(ret)
if m is not None:
	volume = int(m.group(1))
	on = (m.group(2) == "on")

	summary = "<b>"


	if on:
		summary += "Volume"
	else:
		summary += "Muted"

	summary += " [{}%]</b>\n".format(volume)

	ticks = int(volume / 100.0 * _LENGTH)

	if on:
		body = "█" * ticks
	else:
		body = "░" * ticks

	body += "▁" * (_LENGTH - ticks)

	subprocess.call(["notify-send", "-u", "low", "DUNST_COMMAND_REPLACE" + summary + body])
