#!/bin/bash

MAX=$((`brightnessctl -d tpacpi::kbd_backlight max` + 1))
CUR=`brightnessctl -d tpacpi::kbd_backlight get`

brightnessctl -d tpacpi::kbd_backlight set $((($CUR + 1) % $MAX))
