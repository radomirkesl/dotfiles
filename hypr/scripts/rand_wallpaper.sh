#!/bin/bash

# This script will randomly go through the files of a directory, setting it
# up as the wallpaper at regular intervals
#
# NOTE: this script uses bash (not POSIX shell) for the RANDOM variable

if [[ $# -lt 1 ]] || [[ ! -d $1   ]]; then
	echo "Usage: $0 <dir containing images>"
	exit 1
fi

# Edit below to control the images transition
export SWWW_TRANSITION=random
export SWWW_TRANSITION_STEP=90
export SWWW_TRANSITION_DURATION=3
export SWWW_TRANSITION_FPS=90

# This controls (in seconds) when to switch to the next image
INTERVAL=300

while true; do
	find "$1" \
		| while read -r img; do
			echo "$((RANDOM % 1000)):$img"
		done \
		| sort -n | cut -d':' -f2- \
		| while read -r img; do
			swww img --fill-color 232136 --resize fit "$img"
			sleep $INTERVAL
		done
done
