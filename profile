# Default system profile
source /usr/share/defaults/etc/profile

# Locale
export LANG="ru_RU.UTF-8"
export LC_COLLATE="C"

# Default editor
export EDITOR="/usr/bin/nano"

# Limit of history file size
export HISTFILESIZE=1000

# Don't duplicate commands in history
export HISTCONTROL=erasedups

# Android Studio
export CHROME_EXECUTABLE=/usr/bin/opera
export JAVA_HOME=/usr/lib/openjdk-8
export PATH=$JAVA_HOME/bin:$PATH

# Tips for sudo
complete -cf sudo

# Starship prompt
eval "$(starship init bash)"

# Some useful apps (may move to /etc/profile.d/users_aliases.sh)
alias bad="bat --theme Dracula"
alias bats="bat --theme Solarized\ \(dark\)"
alias disk_usage="ncdu -r"
alias ll="ls -lh"
alias lsdl="lsd --icon auto --icon-theme unicode -l"
