#!/bin/sh

revert() {
    xset dpms 0 0 0
}

turn_off() {
    #sleep 20s
    DISPLAY=:0 xset dpms force off
}

#trap revert HUP INT TERM

if [[ "$1" == "off" ]]
then
    turn_off
else
    #i3lock -u -c 282a36 -p default --nofork &
    /usr/local/src/dracula/i3lock-color/lock &
fi
