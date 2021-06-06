#!/usr/bin/env bash

rofi_command="rofi -theme ${HOME}/.config/rofi/power_menu.rasi"

# Options
shutdown=""
reboot=""
lock=""
suspend=""
logout=""


# Variable passed to rofi
options="$suspend\n$logout\n$lock\n$shutdown\n$reboot"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 2)"
case $chosen in
    $shutdown)
		systemctl poweroff
        ;;
    $reboot)
		systemctl reboot
        ;;
    $lock)
        /usr/bin/betterlockscreen -l dim
        ;;
    $suspend)
		mpc -q pause
		amixer set Master mute
		systemctl suspend
        ;;
    $logout)
		i3-msg exit
        ;;
esac
