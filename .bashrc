# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias ..='cd ..'
alias l='ls -vF --color=auto'
alias la='ls -AvF --color=auto'
alias ll='ls -lvF --color=auto'
alias lla='ls -AlvF --color=auto'
alias cp='cp -i'
alias mv='mv -i'
alias du='du -h'

# Use plain vim.
alias nvim='vim -N -u NONE -i NONE'
