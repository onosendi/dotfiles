#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar
if [ "$(hostname)" == "desktop-arch" ]; then
  polybar --config="$HOME/.config/polybar/config-desktop-arch" --reload DP-3 &
  polybar --config="$HOME/.config/polybar/config-desktop-arch" --reload DP-5 &
  polybar --config="$HOME/.config/polybar/config-desktop-arch" --reload DP-2 &
elif [ "$(hostname)" == "mbp-arch" ]; then
  polybar --config="$HOME/.config/polybar/config-mbp-arch" --reload main &
fi
