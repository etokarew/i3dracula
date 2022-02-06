#!/bin/sh

case $1 in
    autolaunch)
        #xrandr --output HDMI-A-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal &
        xrandr --output DVI-D-0 --rotate right > /dev/null &
        xset +dpms dpms 0 0 300 > /dev/null &
        xset s off > /dev/null &
        picom -b > /dev/null &
        feh --bg-fill /usr/src/$USER/dracula/wallpaper/solus.png > /dev/null &
        setxkbmap -layout "us,ru" -option "grp:alt_space_toggle" -model "logitech" > /dev/null &
        #ibus-daemon -d --replace --desktop=i3 > /dev/null &
        dunst > /dev/null &
        /usr/lib64/polkit-gnome/polkit-gnome-authentication-agent-1 > /dev/null &
        gnome-keyring-daemon --daemonize > /dev/null &
        #gnome-session-i3 --failsafe > /dev/null &
        nm-applet > /dev/null &
        redshift-gtk -c $HOME/.config/redshift.conf > /dev/null &
        #clipit > /dev/null &
        #copyq > /dev/null &
        transmission-gtk --minimized > /dev/null &
        #dropbox start > /dev/null &
        solus-update-checker > /dev/null &
        ;;
    calculator)
        gnome-calculator > /dev/null
        ;;
    calendar)
        gnome-calendar > /dev/null
        ;;
    clipboard-manager)
        copyq toggle > /dev/null
        ;;
    downloads)
        nautilus --new-window Downloads > /dev/null
        ;;
    dropbox-folder)
        nautilus --new-window $HOME/Dropbox > /dev/null
        ;;
    firefox)
        firefox --new-tab about:newtab > /dev/null
        ;;
    firefox-private)
        firefox --private-window > /dev/null
        ;;
    i3logout)
        i3-nagbar -t warning -m "Вы действительно хотите выйти из текущей сессии?" -b "Завершить работу i3" "i3-msg exit" > /dev/null
        ;;
    magnifier)
        kmag > /dev/null
        ;;
    opera)
        opera --new-window --password-store=basic --enable-features=OverlayScrollbar --disable-features=OverlayScrollbarFlashAfterAnyScrollUpdate,OverlayScrollbarFlashWhenMouseEnter %U > /dev/null
        ;;
    opera-private)
        opera --private --password-store=basic --enable-features=OverlayScrollbar --disable-features=OverlayScrollbarFlashAfterAnyScrollUpdate,OverlayScrollbarFlashWhenMouseEnter %U > /dev/null
        ;;
    recent)
        nautilus --new-window recent\: > /dev/null
        ;;
    redshift)
        #pkill -USR1 redshift
        redshift-gtk -x > /dev/null
        ;;
    rofi)
        rofi -combi-modi window,drun -show combi -modi combi > /dev/null
        ;;
    screenshot)
        gnome-screenshot --interactive > /dev/null
        ;;
    settings)
        gnome-control-center info-overview > /dev/null
        ;;
    system-monitor)
        gnome-system-monitor -p > /dev/null
        ;;
    steam)
        steam steam://open/news > /dev/null
        ;;
    telegram)
        telegram-desktop -- %u > /dev/null
        ;;
    terminal)
        gnome-terminal > /dev/null
        ;;
    trash)
        nautilus --new-window trash\: > /dev/null
        ;;
    updater)
        solus-sc --update-view > /dev/null
        ;;
    virtual-keyboard)
        echo vkbd
        ;;
    *)
        echo -ne "Usage: $0 action --optional-args\n"
        ;;
esac
