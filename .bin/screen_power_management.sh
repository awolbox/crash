#!/bin/sh

xset s off &
xset -dpms &
xscreensaver -no-splash &
xss-lock -- xscreensaver-command -lock
