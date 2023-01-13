#!/usr/bin/env bash

# Terminate already running bar instances
pkill -9 polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload common &
  done
else
  polybar --reload common &
fi

# Launch Polybar, using default config location ~/.config/polybar/config.ini
# polybar common 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."
