#!/bin/sh

revert() {
    xset dpms 0 0 0
}

activate() {
    #xset +dpms dpms 0 0 15
    sleep 30s
    xset dpms force off
}

#trap revert HUP INT TERM

#activate
#i3lock -c 282a36 -p win --nofork
#revert

i3lock -c 282a36 -p default --nofork &
activate
