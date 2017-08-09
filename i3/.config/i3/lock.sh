#!/bin/bash

function get_x_r() {
	xrdb -query | grep "\b$1\b" | awk '{print $2}'
}

# Black
color0=$(get_x_r color0)
color8=$(get_x_r color8)

# Red
color1=$(get_x_r color1)
color9=$(get_x_r color9)

# Green
color2=$(get_x_r color2)
color10=$(get_x_r color10)

# Yellow
color3=$(get_x_r color3)
color11=$(get_x_r color11)

# Blue
color4=$(get_x_r color4)
color12=$(get_x_r color12)

# Purple
color5=$(get_x_r color5)
color13=$(get_x_r color13)

# Cyan
color6=$(get_x_r color6)
color14=$(get_x_r color14)

# Grey
color7=$(get_x_r color7)
color15=$(get_x_r color15)

FILE=/tmp/i3lock_screen.png

BLURTYPE="1x1"

OP=scale

scrot $FILE
convert $FILE -$OP 5% $FILE
convert $FILE -blur $BLURTYPE $FILE
convert $FILE -$OP 2000% $FILE

i3lock -i $FILE -t -e \
	--indicator \
	-k --timestr="%H:%M" --timesize=80 --datestr="" \
	--timefont="Fantasque Sans Mono" \
	--timepos="ix-(cw/2):iy-(ch/2)+25" --timecolor="${color15}ff" \
	--radius=140 \
	--veriftext="" --wrongtext="" \
	--textcolor="${color15}ff" \
	--insidevercolor="${color2}20" --insidewrongcolor="${color1}20" \
	--insidecolor="${color0}80" --linecolor="${color8}ff" \
	--ringcolor="${color6}80" --ringvercolor="${color10}ff" --ringwrongcolor="${color9}ff" \
	--separatorcolor="${color0}ff" \
	--keyhlcolor="${color3}ff" --bshlcolor="${color1}ff"

rm $FILE
