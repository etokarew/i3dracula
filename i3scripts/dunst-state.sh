#!/bin/sh

count=$(dunstctl count history)
is_paused=$(dunstctl is-paused)

if [[ "$is_paused" == 'true' ]]; then
    echo -e ""
else
    echo -e " $count"
fi
