#!/usr/bin/env bash
# Usage: volume.sh up|down|mute — changes the default sink and shows the level in wob

set -euo pipefail

sink=@DEFAULT_AUDIO_SINK@
wob="$XDG_RUNTIME_DIR/wob.sock"

case "$1" in
    up)   wpctl set-volume -l 1 "$sink" 5%+ ;;
    down) wpctl set-volume "$sink" 5%- ;;
    mute) wpctl set-mute "$sink" toggle ;;
    *)    echo "usage: $0 up|down|mute" >&2; exit 1 ;;
esac

# "Volume: 0.45" or "Volume: 0.45 [MUTED]"
level=$(wpctl get-volume "$sink" | awk '/MUTED/ { print 0; exit } { printf "%d\n", $2 * 100 + 0.5 }')

[[ -p "$wob" ]] && echo "$level" > "$wob"
