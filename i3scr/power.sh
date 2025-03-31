#!/bin/sh

energy=$(
    neofetch --battery_display infobar battery \
        | awk '{ printf "%.0f;%s", $2, $3 }'
)
perc=`echo -n $energy | cut -d ';' -f 1`
state=`echo -n $energy | cut -d ';' -f 2`

  if [[ $perc -ge 75 ]]; then
    icon=
elif [[ $perc -ge 50 ]]; then
    icon=
elif [[ $perc -ge 25 ]]; then
    icon=
elif [[ $perc -ge 10 ]]; then
    icon=
elif [[ $perc -ge 1 ]]; then
    icon=
else
    icon=
fi

  if [[ $state == "[Charging]" ]]; then
    arrow=
elif [[ $state == "[Discharging]" ]]; then
    arrow=
else
    arrow=
fi

# sed to remove leading and trailing spaces
[[ -n $perc ]] && perc="$perc%"
echo -n "$icon $arrow $perc" | sed 's/^ //g' | sed 's/ $//g'
