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
export BROWSER='surf'
export HISTFILE=$HOME/.bash_history
export QT_QPA_PLATFORMTHEME=qt5ct
export RANGER_LOAD_DEFAULT_RC=FALSE
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
source ~/.gitprompt

PS1='$(__git_ps1 "(git)-{\e[32m%s\e[0m}-")> '

o(){
clear &&
f=3 b=4
for j in f b; do
	for i in {0..7}; do
		printf -v $j$i %b "\e[${!j}${i}m"
	done
done
bld=$'\e[1m'
rst=$'\e[0m'
cat << EOF

 $f1  ▀▄   ▄▀     $f2 ▄▄▄████▄▄▄    $f3  ▄██▄     $f4  ▀▄   ▄▀     $f5 ▄▄▄████▄▄▄    $f6  ▄██▄  $rst
 $f1 ▄█▀███▀█▄    $f2███▀▀██▀▀███   $f3▄█▀██▀█▄   $f4 ▄█▀███▀█▄    $f5███▀▀██▀▀███   $f6▄█▀██▀█▄$rst
 $f1█▀███████▀█   $f2▀▀███▀▀███▀▀   $f3▀█▀██▀█▀   $f4█▀███████▀█   $f5▀▀███▀▀███▀▀   $f6▀█▀██▀█▀$rst
 $f1▀ ▀▄▄ ▄▄▀ ▀   $f2 ▀█▄ ▀▀ ▄█▀    $f3▀▄    ▄▀   $f4▀ ▀▄▄ ▄▄▀ ▀   $f5 ▀█▄ ▀▀ ▄█▀    $f6▀▄    ▄▀$rst

 $bld$f1▄ ▀▄   ▄▀ ▄   $f2 ▄▄▄████▄▄▄    $f3  ▄██▄     $f4▄ ▀▄   ▄▀ ▄   $f5 ▄▄▄████▄▄▄    $f6  ▄██▄  $rst
 $bld$f1█▄█▀███▀█▄█   $f2███▀▀██▀▀███   $f3▄█▀██▀█▄   $f4█▄█▀███▀█▄█   $f5███▀▀██▀▀███   $f6▄█▀██▀█▄$rst
 $bld$f1▀█████████▀   $f2▀▀▀██▀▀██▀▀▀   $f3▀▀█▀▀█▀▀   $f4▀█████████▀   $f5▀▀▀██▀▀██▀▀▀   $f6▀▀█▀▀█▀▀$rst
 $bld$f1 ▄▀     ▀▄    $f2▄▄▀▀ ▀▀ ▀▀▄▄   $f3▄▀▄▀▀▄▀▄   $f4 ▄▀     ▀▄    $f5▄▄▀▀ ▀▀ ▀▀▄▄   $f6▄▀▄▀▀▄▀▄$rst


                                     $f7▌$rst

                                   $f7▌$rst

                              $f7    ▄█▄    $rst
                              $f7▄█████████▄$rst
                              $f7▀▀▀▀▀▀▀▀▀▀▀$rst

EOF
	}

oo(){
	neofetch --w3m \
		$HOME/.local/share/icons/Alienware-Logo.png \
		--size 30% --crop_mode normal --crop_offset center
}

test-colors(){
	x=`tput op`
	y=`printf %76s`
	for i in {0..256};
	do
		o=00$i
		echo -e ${o:${#o}-3:3} `tput setaf $i;tput setab $i`${y// /=}$x
	done
}

alias ls='ls --color=auto'
alias lsa='ls -a'
alias q='exit || quit'
alias x='cmatrix -afbu 4 -C yellow'
#alias pass='PASSWORD_STORE_ENABLE_EXTENSIONS=true pass'
alias asciiwars='/usr/bin/telnet towel.blinkenlights.nl'
alias mapsci='/usr/bin/telnet mapscii.me'
alias rtrash='rm -r $HOME/.local/share/Trash/files/*'
alias ltrash='ls -lah --color=auto $HOME/.local/share/Trash/files/*'
alias archwiki='w3m -no-cookies -graph https://wiki.archlinux.org/'
alias gnu1='w3m http://download-mirror.savannah.gnu.org/releases'
alias gnu0='w3m https://ftp.gnu.org/gnu/'
alias gpgqv='gpg --no-default-key --keyring paqman-keyring.kbx --verify'
alias gpgqg='gpg --no-default-key --keyring paqman-keyring.kbx --recv-keys'
alias make50='/usr/bin/make CC=clang CFLAGS="-ggdb3 -O0 -std=c99 -Wall -Werror" LDLIBS="-lcs50 -lm"'

(cat ~/.cache/wal/sequences &)
if [ -f $HOME/.bash_logins ];
then
        echo ">> @ `date` - `tty`" >> $HOME/.bash_logins
else
        touch $HOME/.bash_logins &&
                chmod 600 $HOME/.bash_logins
        echo ">> @ `date` - `tty`" >> $HOME/.bash_logins
fi

