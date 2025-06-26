#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

for m in $(polybar -m | cut -d":" -f1); do
    # Launch Polybar for each monitor, using default config location ~/.config/polybar/config.ini
    MONITOR=$m polybar --reload example 2>&1 | tee -a /tmp/polybar.log & disown
    
done

echo "Polybar launched..."
