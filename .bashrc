# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias ..='cd ..'
alias ls='ls -F --color=auto'
alias la='ls -AF --color=auto'
alias ll='ls -lF --color=auto'
alias lla='ls -AlF --color=auto'
alias cp='cp -i'
alias mv='mv -i'
alias du='du -h'

# Use plain vim.
alias nvim='vim -N -u NONE -i NONE'

sysname=`uname -s | sed -e "s/\([a-zA-Z]\+\).*/\1/"`
if [ "$sysname" = "MINGW" ] || [ "$sysname" = "MSYS" ]; then
	alias code='code.cmd'
	# LANG=ja_JP.sjis
	# JLESSCHARSET="japanese-sjis"
	# OUTPUT_CHARSET=sjis
fi