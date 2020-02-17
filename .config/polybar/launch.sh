#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar
if [ "$(hostname)" == "desktop-arch" ]; then
  if type "xrandr" 2> /dev/null; then
    for monitor in $(xrandr --query | grep " connected" | cut -d" " -f1); do
      polybar --config="$HOME/.config/polybar/config-desktop-arch" --reload $monitor &
    done
  else
    echo ERROR: xrandr not installed
    exit 1
  fi
elif [ "$(hostname)" == "mbp-arch" ]; then
  polybar --config="$HOME/.config/polybar/config-mbp-arch" --reload main &
fi
