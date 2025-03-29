#!/usr/bin/env bash

# Configuration
dir="$HOME/.config/rofi"
cnf='power-menu'

# CMDs
uptime="`uptime -p | sed -e 's/up //g'`"
host=`hostname`

# Options
shutdown=''
reboot=''
lock=''
suspend=''
hibernate=''
logout=''
yes=''
no=''

# Rofi CMD
rofi_cmd() {
    rofi -dmenu \
        -p "Uptime: $uptime" \
        -mesg "В работе: $uptime" \
        -theme ${dir}/${cnf}.rasi
}

# Confirmation CMD
confirm_cmd() {
    rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 158px;}' \
        -theme-str 'mainbox {children: [ "message", "listview" ];}' \
        -theme-str 'listview {columns: 2; lines: 1;}' \
        -theme-str 'element-text {horizontal-align: 0.5;}' \
        -theme-str 'textbox {horizontal-align: 0.5;}' \
        -dmenu \
        -p 'Confirmation' \
        -mesg 'ВЫ УВЕРЕНЫ?..' \
        -theme ${dir}/${cnf}.rasi
}

# Ask for confirmation
confirm_exit() {
    echo -e "$yes\n$no" | confirm_cmd
}

# Pass variables to rofi dmenu
run_rofi() {
    echo -e "$lock\n$logout\n$suspend\n$hibernate\n$reboot\n$shutdown" | rofi_cmd
}

# Execute Command
run_cmd() {
    if [[ $1 == '--logout' ]]; then
        if [[ "$DESKTOP_SESSION" == 'openbox' ]]; then
            openbox --exit
        elif [[ "$DESKTOP_SESSION" == 'bspwm' ]]; then
            bspc quit
        elif [[ "$DESKTOP_SESSION" == 'i3' ]]; then
            if [[ -x "$HOME/.i3scr/drunner.sh" ]]; then
                ~/.i3scr/drunner.sh i3logout
            elif [[ -x '/usr/bin/i3lock' ]]; then
                i3-msg exit
            fi
        elif [[ "$DESKTOP_SESSION" == 'plasma' ]]; then
            qdbus org.kde.ksmserver /KSMServer logout 0 0 0
        elif [[ "$DESKTOP_SESSION" == 'mate' ]]; then
            mate-session-save --logout-dialog
        elif [[ "$DESKTOP_SESSION" == 'xfce' ]]; then
            xfce4-session-logout
        fi
        exit 0
    elif [[ $1 == '--lock' ]]; then
        if [[ "$DESKTOP_SESSION" == 'i3' ]]; then
            if [[ -x "$HOME/.i3scr/draculocker.sh" ]]; then
                ~/.i3scr/draculocker.sh
            elif [[ -x '/usr/bin/i3lock' ]]; then
                i3lock
            fi
        elif [[ "$DESKTOP_SESSION" == 'mate' ]]; then
            mate-screensaver-command --lock
        elif [[ "$DESKTOP_SESSION" == 'xfce' ]]; then
            xflock4
        fi
        exit 0
    fi

    selected="$(confirm_exit)"
    if [[ "$selected" == "$yes" ]]; then
        if [[ $1 == '--shutdown' ]]; then
            systemctl poweroff
        elif [[ $1 == '--reboot' ]]; then
            systemctl reboot
        elif [[ $1 == '--suspend' ]]; then
            mpc -q pause
            amixer set Master mute
            systemctl suspend
        elif [[ $1 == '--hibernate' ]]; then
            mpc -q pause
            amixer set Master mute
            systemctl hibernate
        fi
    else
        exit 0
    fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $shutdown)
        run_cmd --shutdown
        ;;
    $reboot)
        run_cmd --reboot
        ;;
    $lock)
        run_cmd --lock
        ;;
    $suspend)
        run_cmd --suspend
        ;;
    $hibernate)
        run_cmd --hibernate
        ;;
    $logout)
        run_cmd --logout
        ;;
esac
