#!/bin/sh

xset s off &
xset -dpms &
xscreensaver -no-splash &
#xss-lock -- xscreensaver-command -lock
xss-lock - xlock +description -echokeys -showdate -timeout 4 -fg blue -bg black -info " " -username " " -password "Password: " -validate "Hang on..." -invalid "You Suck." -mode noof -delay 10000 &
