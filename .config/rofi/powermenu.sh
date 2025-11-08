#!/usr/bin/env bash

## Author: Aditya Shakya
## Mail: adi1090x@gmail.com
## Github: @adi1090x
## Twitter: @adi1090x

dir="${XDG_CONFIG_HOME:-$HOME/.config}/rofi"
uptime=$(uptime -p | sed -e 's/up //g')

rofi_command="rofi -i -theme $dir/powermenu.rasi"

# Options
lock=" Lock"
logout="󰍃 Logout"
suspend="󰒲 Sleep"
shutdown="⏻ Shutdown"
reboot=" Restart"
reboot_to_windows=" Reboot to Windows"
hibernate=" Hibernate"
cancel=" Cancel"

# Confirmation
confirm_exit() {
  rofi -dmenu -i -no-fixed-num-lines -p "Are You Sure? : " \
    -theme $dir/confirm.rasi
}

# Message
msg() {
  rofi -theme "$dir/message.rasi" -e "Available Options  -  yes / y / no / n"
}

# Check whether a command exists
function command_exists() {
  command -v "$1" &>/dev/null 2>&1
}

# systemctl required
if ! command_exists systemctl; then
  exit 1
fi

# Variable passed to rofi
options="$lock\n$logout\n$suspend\n$shutdown\n$reboot\n$reboot_to_windows\n$hibernate\n$cancel"

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 0)"
case $chosen in
$lock)
  betterlockscreen -l
  ;;
$logout)
  if [[ "$DESKTOP_SESSION" == "Openbox" ]]; then
    openbox --exit
  elif [[ "$DESKTOP_SESSION" == "bspwm" ]]; then
    bspc quit
  elif [[ "$DESKTOP_SESSION" == "i3" ]]; then
    i3-msg exit
  elif [[ "$DESKTOP_SESSION" == "awesome" ]]; then
    awesome-client 'awesome.quit()'
  fi
  ;;
$suspend)
  mpc -q pause
  amixer set Master mute
  systemctl suspend
  ;;
$shutdown)
  systemctl poweroff
  ;;
$reboot)
  systemctl reboot
  ;;
$hibernate)
  systemctl hibernate
  ;;
$reboot_to_windows)
  systemctl start reboot-to-windows.service
  ;;
$cancel) ;;
esac
