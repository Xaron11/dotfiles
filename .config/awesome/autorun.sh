#!/bin/sh

run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

# run "/usr/bin/sxhkd"
# run "$HOME/.config/polybar/launch.sh"
run "$HOME/Scripts/autorandr_hybrid.sh"
killall picom
run "picom"
setxkbmap -layout pl -option caps:swapescape
