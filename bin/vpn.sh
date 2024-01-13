#!/bin/bash

ICON_ON=""
COLOR_ON="%{F#A6DA95}"
ICON_OFF=" "
COLOR_OFF="%{F#6E738D}"

function show_icon_forti() {
    openvpn_pid=$(pgrep -a openfortivpn);
    if [[ -n ${openvpn_pid} ]];
    then
        echo ${COLOR_ON}${ICON_ON}
    else
        echo ${COLOR_OFF}${ICON_OFF}
    fi
}

function toggle_forti() {
    openvpn_pid=$(pgrep -a openfortivpn)

    if [[ ! -n ${openvpn_pid} ]];
    then
        echo "Connecting to VPN...";
        nmcli connection up Fortinet;
    else
        echo "Disconnecting to VPN...";
        nmcli connection down Fortinet;
    fi
}

function show_icon_forcepoint() {
    forcepoint_container_status=$(docker ps -a --filter "name=forcepoint" --format="{{.State}}")
    if [[ -n ${forcepoint_container_status} ]] && [[ ${forcepoint_container_status} == "running" ]];
    then
        echo ${COLOR_ON}${ICON_ON}
    else
        echo ${COLOR_OFF}${ICON_OFF}
    fi
}

function toggle_forcepoint() {
    forcepoint_container_status=$(docker ps -a --filter "name=forcepoint" --format="{{.State}}")

    if [[ ! -n ${forcepoint_container_status} ]] || [[ ${forcepoint_container_status} == "exited" ]];
    then
        echo "Connecting to VPN...";
        /usr/bin/docker start forcepoint;
    else
        echo "Disconnecting to VPN...";
        /usr/bin/docker stop forcepoint;
    fi
}

if [[ $1 == "forti" ]]
then
    if [[ $2 == "show" ]]
    then
        show_icon_forti
    elif [[ $2 == "toggle" ]]
    then
        toggle_forti
    fi
elif [[ $1 == "forcepoint" ]]
then
    if [[ $2 == "show" ]];
    then
        show_icon_forcepoint
    elif [[ $2 == "toggle" ]];
    then
        toggle_forcepoint
    fi
fi
