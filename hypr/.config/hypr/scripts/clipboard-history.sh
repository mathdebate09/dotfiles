#!/bin/sh

set -eu
temporary_dir=$(mktemp -d)
entries_file="$temporary_dir/entries"
menu_file="$temporary_dir/menu"
trap 'rm -rf "$temporary_dir"' EXIT

cliphist list | head -n 30 > "$entries_file"
: > "$menu_file"
index=0

while IFS= read -r entry; do
	index=$((index + 1))
	preview="$temporary_dir/$index.png"
	label=$(printf '%s\n' "$entry" | cut -f2-)

	if printf '%s\n' "$entry" | cliphist decode > "$preview" 2>/dev/null \
		&& file --mime-type -b "$preview" | grep -q '^image/'; then
				printf '%02d  Image\0icon\037%s\n' "$index" "$preview" >> "$menu_file"
	else
		rm -f "$preview"
		printf '%02d  %s\n' "$index" "$label" >> "$menu_file"
	fi
done < "$entries_file"

selection=$(wofi --dmenu --allow-images --prompt 'Clipboard history' < "$menu_file")
[ -n "$selection" ] || exit 0

selected_index=$(printf '%s\n' "$selection" | cut -c1-2)
sed -n "${selected_index}p" "$entries_file" | cliphist decode | wl-copy
