#!/bin/sh

# Colors
alpha="dd"
background="#282a36"
selection="#44475a"
comment="#6272a4"
# +
yellow="#f1fa8c"
orange="#ffb86c"
red="#ff5555"
magenta="#ff79c6"
blue="#6272a4"
cyan="#8be9fd"
green="50fa7b"

defFont="JetBrainsMono"

revert() {
    xset dpms 0 0 0
}

activate() {
    #xset +dpms dpms 0 0 15
    sleep 30s
    xset dpms force off
}

#trap revert HUP INT TERM

#activate
#i3lock -c 282a36 -p win --nofork
#revert

i3lock -u -c 282a36 -p default --nofork &
#i3lock-color --nofork --insidever-color=$selection$alpha --insidewrong-color=$selection$alpha --inside-color=$selection$alpha --ringver-color=$green$alpha --ringwrong-color=$red$alpha --ringver-color=$green$alpha --ringwrong-color=$red$alpha --ring-color=$blue$alpha --line-uses-ring --keyhl-color=$magenta$alpha --bshl-color=$orange$alpha --separator-color=$selection$alpha --verif-color=$green --wrong-color=$red --layout-color=$blue --date-color=$blue --time-color=$blue --screen 1 --blur 1 --clock --indicator --time-str="%H:%M:%S" --date-str="%A %e %B %Y" --verif-text="Проверка..." --wrong-text="Неверно!" --noinput="<Нет данных ввода>" --lock-text="Блокировка..." --lockfailed="Блокировка не удалась!" --time-font=$defFont --date-font=$defFont --layout-font=$defFont --verif-font=$defFont --wrong-font=$defFont --radius=120 --ring-width=10 --pass-media-keys --pass-screen-keys --pass-volume-keys &

activate
