#!/usr/bin/env bash

choice=$(printf '%s\n' 'Power off' 'Reboot' 'Hibernate' | wofi --dmenu --prompt 'Power') || exit 0

case "$choice" in
  'Power off')
    systemctl poweroff
    ;;
  'Reboot')
    systemctl reboot
    ;;
  'Hibernate')
    systemctl hibernate
    ;;
esac