# ~/.xinitrc

if [ "$(hostname)" == "desktop-arch" ]; then
  xrandr --output "DP-5" --rotate left
  xrandr --output "DP-2" --rotate left 
  xrdb -m ~/.Xresources.d/desktop-arch
elif [ "$(hostname)" == "mbp-arch" ]; then
  xrdb ~/.Xresources.d/mbp-arch
fi

xrdb -merge ~/.Xresources

exec bspwm
