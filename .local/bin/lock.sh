#!/bin/bash
scrot /tmp/screen.png
convert /tmp/screen.png -paint 3 -modulate 80 /tmp/screen.png

if [ -f ~/.config/i3/lock.png ];then
	convert /tmp/screen.png\
		feh ~/.config/i3/lock.png -gravity center -composite -matte\
		/tmp/screen.png
fi

mpc pause

i3lock -u -e -i /tmp/screen.png
rm /tmp/screen.png
