#!/bin/bash
# changeVolume
if [ $1 == "inc" ];
then
	amixer -q sset Master 5%+
elif [ $1 == "dec" ];
then
	amixer -q sset Master 5%-
elif [ $1 == "mute" ];
then
	amixer -q sset Master toggle
fi

XOB_FIFO=/tmp/xobfifo
VOLUME="$(/usr/bin/amixer sget Master | awk -F '[][]' '/Right:/ {print $2}' | tr -d '%')"
MUTE="$(/usr/bin/amixer sget Master | grep -o '\[off\]' | tail -n 1)"


if [[ "${MUTE}" == "[off]" ]];
then
	echo "${VOLUME}!" >> ${XOB_FIFO}
else
	echo "${VOLUME}" >> ${XOB_FIFO}
fi
