#!/bin/sh

set -eu

selection=$(cliphist list | head -n 30 | wofi --dmenu --prompt 'Clipboard history')
[ -n "$selection" ] || exit 0

printf '%s\n' "$selection" | cliphist decode | wl-copy
