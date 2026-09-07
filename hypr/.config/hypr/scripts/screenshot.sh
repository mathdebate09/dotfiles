#!/bin/sh

set -eu

mkdir -p "$HOME/Pictures/screenshots"
timestamp=$(date +%Y-%m-%d_%H-%M-%S)
output="$HOME/Pictures/screenshots/SS${timestamp}.png"

if [ "${1:-screen}" = "area" ]; then
  geometry=$(slurp)
  [ -n "$geometry" ] || exit 0
  grim -g "$geometry" "$output"
else
  grim "$output"
fi

wl-copy --type image/png < "$output"
swappy --file "$output" >/dev/null 2>&1 &