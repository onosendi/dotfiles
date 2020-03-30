# ~/.xinitrc

if [ "$(hostname)" == "desktop-arch" ]; then
  xrandr --output "DP-2" --rotate left
  xrandr --output "DP-3" --rotate left 
  xrdb ~/.Xresources.d/desktop-arch
elif [ "$(hostname)" == "mbp-arch" ]; then
  xrdb ~/.Xresources.d/mbp-arch
fi

xrdb -merge ~/.Xresources

exec bspwm
