#!/bin/bash

export GTK_IM_MODULE=kime
export QT_IM_MODULE=kime
export XMODIFIERS=@im=kime
kime

xset -dpms

xset s blank
xset s on
xset s 3600

# Faster key repeat and delay
xset r rate 200 50
xsetroot -cursor_name left_ptr

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
# Add following to ~/.Xresources
# Xcursor.size: 48
# Xft.dpi: 144

# export "$(/usr/lib/systemd/user-environment-generators/30-systemd-environment-d-generator)"

exec bspwm
