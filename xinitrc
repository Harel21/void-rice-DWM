#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#twm &
#xclock -geometry 50x50-1+1 &
#xterm -geometry 80x50+494+51 &
#xterm -geometry 80x20+494-0 &
#exec xterm -geometry 80x66+0+0 -name login
setxkbmap -layout us,il -variant qwerty -option "grp:ctrl_alt_toggle" &
#while xsetroot -name "`date` `uptime | sed 's/.*,//'`"
#do
#	sleep 1
#done &
while true; do 
	(( 10#$(date +%s) % 60 )) || bottomdisp=$(date)
	xsetroot -name "$(topbar) [$bottomdisp]";
	sleep 1;
done  &
exec compton &
feh --bg-scale /home/hd/Pictures/women-1626090730679-3097.jpg &
#feh --bg-scale /home/hd/Pictures/aks-voidX-tech.png &
exec /home/hd/void-rice/dwm-mental/dwm/dwm
