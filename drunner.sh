#!/bin/sh

case $1 in
    autolaunch)
        #xrandr --output HDMI-A-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal &
        xrandr --output DVI-D-0 --rotate right &
        xset +dpms dpms 0 0 300 &
        xset s off &
        picom -b &
        feh --bg-fill /usr/src/$USER/dracula/wallpaper/solus.png &
        setxkbmap -layout "us,ru" -option "grp:alt_space_toggle" -model "logitech" &
        #ibus-daemon -d --replace --desktop=i3 &
        dunst &
        /usr/lib64/polkit-gnome/polkit-gnome-authentication-agent-1 &
        gnome-keyring-daemon --daemonize &
        nm-applet &
        #clipit &
        #copyq &
        transmission-gtk --minimized &
        #dropbox start &
        ;;
    calculator)
        gnome-calculator &
        ;;
    calendar)
        gnome-calendar > /dev/null &
        ;;
    clipboard-manager)
        copyq toggle &
        ;;
    dropbox-folder)
        nautilus --new-window $HOME/Dropbox > /dev/null &
        ;;
    firefox)
        firefox --new-tab about:newtab > /dev/null &
        ;;
    firefox-private)
        firefox --private-window > /dev/null &
        ;;
    i3logout)
        i3-nagbar -t warning -m "Вы действительно хотите выйти из текущей сессии?" -b "Завершить работу i3" "i3-msg exit" > /dev/null &
        ;;
    opera)
        opera --new-window --password-store=basic --enable-features=OverlayScrollbar --disable-features=OverlayScrollbarFlashAfterAnyScrollUpdate,OverlayScrollbarFlashWhenMouseEnter %U > /dev/null &
        ;;
    opera-private)
        opera --private --password-store=basic --enable-features=OverlayScrollbar --disable-features=OverlayScrollbarFlashAfterAnyScrollUpdate,OverlayScrollbarFlashWhenMouseEnter %U > /dev/null &
        ;;
    recent)
        nautilus --new-window recent\: > /dev/null &
        ;;
    rofi)
        rofi -combi-modi window,drun -show combi -modi combi > /dev/null &
        ;;
    screenshot)
        gnome-screenshot --interactive &
        ;;
    settings)
        gnome-control-center info-overview > /dev/null &
        ;;
    system-monitor)
        gnome-system-monitor -p &
        ;;
    steam)
        steam steam://open/news > /dev/null &
        ;;
    telegram)
        telegram-desktop -- %u &
        ;;
    terminal)
        gnome-terminal &
        ;;
    trash)
        nautilus --new-window trash\: > /dev/null &
        ;;
    updater)
        solus-sc --update-view &
        ;;
    *)
        echo -ne "Usage: $0 [ autolaunch | calculator | clipboard-manager | dropbox-folder | firefox | firefox-private | i3logout | opera | opera-private | recent | rofi | screenshot | settings | system-monitor | steam | telegram | terminal | trash | updater ]" &
        ;;
esac
