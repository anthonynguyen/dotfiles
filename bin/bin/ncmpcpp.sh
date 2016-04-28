#!/bin/bash

if [ "$(pidof ncmpcpp)" ]
then
  pkill ncmpcpp
else
 urxvt -e ncmpcpp -s visualizer
fi
