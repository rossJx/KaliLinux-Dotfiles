#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 at top and bar2 at bottom
polybar top -c ~/.config/polybar/config-top.ini &
#polybar bottom -c ~/.config/polybar/config-bottom.ini &

#Launch polybar on external monitor
external_monitor=$(xrandr -q | grep -w HDMI1| awk '{print $2}')
if [ $external_monitor = 'connected' ]; then
	polybar top_external -c ~/.config/polybar/config-top.ini &
fi

