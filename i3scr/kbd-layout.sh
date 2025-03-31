#!/bin/sh

case "$(xset -q | grep LED | awk '{ print substr($10, 5, 1) }')" in
  "0") lo="En" ;;
  "1") lo="Ру" ;;
  *) lo="?" ;;
esac

echo " $lo"
