# ~/.xinitrc

xrandr --output "DP-2" --rotate left
xrdb ~/.Xresources

exec bspwm
