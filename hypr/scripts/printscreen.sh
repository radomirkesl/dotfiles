#!/bin/bash

FILENAME=~/screenshots/screen-$(date '+%Y%m%d-%H:%M:%S').png

# if first argument is fullscreen, take a screenshot of the whole screen, if it is select, use slurp to select a region

if [ "$1" = "fullscreen" ]; then
    grim $FILENAME
elif [ "$1" = "select" ]; then
    slurp -b 6e6a8688 -c eb6f92ff | grim -g - $FILENAME
else
    echo "Invalid argument"
fi

if [ "$2" = "annotate" ]; then
    satty --filename $FILENAME --copy-command : --fullscreen --output-filename $FILENAME
fi

wl-copy < $FILENAME

