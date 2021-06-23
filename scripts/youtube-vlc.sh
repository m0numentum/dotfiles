#!/bin/bash

VLC_PATH="/usr/bin/vlc"
YTDL_PATH="/usr/bin/youtube-dl"

echo "Using the following format settings: \"$@\""

TOTO=$($YTDL_PATH --get-url -f $1 $2)
URL=($(echo $TOTO | tr ',' '\n'))
$VLC_PATH "${URL[0]}" --input-slave "${URL[1]}"
