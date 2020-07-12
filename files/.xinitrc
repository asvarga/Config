#! /bin/bash

#load xft and urxvt 
# xrdb -merge ~/.Xresources

#speed up touchpad
#do not think this working
DEVICE_ID=$(xinput list | sed -n
			'/bcm5974/s%.*id=\([0-9]\+\).*%\1%p')
ACCEL_SPEED=$(xinput list-props "$DEVICE_ID" | sed -n
			  '/Accel\ Speed\ (/s%.*Accel Speed (\([0-9]\+\)).*%\1%p')
xinput set-prop "$DEVICE_ID" "$ACCEL_SPEED" .5

#fix tearing with compton compisitor
compton --backend glx --vsync opengl &

# # hide mouse when not in use
unclutter &

# #set background
# feh --bg-scale /usr/share/backgrounds/black.jpg
feh --bg-scale /usr/share/backgrounds/ryan-stone-skykomish-river.jpg

# /usr/bin/redshift &

xmobar &

xmodmap ~/.xmodmap

exec xmonad