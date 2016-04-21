#!/bin/bash

sleep 10

synclient TapButton1=1
synclient TapButton2=3
synclient TapButton3=2
~/touchpadbuttons.sh &
volumeicon &

killall notification-daemon
dunst &