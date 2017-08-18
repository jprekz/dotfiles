# .bashrc

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Source global definitions (RHEL)
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# bash options
HISTCONTROL=erasedups
HISTIGNORE=cd:ls

# User specific aliases and functions
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ls='ls -F --color=auto'
alias la='ls -AF --color=auto'
alias ll='ls -lF --color=auto'
alias lla='ls -AlF --color=auto'
alias cp='cp -i'
alias mv='mv -i'
alias du='du -h'

_sysname=`uname -s | sed -e "s/\([a-zA-Z]\+\).*/\1/"`
if [ "$_sysname" = "Linux" ]; then
    PS1='\[\e]0;\u@\h \w\a\]\n\[\033[01;32m\]\u@\h \[\033[33m\]\w\[\033[00m\]\n\$ '
elif [ "$_sysname" = "MINGW" ] || [ "$_sysname" = "MSYS" ]; then
	# LANG=ja_JP.sjis
	# JLESSCHARSET="japanese-sjis"
	# OUTPUT_CHARSET=sjis
    :
fi
unset _sysname

