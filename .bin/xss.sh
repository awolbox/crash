#!/bin/sh

xset s off &
xset -dpms &
xss-lock -- xlock +description +timeelapse -mode fiberlamp -fg green -ncolors 200 -info " " && sleep 1 &
