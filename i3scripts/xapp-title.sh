#!/bin/sh

MAX_TITLE_LENGTHm3=122  # =125
ACTIVE_WINDOW_ID=$(xdotool getactivewindow)

if [[
  -n $(xprop -id $ACTIVE_WINDOW_ID | grep -E "^_NET_WM_STATE.*(_NET_WM_STATE_MAXIMIZED_HORZ, _NET_WM_STATE_MAXIMIZED_VERT).*$") \
  || "$1" == "--force-title"
]]; then
  WINDOW_TITLE="$(xdotool getwindowname $ACTIVE_WINDOW_ID)"
  if (( ${#WINDOW_TITLE} > $MAX_TITLE_LENGTHm3 )); then
  #if (( $(expr length "$WINDOW_TITLE") > $MAX_TITLE_LENGTHm3 )); then
    #echo "$(echo $WINDOW_TITLE | cut --characters=1-$MAX_TITLE_LENGTHm3)..."
    #echo "$(expr substr ${WINDOW_TITLE} 1 $MAX_TITLE_LENGTHm3)..."
    echo "${WINDOW_TITLE:0:$MAX_TITLE_LENGTHm3}..."
  else
    echo "$WINDOW_TITLE"
  fi
else
  echo "#$ACTIVE_WINDOW_ID"
fi
