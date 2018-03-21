#!/bin/bash

dori(){
	sudo mv ./qutebrowser.yml \
		/usr/lib/python3.6/site-packages/pywal/templates
};nori(){
	wal -i .local/share/wallpapers/lotr-baraddur.png \-a "90"
	alienfx -t Orange
};ori(){
	ln -s ~/.cache/wal/qutebrowser.yml ~/.config/qutebrowser/colors.yml
	chmod 700 ./qutebrowser_reload.py
	mv ./qutebrowser_reload.py ~/.Cr@\$\#/.scripts
	ln -s ~/.Cr@\$\#/.scripts/qutebrowser_reload.py ~/.scripts
}oin(){
	wal -i .local/share/wallpapers/lotr-baraddur.png -a "90" \
		-o ~/.scripts/qutebrowser_reload.py
	alienfx -Orange
};gloin(){
	dori
	nori
	ori
	oin
};gloin
