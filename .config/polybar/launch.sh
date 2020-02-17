#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar
if [ "$(hostname)" == "desktop-arch" ]; then
  CONFIG_FILE="config-desktop-arch"
elif [ "$(hostname)" == "mbp-arch" ]; then
  CONFIG_FILE="config-mbp-arch"
fi
polybar --config="$HOME/.config/polybar/${CONFIG_FILE}" --reload main &
