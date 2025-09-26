#!/usr/bin/env bash
set -euo pipefail

# Starts protonmail-bridge if not running, detaches it, and tries to close any
# visible GUI window belonging to it (best-effort) using hyprctl + jq.

PROG=protonmail-bridge

if ! command -v "$PROG" >/dev/null 2>&1; then
  echo "$PROG: not found" >&2
  exit 1
fi

# If already running, nothing to do
if pgrep -x "$PROG" >/dev/null 2>&1; then
  exit 0
fi

# Start in background and disown (don't leave a terminal attached)
( setsid "$PROG" >/dev/null 2>&1 & ) & disown || true

# Give the process a short moment to create any windows
sleep 0.25

# If hyprctl and jq are available, try to find clients created by the bridge
# and close their windows (focus -> close). This is best-effort and will not
# kill the background service.
if command -v hyprctl >/dev/null 2>&1 && command -v jq >/dev/null 2>&1; then
  # Look for appId or title containing 'proton' or 'bridge' (case-insensitive)
  hyprctl clients -j 2>/dev/null | \
    jq -r '.[] | select((.appId//"" | test("proton|bridge"; "i")) or (.title//"" | test("proton|bridge"; "i"))) | .address' \
    | while read -r addr; do
      hyprctl dispatch focuswindow address:$addr >/dev/null 2>&1 || true
      hyprctl dispatch closewindow >/dev/null 2>&1 || true
    done
fi

exit 0
