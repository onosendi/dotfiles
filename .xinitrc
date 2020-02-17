# ~/.xinitrc

if [ "$(hostname)" == "desktop-arch" ]; then
  xrandr --output "DP-5" --rotate left
  xrandr --output "DP-2" --rotate left 
fi

xrdb ~/.Xresources
exec bspwm
