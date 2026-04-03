#!/usr/bin/env bash
WALLPAPER_DIR="$HOME/Pictures/wallpapers"
TRANSITIONS=(wipe grow shrink)

pkill -x rofi 2>/dev/null

THUMB_DIR="$HOME/.cache/wallpaper-thumbs"
mkdir -p "$THUMB_DIR"

CHOICE=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.gif" -o -name "*.webp" \) | while read -r f; do
    name="$(basename "$f")"
    thumb="$THUMB_DIR/${name%.*}.png"
    [[ ! -f "$thumb" ]] && magick "$f" -thumbnail 128x128^ -gravity Center -extent 128x128 "$thumb"
    printf "%s\000icon\037%s\n" "$name" "$thumb"
done | rofi -dmenu -show-icons -p "Wallpaper" -theme ~/.config/rofi/wallpaper.rasi)

[[ -z "$CHOICE" ]] && exit 0

WALLPAPER="$WALLPAPER_DIR/$CHOICE"
TRANSITION="${TRANSITIONS[RANDOM % ${#TRANSITIONS[@]}]}"

ln -sf "$WALLPAPER" "$HOME/.config/hypr/current_wallpaper"

if ! awww query &>/dev/null; then
    awww kill 2>/dev/null
    awww-daemon &
    sleep 0.5
fi

awww img "$WALLPAPER" --transition-type "$TRANSITION"
