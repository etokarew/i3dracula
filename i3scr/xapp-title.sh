#!/bin/sh

ACTIVE_WINDOW_ID=$(xdotool getactivewindow)
if [[ -n $(xprop -id $ACTIVE_WINDOW_ID | grep -E "^_NET_WM_STATE.*(_NET_WM_STATE_MAXIMIZED_HORZ, _NET_WM_STATE_MAXIMIZED_VERT).*$") ]]
then
  xdotool getwindowname $ACTIVE_WINDOW_ID
else
  echo ""
fi
