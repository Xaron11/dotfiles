#!/usr/bin/env bash

# Define rates per application (WM_CLASS)
declare -A rates
rates=( ["qutebrowser"]="201 25" ["otherapp"]="400 20" )

default_rate="660 25"


last_app=""

while true; do
    focused_app=$(xdotool getwindowfocus getwindowclassname)
    
    if [[ "$focused_app" != "$last_app" ]]; then
        if [[ -n "${rates[$focused_app]}" ]]; then
            xset r rate ${rates[$focused_app]}
        else
            xset r rate $default_rate
        fi
        last_app=$focused_app
    fi
    sleep 0.1
done
