#!/bin/sh

switcher='gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled'
cur=$(gsettings get org.gnome.settings-daemon.plugins.color night-light-enabled)

if [[ "$cur" == 'false' ]]; then
    `$switcher true`
else
    `$switcher false`
fi
