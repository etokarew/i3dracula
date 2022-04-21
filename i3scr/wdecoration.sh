#!/bin/sh

cmd='xprop -f _MOTIF_WM_HINTS 32c -set _MOTIF_WM_HINTS'
case $1 in
    x0)
        `$cmd '0x2, 0x0, 0x0, 0x0, 0x0'`
        ;;
    x1)
        `$cmd '0x2, 0x0, 0x1, 0x0, 0x0'`
        ;;
    *)
        echo "Usage: $0 x0 | x1"
        ;;
esac
