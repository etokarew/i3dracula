#!/bin/bash

ICON_PATH=/home/$USER/.local/share/icons/Papirus-Dracula/symbolic/status/

NOTIFYID=506
STEP=2; CHUNKS=50


# legacy from PulseAudio
function get_active {
    sink=$(pacmd list-sinks | awk '/\* index:/' | cut -d ':' -f 2 | sed 's/ //g')
    if [[ -z $sink || $sink -lt 0 ]]; then sink=0; fi
    echo $sink
}

function get_volume {
    pactl get-sink-volume @DEFAULT_SINK@ | awk '/Volume:/ { print $5 }' | cut -d '%' -f 1
}

function get_volume_icon {
    if [[ $1 -lt 34 ]]; then
        echo "audio-volume-low-symbolic.svg"
    elif [[ $1 -lt 67 ]]; then
        echo "audio-volume-medium-symbolic.svg"
    elif [[ $1 -le 100 ]]; then
        echo "audio-volume-high-symbolic.svg"
    else
        echo "audio-volume-overamplified-symbolic.svg"
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

    echo $bar
    #return bar
}

function volume_notification {
    volume=`get_volume`
    vol_icon=`get_volume_icon $volume`
    bar=`generate_bar $volume 0`
    #dunstify -r $NOTIFYID -u low -i $ICON_PATH$vol_icon "$bar $volume%"
    notify-send -c volume -h string:synchronous:volume -h int:value:$volume \
        -i $ICON_PATH$vol_icon 'summary' 'body'
}

function get_muted {
    pactl get-sink-mute @DEFAULT_SINK@ | awk '/Mute:/ { print $2 }'
}

function mute_notification {
    muted=`get_muted`
    volume=`get_volume`
    if [[ "$muted" == 'да' ]]
    then
        #dunstify -r $NOTIFYID -u low -i ${ICON_PATH}audio-volume-muted-symbolic.svg `generate_bar $volume 1`
        notify-send -c volume -h string:synchronous:volume -h int:value:0 \
            -i ${ICON_PATH}audio-volume-muted-symbolic.svg 'Foo' 'bar'
    else
        bar=`generate_bar $volume 0`
        #dunstify -r $NOTIFYID -u low -i ${ICON_PATH}`get_volume_icon $volume` "$bar $volume%"
        notify-send -c volume -h string:synchronous:volume -h int:value:$volume \
            -i ${ICON_PATH}`get_volume_icon $volume` 'spam' 'eggs'
    fi
}

function get_volume_char {
    res=?
    muted=`get_muted`
    if [[ "$muted" == 'да' ]]; then res=
    else
       volume=`get_volume`
        if [[ $volume -lt 34 ]]
        then
            res=
        elif [[ $volume -lt 67 ]]
        then
            res=
        else
            res=
        fi
        res=$(echo $res $volume%); fi
    echo -e $res
}

case $1 in
    up)
        pactl set-sink-volume @DEFAULT_SINK@ +$STEP%
        volume_notification
        ;;
    down)
        pactl set-sink-volume @DEFAULT_SINK@ -$STEP%
        volume_notification
        ;;
    mute)
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        mute_notification
        ;;
    get)
        get_volume_char
        ;;
    *)
        echo "Usage: $0 up | down | mute | get"
        ;;
esac
