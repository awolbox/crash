#!/usr/bin/env bash

zscroll -l 50 -u true -b "" -d 0.3 -M "mpc status" -m "playing" \
		"-b ''" -m "paused" "-b '' -s false" "mpc current" &
wait
