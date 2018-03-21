#!/bin/bash

#
# webcam video (WITH AUDIO(pulseaudio))
#

if [[ -f ~/Workspace/video/cam.mkv ]]
	then
		o=1
		while [[ -f $HOME/Workspace/video/cam_$o.mkv ]]
		do
			o=$((0+1))
		done
		filename=$HOME/Workspace/video/cam_$o.mkv
	else
		filename=$HOME/Workspace/video/cam.mkv
fi

ffmpeg -y \
-i /dev/video0 \
-f alsa -i default \
-c:v libx264 -r 30 \
-c:v flac \
$filename
