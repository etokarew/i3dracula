# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Source global definitions (if any)
if [ -f /etc/bashrc ]; then
      . /etc/bashrc   # --> Read /etc/bashrc, if present.
fi

export LANG="ru_RU.UTF-8"
export LC_COLLATE="C"

# Starship prompt
eval "$(starship init bash)"

complete -cf sudo
alias lsdl="lsd --icon auto --icon-theme unicode -l"
