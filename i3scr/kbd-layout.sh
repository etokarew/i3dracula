#!/bin/sh

case "$(xset -q | grep LED | awk '{ print $10 }')" in
  "00000002") lo="En" ;;
  "00001002") lo="Ру" ;;
  *) lo="?" ;;
esac

echo -n " $lo"
