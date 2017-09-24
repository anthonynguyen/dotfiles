#!/bin/sh

touchpad_id=$(xinput list | grep -i touchpad | awk '{print $7}' | awk -F"=" '{print $2}')

xinput set-prop $touchpad_id 295 1
