# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
	*i*) ;;
	  *) return;;
esac

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.bin:$PATH"

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
	xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
	if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
	else
	color_prompt=
	fi
fi
if [ "$TERM" == linux ]; then
  PS1='\[\033[01;32m\]\u \[\033[01;34m\]\w\[\033[00m\] \$ '
elif [ "$color_prompt" = yes ]; then
    if [ "$ALACRITTY" == yes ]; then
      PS1='\e[1;97;42;24m \u \e[21;32;44;24m\e[1;97;44;24m \h \e[21;34;41;24m\e[1;97;41m \w \001\e[21;31;49;24m\002\n\001\e[97;1m\002↳\001\e[0m\002 '
    else
      PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    fi
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
  fi
fi

ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ext()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


mtlb() {
  matlab -nodesktop -nojvm -nosplash -singleCompThread -batch "run $1 $2"
}

wm() {
  wmctrl -a $1
}

alias ls="exa -a"
alias find=fd
alias du=dust
alias top=btm
alias grep=rg
alias cat=bat
alias tree="tree -C"
alias gcc="gcc -Wall -Wextra"
alias clang="clang -Wall -Wextra"
alias g++="g++ -Wall -Wextra"
alias clang++="clang++ -Wall -Wextra"
alias treei="tree -C | less -Frx4"
alias matlab="matlab -nodesktop -nosplash"
alias pi="ssh skyletoft@192.168.0.107"
alias python="python3"
