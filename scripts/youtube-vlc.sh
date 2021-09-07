#!/bin/bash

VLC_PATH="/usr/bin/vlc"
YTDL_PATH="/usr/bin/youtube-dl"
SWALLOW_PATH="/usr/bin/i3-swallow"
VLC_OPTIONS=""

while getopts "a" option
do
    case $option in
        a) VLC_OPTIONS="${VLC_OPTIONS} --no-video --play-and-exit"; shift
            ;;
    esac
done

echo "Using the following format settings: \"$@\""

URL=($($YTDL_PATH --get-url $1 | tr ',' '\n'))
FINAL_CMD="${VLC_PATH} ${VLC_OPTIONS} ${URL[0]} --input-slave ${URL[1]}"
$SWALLOW_PATH $FINAL_CMD
