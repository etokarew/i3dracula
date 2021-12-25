# Default system RC
#source /etc/profile

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Source global definitions (if any)
if [ -f /etc/bashrc ]; then
      . /etc/bashrc   # --> Read /etc/bashrc, if present.
fi

# Locale
export LANG="ru_RU.UTF-8"
export LC_COLLATE="C"

# Default editor
export EDITOR="/usr/bin/nano"

# Starship prompt
eval "$(starship init bash)"

# Tips for sudo
complete -cf sudo

# Some alias
alias lsdl="lsd --icon auto --icon-theme unicode -l"
alias drat="bat --theme Dracula"
alias bats="bat --theme Solarized\ \(dark\)"
