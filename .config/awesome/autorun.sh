#!/bin/sh

run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

# run "/usr/bin/sxhkd"
# run "$HOME/.config/polybar/launch.sh"
run "setxkbmap" pl
run "$HOME/Scripts/autorandr_hybrid.sh"
exec zsh &
killall picom
run "picom"
run "$TERM"
