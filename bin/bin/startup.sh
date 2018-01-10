#!/bin/sh

xrdb ~/.Xresources
setxkbmap -option caps:super
exec ~/.config/i3/touchpad.sh
