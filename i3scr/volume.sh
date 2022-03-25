#!/bin/bash

# Volume notification: Pulseaudio and dunst
# inspired by gist.github.com/sebastiencs/5d7227f388d93374cebdf72e783fbd6a

#icon_path=/usr/share/icons/Numix/scalable/status/
icon_path=/home/$USER/.icons/dracula/symbolic/status/

notify_id=506
STEP=2; CHUNKS=50

sink_or=1; sink_nr=0
while read -rs sink
do
    if [[ $(echo -n "$sink" | awk '{ print $1 }') == '*' ]]
    then
        sink_nr=$(echo -n "$sink" | awk '{ print $3 }')
        break
    else
        sink_nr=$(echo -n "$sink" | awk '{ print $2 }')
        sink_or=$(( $sink_or + 1 ))
    fi
done < <(pacmd list-sinks | awk '/index: [[:digit:]]/')

# legacy
function get_active {
    sink=$(pacmd list-sinks | awk '/\* index:/' | cut -d ':' -f 2 | sed 's/ //g')
    if [[ -z $sink || $sink -lt 0 ]]; then sink=0; fi
    echo -n $sink
}

function get_volume {
    pacmd list-sinks | awk '/\tvolume:/ { print $5 }' | head -n $sink_or | tail -n1 | cut -d '%' -f 1
}

function get_volume_icon {
    if [[ $1 -lt 34 ]]; then
        echo -n "audio-volume-low-symbolic.svg"
    elif [[ $1 -lt 67 ]]; then
        echo -n "audio-volume-medium-symbolic.svg"
    elif [[ $1 -le 100 ]]; then
        echo -n "audio-volume-high-symbolic.svg"
    else
        echo -n "audio-volume-overamplified-symbolic.svg"
    fi
}

function generate_bar {
    chex="◦"
    if [[ $2 -gt 0 ]]; then ch=$chex; else ch="•"; fi

    let quotient=($1 / $STEP); bar=""
    for i in $(seq $CHUNKS)
    do
        if [[ $i -le $quotient ]]; then bar+=$ch; else bar+=$chex; fi
    done

    echo -n $bar
    #return bar
}

function volume_notification {
    volume=`get_volume`
    vol_icon=`get_volume_icon $volume`
    bar=`generate_bar $volume 0`
    dunstify -r $notify_id -u low -i $icon_path$vol_icon "$bar $volume%"
}

function mute_notification {
    muted=$(pacmd list-sinks | awk '/muted/ { print $2 }' | head -n $sink_or | tail -n1)
    volume=`get_volume`
    if [[ "$muted" == 'yes' ]]
    then
        dunstify -r $notify_id -u low -i ${icon_path}audio-volume-muted-symbolic.svg `generate_bar $volume 1`
    else
        bar=`generate_bar $volume 0`
        dunstify -r $notify_id -u low -i ${icon_path}`get_volume_icon $volume` "$bar $volume%"
    fi
}

case $1 in
    up)
        #pactl set-sink-volume $sink_nr +5%
        amixer -D pulse sset Master $STEP%+
        volume_notification
        ;;
    down)
        #pactl set-sink-volume $sink_nr -5%
        amixer -D pulse sset Master $STEP%-
        volume_notification
        ;;
    mute)
        #pactl set-sink-mute $sink_nr toggle
        amixer -D pulse sset Master toggle-mute
        mute_notification
        ;;
    *)
        echo "Usage: $0 up | down | mute"
        ;;
esac
