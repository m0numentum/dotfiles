#!/bin/bash

VLC_PATH="/usr/bin/vlc"
YTDL_PATH="/usr/bin/youtube-dl"
SWALLOW_PATH="/usr/bin/i3-swallow"

echo "Using the following format settings: \"$@\""

URL=($($YTDL_PATH --get-url -f $1 $2 | tr ',' '\n'))
FINAL_CMD="${VLC_PATH} ${URL[0]} --input-slave ${URL[1]}"
$SWALLOW_PATH $FINAL_CMD
