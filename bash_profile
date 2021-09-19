# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH

# Limit of history file size
export HISTFILESIZE=1000

# Don't duplicate commands in history
export HISTCONTROL=erasedups
