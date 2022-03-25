#!/bin/sh

count=$(dunstctl count history)
is_paused=$(dunstctl is-paused)

if [[ "$is_paused" == 'true' ]]; then
    echo -ne ""
else
    echo -ne " $count"
fi
