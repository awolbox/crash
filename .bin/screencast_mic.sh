#!/bin/bash

#
# screencast (WITH AUDIO(pulseaudio))
#

if [[ -f ~/Workspace/video/screen.mkv ]]
	then
		o=1
		while [[ -f $HOME/Workspace/video/screen_$o.mkv ]]
		do
			o=$((0+1))
		done
		filename=$HOME/Workspace/video/screen_$o.mkv
	else
		filename=$HOME/Workspace/video/screen.mkv
fi

ffmpeg -y \
-f x11grab \
-s $(xdpyinfo | grep dimensions | cut -d " " -f 7) \
-i :0.0 \
-f alsa -i default \
-c:v libx264 -r 30 \
-c:a flac \
$filename
