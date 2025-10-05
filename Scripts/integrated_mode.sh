#!/bin/bash

supergfxctl -m Integrated
sleep 5
if [[ "$DESKTOP_SESSION" == "Openbox" ]]; then
  openbox --exit
elif [[ "$DESKTOP_SESSION" == "bspwm" ]]; then
  bspc quit
elif [[ "$DESKTOP_SESSION" == "i3" ]]; then
  i3-msg exit
elif [[ "$DESKTOP_SESSION" == "awesome" ]]; then
  awesome-client 'awesome.quit()'
fi
#reboot
