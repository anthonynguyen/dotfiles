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
	subprocess.call(["xbacklight", "-inc", "10"])
elif action == "-":
	subprocess.call(["xbacklight", "-dec", "10"])

brightre = re.compile(r"(\d+)")

ret = subprocess.check_output(["xbacklight"]).decode()

m = brightre.search(ret)
if m is not None:
	brightness = int(m.group(1))

	summary = "<b>Brightness [{}%]</b>\n".format(brightness)

	ticks = int(brightness / 100.0 * _LENGTH)

	body = "█" * ticks
	body += "▁" * (_LENGTH - ticks)

	subprocess.call(["notify-send", "-u", "low", "DUNST_COMMAND_REPLACE" + summary + body])