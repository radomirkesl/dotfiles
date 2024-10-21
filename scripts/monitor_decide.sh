#!/bin/bash

if hyprctl monitors all | grep -q HDMI-A-2; then
    ~/.config/hypr/scripts/monitor_attached.sh
else
    ~/.config/hypr/scripts/monitor_detached.sh
fi

