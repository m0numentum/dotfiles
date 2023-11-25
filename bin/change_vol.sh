#!/bin/bash

# Arbitrary but unique message tag
msgTag="myvolume"

# Query pactl for the current volume and whether or not the speaker is muted
volume="$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')"
mute="$(pactl list sinks | grep '^[[:space:]]Mute:' | sed -e 's/.*: \(\w\)/\1/')"

if [[ $volume == 0 || "$mute" == "yes" ]]; then
    # Show the sound muted notification
    dunstify -a "changeVolume" -u low -i audio-volume-muted -h string:x-dunst-stack-tag:$msgTag "Volume muted" 
else
    # Show the volume notification
    dunstify -a "changeVolume" -u low -i audio-volume-high -h string:x-dunst-stack-tag:$msgTag -h int:value:"$volume" "Volume: ${volume}%"
fi
