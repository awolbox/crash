#!/bin/sh
xrandr --output VGA-0 --off --output LVDS-0 --off --output HDMI-1 --off --output HDMI-0 --mode 1280x1024 --pos 256x0 --rotate normal --output DP-2 --off --output DP-1 --mode 1920x1080 --pos 0x1024 --rotate normal --output DP-0 --off && ~/.fehbg && i3 restart > /dev/null
