#!/bin/bash

# for i in {1..10}; do
#     hyprctl dispatch moveworkspacetomonitor "$i" HDMI-A-2
# done
# hyprctl dispatch moveworkspacetomonitor 15 eDP-1
# hyprctl dispatch dpms on HDMI-A-2
# hyprctl dispatch dpms off eDP-1
# hyprctl keyword monitor "$1",preferred,auto,1 &&
hyprctl keyword monitor eDP-1,disabled
notify-send "Monitor attached"

