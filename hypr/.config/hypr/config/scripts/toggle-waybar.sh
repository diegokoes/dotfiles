#!/usr/bin/env bash
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

( setsid "$WAYBAR_BIN" >/dev/null 2>&1 & ) & disown

exit 0
