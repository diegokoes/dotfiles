#!/usr/bin/env bash
# Usage: screenshot.sh region|full — saves to ~/Pictures/screenshots and copies to clipboard

set -euo pipefail

dir="$HOME/Pictures/screenshots"
mkdir -p "$dir"
file="$dir/$(date +%Y-%m-%d_%H-%M-%S).png"

case "${1:-full}" in
    region)
        # Cancelling slurp exits non-zero; bail before anything is written
        region=$(slurp -d) || exit 0
        grim -g "$region" "$file"
        ;;
    full)
        grim "$file"
        ;;
    *)
        echo "usage: $0 region|full" >&2
        exit 1
        ;;
esac

wl-copy < "$file"
