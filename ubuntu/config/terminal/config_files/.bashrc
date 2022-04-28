# ~/.bashrc: executed by bash(1) for non-login shells.

NORMAL='0m'
BLACK='30m'
RED='31m'
GREEEN='32m'
BROWN='33m'
BLUE='34m'
PURPLE='35m'
CYAN='36m'
LIGHT_GRAY='37m'
LIGHT_RED='91m'
LIGHT_GREEN='92m'
LIGHT_BLUE='94m'
WHITE='97m'


# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE
HISTSIZE=1000
HISTFILESIZE=2000

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# ${debian_chroot:+($debian_chroot)}\
# set uset@host
_USER_="\e[1;$GREEEN╭─\u"
_HOST_="\e[1;$GREEEN\h"
USER_INPUT="\e[1;$GREEEN╰─λ\e[$NORMAL"
AT="\e[0;$WHITE@"
COLON="\e[0;$WHITE:"
DOLAR="\e[0;$WHITE\$"
IN=$(printf "\e[1;$WHITE%s" "in")

# get Current Workspace Directory
_CWD_=$(basename $(pwd))
if [ $_CWD_ == $USER ]; then
	_CWD_='~'
fi
_CWD_=$(printf "\e[0;$LIGHT_BLUE%s" $_CWD_)

# get git brand
GIT_BRAND=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
if [ "$GIT_BRAND" != "" ]; then
   	GIT_BRAND=$(printf "\e[1;$WHITE%b  \e[1;$LIGHT_RED%s" "\u2387" $GIT_BRAND)
fi

PS1=$(printf '\n %s%s%s %s %s %s\n %s ' $_USER_ $AT $_HOST_ $IN $_CWD_ "$GIT_BRAND" $USER_INPUT)

# enable color support of ls and also add handy aliases
# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more aliases
alias ls='ls -alh --color=always'
alias dir='dir --color=always'
alias vdir='vdir --color=always'
alias grep='grep --color=always'
alias fgrep='fgrep --color=always'
alias egrep='egrep --color=always'
alias cls='clear && cppneofetch'

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

cppneofetch

