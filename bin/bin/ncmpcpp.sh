#!/bin/bash

if [ "$(pidof ncmpcpp)" ]
then
  pkill ncmpcpp
else
  st -e ncmpcpp -s visualizer
fi
