#!/bin/sh

FG="#FFFFFFFF"
BG="#FFFF0044"

FONT_1="-xos4-terminus-medium-r-normal--12-120-72-72-c-60-iso10646-1"
FONT_2="-wuncon-siji-medium-r-normal--10-100-75-75-c-80-iso10646-1"

CHAR_WIDTH=6

A=" $@ "
LENGTH=${#A}

W=$(($(($LENGTH + 2)) * $CHAR_WIDTH))
H=28

X=$(expr 1909 - ${W})
Y=36

(echo "$A"; sleep 4s) | lemonbar -g ${W}x${H}+${X}+${Y} -B $BG -F $FG -f "$FONT_1" -f "$FONT_2" &