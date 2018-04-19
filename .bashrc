#
# ~/.bashrc - awolbox@crash
#

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
export HISTFILE=$HOME/.bash_history
export PAGER='less -R'
export QT_QPA_PLATFORMTHEME=qt5ct
export RANGER_LOAD_DEFAULT_RC=FALSE

source ~/.bash_functions
source ~/.bash_aliases
source ~/.gitprompt

PS1='$(__git_ps1 "\e[32m(\e[0m\W\e[32m)\e[0m[\e[32m%s\e[0m]")\$ '

set -o vi
(cat ~/.cache/wal/sequences &)
if [ -f $HOME/.bash_logins ];
then
        echo ">> @ `date` - `tty`" >> $HOME/.bash_logins
else
        touch $HOME/.bash_logins &&
                chmod 600 $HOME/.bash_logins
        echo ">> @ `date` - `tty`" >> $HOME/.bash_logins
fi

