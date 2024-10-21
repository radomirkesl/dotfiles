#!/bin/bash

# for i in {1..10}; do
#     hyprctl dispatch moveworkspacetomonitor "$i" eDP-1
# done
# hyprctl dispatch moveworkspacetomonitor 15 HDMI-A-2
# hyprctl dispatch dpms on eDP-1
# hyprctl dispatch dpms off HDMI-A-2
hyprctl keyword monitor eDP-1,preferred,auto,1
notify-send "Monitor detached"
# && hyprctl keyword monitor "$1",disabled

