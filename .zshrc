#
# ~/.zshrc
#

if [ "$TERM" = "linux" ]; then
    _SEDCMD='s/.*\*color\([0-9]\{1,\}\).*#\([0-9a-fA-F]\{6\}\).*/\1 \2/p'
    for i in $(sed -n "$_SEDCMD" $HOME/.Xresources | awk '$1 < 16 {printf "\\e]P%X%s", $1, $2}'); do
        echo -en "$i"
    done
    clear
fi

HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=10000
bindkey -e
zstyle :compinstall filename '/home/awolbox/.zshrc'
autoload -Uz compinit
compinit
(cat ~/.cache/wal/sequences &)

	# env #

export PATH=~/bin/:$PATH/
export PAGER=less
export EDITOR=vim
export RANGER_LOAD_DEFAULT_RC=FALSE
export BROWSER=waterfox
export COLORFGBG="default;default"
export LESS='-R '
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"

# prompt #

source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status rbenv)
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_DIR_HOME_FOREGROUND='black'
POWERLEVEL9K_DIR_HOME_BACKROUND='blue'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='blue'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='black'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='blue'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='black'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='green'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='214'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='196'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='black'
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='blue'
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='black'
POWERLEVEL9K_VI_INSERT_MODE_STRING="awolbox"
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='blue'
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='black'
POWERLEVEL9K_VI_NORMAL_MODE_STRING="NORMAL"
#POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
#POWERLEVEL9K_DISABLE_RPROMPT=true

	# function #

s() {
	echo "\n $(date +'[%I:%M]') - $(date +'%A, (%d)%B %Y') - {$(/usr/lib/i3blocks/battery BAT0 | cut -d " " -f -1 | sort -r > .bat && tail -n 1 .bat)}\n"
}

st() {
	echo "\nDetermining current network speeds...\n"
	/usr/bin/speedtest-cli --simple --secure > ~/.sc && 
	echo "\n$(/usr/bin/cat ~/.sc | /usr/bin/grep "Download") \n$(/usr/bin/cat ~/.sc | /usr/bin/grep "Upload")"
}

t() {
	echo "\nGPU:[`nvidia-smi -q -d TEMPERATURE | grep 'GPU Current Temp' | cut -d ":" -f 2`]\
	 CPU:[`sensors coretemp-isa-0000 | grep "Package id 0" | cut -d "+" -f 2 | cut -d " " -f 1`]\n"
}

gt() {
	nvidia-smi -q -d TEMPERATURE
}

	# alias #

#alias ls='ls --color=auto'
alias x='/usr/bin/cmatrix -abu 3 -C blue'
alias xx='/usr/bin/cmatrix -abu 3 -C blue && vlock'                                
alias t0='/usr/bin/tmux -2 attach-session -t ">_"'
alias zhr='rm ~/.zsh_history'
alias q='exit || quit'
alias nn='/usr/bin/vim ~/.nn'
alias slog="/usr/bin/sudo /usr/bin/journalctl -f"
alias asciiwars='/usr/bin/telnet towel.blinkenlights.nl'
alias make50='/usr/bin/make CC=clang CFLAGS="-ggdb3 -O0 -std=c99 -Wall -Werror" LDLIBS="-lcs50 -lm"'
alias a3='clear && /usr/bin/archey3 --config=~/.archey3.cfg -c blue'
alias vi='/usr/bin/vim'
alias vim='/usr/bin/vim'
alias ranger='/usr/bin/ranger'
alias tmux='/usr/bin/tmux'
alias sudo='/usr/bin/sudo'
alias w3m='/usr/bin/w3m'
alias p3='/usr/bin/python3'
alias ga='/usr/bin/git add -A'
alias gc='/usr/bin/git commit -a'
alias gp='/usr/bin/git push origin master'
alias mp='/usr/bin/ncmpcpp'
alias pacman='/usr/bin/pacman'
alias mancave='/usr/bin/elinks https://explainshell.com/'
alias map='/usr/bin/telnet mapscii.me'
alias dvd='/usr/bin/mpv dvd://'
alias nf='neofetch --w3m ~/.local/share/icons/Alienware-Logo.png --size 30% --crop_mode normal --crop_offset center'
alias news='newsboat -r'
alias packer='/usr/bin/packer'
#alias pass='PASSWORD_STORE_ENABLE_EXTENSIONS=true pass'
alias o='cd && clear && bashc.sh'
alias oo='nf && bashc.sh'
alias trash-e='rm -r ~/.local/share/Trash/files/*'
alias trash-l='ls -lah --color=auto ~/.local/share/Trash/files/*'
alias cb='/home/awolbox/bin/calbac.sh'
alias c='clear && /usr/bin/cal -m && /usr/bin/calcurse -d '
alias archwiki='w3m -no-cookies -graph https://wiki.archlinux.org/'
