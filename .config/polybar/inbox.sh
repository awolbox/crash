#!/usr/bin/env sh

notification=('y')
notification_sound=(~/.local/share/notification/Navi_-_Hey_Listen.mp3)

key(){
	gpg -dq $HOME/.inbox.gpg
};server(){
	key | grep "0" | cut -d "0" -f 2 -s
};user(){
	key | grep "1" | cut -d "1" -f 2 -s
};pass(){
	key | grep "!" | cut -d "!" -f 2 -s
};inbox(){
	curl -sf -u `echo $(user)`:`echo $(pass)` 	\
		-X "STATUS INBOX (UNSEEN)" 				\
		imaps://`echo $(server)`/INBOX | 		\
		tr -d -c "[:digit:]"
}

if [ $notification == "y" ] || [ $notification == "Y" ];
then
	if [ `inbox` ] && [ `inbox` -gt 0 ];
	then
		 if [ -f /tmp/notification.inbox ];
	 	then	 
	   		echo `inbox`
	 	else
	    	mpv $notification_sound
			touch /tmp/notification.inbox
			echo `inbox`
		fi
	elif [ -f /tmp/notifications.inbox ];
	then
		rm /tmp/notification.inbox
		echo ""
	else
		echo ""
	fi
else
	if [ `inbox` ] && [ `inbox` -gt 0 ];
	then
	   	echo `inbox`
	else
		echo ""
	fi
fi

