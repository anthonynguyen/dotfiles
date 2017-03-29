#!/bin/bash

FILE=/tmp/i3lock_screen.png

BLURTYPE="1x1"

OP=scale
# OP=resize

scrot $FILE
convert $FILE -$OP 5% $FILE
convert $FILE -blur $BLURTYPE $FILE
convert $FILE -$OP 2000% $FILE
i3lock -i $FILE -t -e
rm $FILE
