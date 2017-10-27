#!/bin/sh

touchpad_id=$(xinput list | grep -i touchpad | awk '{print $7}' | awk -F"=" '{print $2}')
tap_enabled=$(xinput list-props $touchpad_id | grep 'Tapping Enabled (' | awk -F'[)(]' '{print $2}')

xinput set-prop $touchpad_id $tap_enabled 1
