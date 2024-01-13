#!/bin/bash

# Arbitrary but unique message tag
msgTag="myvolume"

# Query pactl for the current volume and whether or not the speaker is muted
default_sink=$(pactl get-default-sink);
volume="$(pactl get-sink-volume ${default_sink} | grep '^Volume:' | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')"
mute="$(pactl get-sink-mute ${default_sink} | grep '^Mute:' | sed -e 's/.*: \(\w\)/\1/')"

if [[ $volume == 0 || "$mute" == "yes" ]]; then
    # Show the sound muted notification
    dunstify -a "changeVolume" -u low -i audio-volume-muted -h string:x-dunst-stack-tag:$msgTag "Volume muted" 
else
    # Show the volume notification
    dunstify -a "changeVolume" -u low -i audio-volume-high -h string:x-dunst-stack-tag:$msgTag -h int:value:"$volume" "Volume: ${volume}%"
fi
