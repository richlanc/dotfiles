#!/bin/bash
set -e

IMAGE=/tmp/lockimage.png
FORTUNE_IMAGE=/tmp/fortune.png

# Get the fortune and create an image with a transparent background
FORTUNE="$(fortune -o -s)"
FORTUNE="$(echo "$FORTUNE" | sed -e 's/\t/    /g' | fold -w 50 -s)"
convert -alpha on -background '#aaa' -pointsize 50 -fill white -stroke black -strokewidth 2 label:"$FORTUNE" -transparent '#aaa' $FORTUNE_IMAGE

scrot $IMAGE
convert $IMAGE -blur 0x4 $IMAGE
composite -dissolve 60% -gravity center $FORTUNE_IMAGE $IMAGE $IMAGE
xte "mousemove 0 0" && i3lock -i $IMAGE
