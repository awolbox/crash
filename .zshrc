# ~/.zshrc - awolbox@crash

[[ $- != *i* ]] && return
if [ "$TERM" = "linux" ]; then
	_SEDCMD='s/.*\*color\([0-9]\{1,\}\).*#\([0-9a-fA-F]\{6\}\).*/\1 \2/p'
	for i in $(sed -n "$_SEDCMD" $HOME/.Xresources | awk '$1 < 16 {printf "\\e]P%X%s", $1, $2}');
	do
		echo -en "$i"
	done
	clear
fi

export PATH=$HOME/.bin:$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/bin
export USER=$USER
export HOME=$HOME
export TERM='rxvt-unicode-256color'
export EDITOR='vim'
export BROWSER='waterfox'
export HISTFILE=$HOME/.zsh_history
export PAGER='less -R'
export QT_QPA_PLATFORMTHEME=qt5ct
export RANGER_LOAD_DEFAULT_RC=FALSE
export PASSWORD_STORE_ENABLE_EXTENSIONS=true

source ~/.zsh_functions
source ~/.zsh_aliases

set -o vi
(cat ~/.cache/wal/sequences &)

