#!/usr/bin/env bash
# Toggle waybar: if running, kill it; otherwise launch detached
set -euo pipefail

WAYBAR_BIN=$(command -v waybar || true)
if [ -z "$WAYBAR_BIN" ]; then
  echo "waybar not found" >&2
  exit 1
fi

if pgrep -x waybar >/dev/null; then
  pkill -x waybar
  exit 0
fi

# Launch waybar detached so Hyprland doesn't wait on it
( setsid "$WAYBAR_BIN" >/dev/null 2>&1 & ) & disown

exit 0
