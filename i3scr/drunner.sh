#!/bin/sh
# xrandr --listmonitors
# xrandr --output HDMI-A-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal

case $1 in
    autolaunch)
        nohup xrandr --output DVI-D-0 --rotate right &> /dev/null &
        nohup xset +dpms dpms 0 0 300 &> /dev/null &
        nohup xset s off &> /dev/null &

        nohup picom -b &> /dev/null &

        #nohup feh --image-bg "#282a36" --bg-center \
        #    /usr/local/src/dracula-pro/wallpapers/dracula-pro/desktop-1920x1080.png \
        #    /usr/local/src/dracula-pro/wallpapers/dracula-pro/phone-1080x1920.png \
        #&> /dev/null &
        nohup nitrogen --restore &> /dev/null &

        #nohup ibus-daemon -d --replace --desktop=i3 &> /dev/null &
        nohup setxkbmap -layout "us,ru" -option "grp:alt_space_toggle,grp:caps_toggle" -model "logitech" &> /dev/null &
        nohup numlockx on &> /dev/null &

        nohup snixembed --fork &> /dev/null &
        nohup dunst &> /dev/null &

        nohup /usr/lib64/polkit-gnome/polkit-gnome-authentication-agent-1 &> /dev/null &
        nohup gnome-keyring-daemon --daemonize &> /dev/null &
        #nohup gnome-session-i3 --failsafe &> /dev/null &

        #nohup gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true &> /dev/null &
        nohup redshift-gtk -c $HOME/.config/redshift.conf &> /dev/null &

        nohup nm-applet &> /dev/null &
        nohup solus-update-checker &> /dev/null &

        COPYQ_DEFAULT_ICON=1 COPYQ_SESSION_COLOR=white nohup copyq --start-server hide &> /dev/null &
        ;;

    calculator)
        nohup gnome-calculator &> /dev/null &
        ;;

    calendar)
        nohup gnome-calendar &> /dev/null &
        ;;

    clipboard-manager)
        nohup copyq toggle &> /dev/null &
        ;;

    downloads)
        nohup nautilus --new-window Downloads &> /dev/null &
        ;;

    dropbox-folder)
        nohup nautilus --new-window $HOME/Dropbox &> /dev/null &
        ;;

    dmenu)
        /usr/bin/dmenu -nf '#F8F8F2' -nb '#282A36' -sb '#6272A4' -sf '#282A36' -fn 'Droid Sans-13' -p ''
        ;;

    dmenu_run)
        nohup dmenu_run -nf '#F8F8F2' -nb '#282A36' -sb '#6272A4' -sf '#282A36' -fn 'Droid Sans-13' -p '' &> /dev/null &
        ;;

    dunst-clear)
        nohup dunstctl close-all &> /dev/null &
        ;;

    dunst-pause)
        nohup dunstctl set-paused toggle &> /dev/null &
        ;;

    dunst-pop)
        nohup dunstctl history-pop &> /dev/null &
        ;;

    emoji)
        nohup gnome-characters &> /dev/null &
        ;;

    firefox)
        nohup firefox --new-window &> /dev/null &
        ;;

    firefox-new-tab)
        nohup firefox --new-tab about:newtab &> /dev/null &
        ;;

    firefox-private)
        nohup firefox --private-window &> /dev/null &
        ;;

    i3logout)
        nohup i3-nagbar -t warning -m "Вы действительно хотите выйти из текущей сессии?" -b "Завершить работу i3" "i3-msg exit" -f "pango:JetBrains Mono 9" &> /dev/null &
        ;;

    magnifier) # snapcraft.io/magnus
        echo magnifier
        ;;

    recent)
        nohup nautilus --new-window recent\: &> /dev/null &
        ;;

    redshift)
        #pkill -USR1 redshift
        nohup redshift-gtk -x &> /dev/null &
        ;;

    rofi)
        nohup rofi -combi-modi window,drun -show combi -modi combi &> /dev/null &
        ;;

    screenshot)
        nohup gnome-screenshot --interactive &> /dev/null &
        ;;

    screenshot-window)
        nohup gnome-screenshot -wib &> /dev/null &
        ;;

    screenshot-area)
        nohup gnome-screenshot -ai &> /dev/null &
        ;;

    settings)
        nohup gnome-control-center info-overview &> /dev/null &
        ;;

    sound)
        nohup gnome-control-center sound &> /dev/null &
        ;;

    system-monitor)
        nohup gnome-system-monitor -p &> /dev/null &
        ;;

    steam)
        nohup steam steam://open/news &> /dev/null &
        ;;

    telegram)
        nohup telegram-desktop -- %u &> /dev/null &
        ;;

    terminal)
        nohup gnome-terminal &> /dev/null &
        ;;

    thunderbird)
        nohup thunderbird &> /dev/null &
        ;;

    trash)
        nohup nautilus --new-window trash\: &> /dev/null &
        ;;

    updater)
        nohup solus-sc --update-view &> /dev/null &
        ;;

    virtual-keyboard)
        echo vkbd
        ;;

    *)
        echo -ne "Usage: $0 action --optional-args\n" ;;
esac
