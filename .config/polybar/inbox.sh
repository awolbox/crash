#!/bin/bash
key(){
	gpg -dq $HOME/.inbox.gpg
};server(){
	key | grep "0" | cut -d "0" -f 2 -s
};user(){
	key | grep "1" | cut -d "1" -f 2 -s
};pass(){
	key | grep "!" | cut -d "!" -f 2 -s
};inbox(){
	curl -sf -u `echo $(user)`:`echo $(pass)` \
		-X "STATUS INBOX (UNSEEN)" \
		imaps://`echo $(server)`/INBOX | \
		tr -d -c "[:digit:]"
}
if [ `inbox` ] && [ `inbox` -gt 0 ]; then
    echo `inbox`
else
    echo ""
fi
