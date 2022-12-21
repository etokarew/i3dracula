#!/bin/sh

revert() {
    xset dpms 0 0 0
}

activate() {
    sleep 30s
    xset dpms force off
}

#trap revert HUP INT TERM

#i3lock -u -c 282a36 -p default --nofork &
/usr/src/$(whoami)/dracula/i3lock-color/lock &

activate
