#!/bin/bash

#
# webcam video (NO AUDIO)
#

if [[ -f ~/Workspace/video/cam.mkv ]]
	then
		o=1
		while [[ -f $HOME/Workspace/video/cam_$o.mkv ]]
		do
			o=$((0+1))
		done
		filename=$HOME/Workspace/studio/video/out//cam_$o.mkv
	else
		filename=$HOME/Workspace/studio/video/out/cam.mkv
fi

ffmpeg -y \
-i /dev/video0 \
-c:v libx264 -r 30 \
$filename
