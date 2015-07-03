#!/bin/bash
# Adapted from http://www.twily.info/drawterm

#
#   Author:         Twily                                           2015
#   Description:    Spawn a new terminal window inside a drawn rectangle
#   Requires:       slop (or xrectsel: http://pastebin.com/eeLRBed6), urxvt
#   Usage:          Bind hotkey to $ sh ./drawterm
#
#   Note:           if using compton w/ shadows, exclude "class_g = 'slop'"
#

M=4                 # slop border width

REC=$(slop -t 0 -b $M -c 0,0.5,0.3,1 -f "%w %h %x %y" --nokeyboard) || exit 1
#REC=$(xrectsel) || exit 1

IFS=' ' read -r W H X Y <<< "$REC"

aX=$(( $X - $M )) && aY=$(( $Y - $M ))
aW=$(( $W + ( $M * 2 ) )) && aH=$(( $H + ( $M * 2 ) ))

if [ "$W" -gt "1" ]; then
    # Calculate width and height to block/font size
    let W=$(( $W / 6 ))-2
    let H=$(( $H / 10 ))-1

    urxvt -name urxvt_float -g $W"x"$H"+"$X"+"$Y &
fi

exit 0
