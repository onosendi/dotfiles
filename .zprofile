# Start X automatically after login.
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx > /tmp/xorg.log 2>&1
fi
