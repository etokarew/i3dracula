#!/bin/sh

case $1 in
    autolaunch)
        #nohup xrandr --output HDMI-A-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal &
        nohup xrandr --output DVI-D-0 --rotate right &> /dev/null &
        nohup xset +dpms dpms 0 0 300 &> /dev/null &
        nohup xset s off &> /dev/null &
        nohup picom -b &> /dev/null &
        # xrandr --listmonitors &
        nohup feh --image-bg "#282a36" --bg-center \
            /usr/src/$USER/dracula-pro/wallpapers/dracula-pro/desktop-1920x1080.png \
            /usr/src/$USER/dracula-pro/wallpapers/dracula-pro/phone-1080x1920.png \
            &> /dev/null &
        nohup setxkbmap -layout "us,ru" -option "grp:alt_space_toggle,grp:caps_toggle" -model "logitech" &> /dev/null &
        nohup snixembed --proxy &> /dev/null &
        nohup dunst &> /dev/null &

        #nohup ibus-daemon -d --replace --desktop=i3 &> /dev/null &
        nohup /usr/lib64/polkit-gnome/polkit-gnome-authentication-agent-1 &> /dev/null &
        nohup gnome-keyring-daemon --daemonize &> /dev/null &
        #nohup gnome-session-i3 --failsafe &> /dev/null &
        #nohup gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true &> /dev/null &
        nohup nm-applet &> /dev/null &

        #nohup transmission-gtk --minimized &> /dev/null &
        nohup redshift-gtk -c $HOME/.config/redshift.conf &> /dev/null &
        nohup clipit &> /dev/null &
        nohup dropbox start -i &> /dev/null &
        nohup solus-update-checker &> /dev/null &
        nohup x0vncserver -RawKeyboard -Geometry 1920x1080 \
            -PasswordFile /home/larry/.vnc/passwd -DisconnectClients=0 -NeverShared &> /dev/null &
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
        nohup i3-nagbar -t warning -m "Вы действительно хотите выйти из текущей сессии?" -b "Завершить работу i3" "i3-msg exit" &> /dev/null &
        ;;

    magnifier)
        GTK_THEME=Yaru-purple-dark XCURSOR_THEME=breeze_cursors nohup magnus --refresh-interval=100 --force-refresh &> /dev/null &
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
