#!/bin/bash

sleep 10

synclient TapButton1=1
synclient TapButton2=3
synclient TapButton3=2
synclient VertTwoFingerScroll=1
synclient HorizTwoFingerScroll=1

killall notification-daemon
volumeicon &
