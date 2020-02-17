#!/bin/bash
# Use only if you need to perform changes on the user system such as installing software
locale -a | grep $language >/dev/null 2>&1
[ $? -eq 0 ] && return

if dialog_yesno "Diese '$language' ist auf diesem System nicht installiert, wollen sie sie installieren?" true >/dev/null; then
    dialog_msg "Prüfen sie ob '$langauge.UTF-8' ausgewählt wurde."
    sudo dpkg-reconfigure locales
fi
