#!/usr/bin/env bash

if command -v blueman-manager >/dev/null 2>&1; then
  exec blueman-manager
fi

if command -v bluetoothctl >/dev/null 2>&1; then
  exec kitty -e bluetoothctl
fi

notify-send 'Bluetooth manager unavailable' 'Install blueman to configure Bluetooth from Waybar.'