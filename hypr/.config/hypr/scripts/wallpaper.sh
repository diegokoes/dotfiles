#!/usr/bin/env bash
WALLPAPER_DIR="$HOME/Pictures/wallpapers"
TRANSITIONS=(center outer)

pkill -x fuzzel 2>/dev/null

THUMB_DIR="$HOME/.cache/wallpaper-thumbs"
mkdir -p "$THUMB_DIR"

mapfile -t FILES < <(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.gif" -o -name "*.webp" \) | sort)
LINES_SHOWN=$(( ${#FILES[@]} < 6 ? ${#FILES[@]} : 6 ))

CHOICE=$(printf '%s\n' "${FILES[@]}" | while read -r f; do
    name="$(basename "$f")"
    thumb="$THUMB_DIR/${name%.*}.png"
    [[ ! -f "$thumb" ]] && magick "$f" -thumbnail 128x128^ -gravity Center -extent 128x128 "$thumb"
    printf "%s\000icon\037%s\n" "$name" "$thumb"
done | fuzzel --dmenu -p "Wallpaper  " --line-height=72 --lines="$LINES_SHOWN")

[[ -z "$CHOICE" ]] && exit 0

WALLPAPER="$WALLPAPER_DIR/$CHOICE"
TRANSITION="${TRANSITIONS[RANDOM % ${#TRANSITIONS[@]}]}"

if ! awww query &>/dev/null; then
    awww kill 2>/dev/null
    awww-daemon &
    sleep 0.5
fi

awww img "$WALLPAPER" --transition-type "$TRANSITION" --transition-fps 60 --transition-duration 2