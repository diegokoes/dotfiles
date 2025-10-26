#!/usr/bin/env bash
# Waybar custom module for Mako Do Not Disturb (DND)
# - No args: print JSON status for Waybar
# - toggle:  toggle DND mode via makoctl modes

set -euo pipefail

cmd_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Allow overriding icons via environment variables
ICON_ON=${DND_ICON_ON:-"󱥸"}
ICON_OFF=${DND_ICON_OFF:-"󱥸"}

get_status() {
  if ! cmd_exists makoctl; then
    echo "unknown"
    return 1
  fi
  # List active modes and check if 'dnd' is active
  local modes
  modes=$(makoctl mode 2>/dev/null || echo "")
  if echo "$modes" | tr ' ' '\n' | grep -qx "dnd"; then
    echo "on"
  else
    echo "off"
  fi
}

print_json() {
  local status
  status=$(get_status || true)
  local text icon css tooltip
  case "$status" in
    on)
      icon="$ICON_ON"
      css="active"
      tooltip="Do Not Disturb: ON (mako hidden)"
      ;;
    off)
      icon="$ICON_OFF"
      css="inactive"
      tooltip="Do Not Disturb: OFF"
      ;;
    *)
      icon="?"
      css="inactive"
      tooltip="Do Not Disturb: unknown (makoctl not found)"
      ;;
  esac
  printf '{"text":"%s","class":["%s"],"tooltip":"%s"}\n' "$icon" "$css" "$tooltip"
}

toggle() {
  if ! cmd_exists makoctl; then
    notify-send "Waybar DND" "makoctl not found in PATH"
    exit 1
  fi
  local status
  status=$(get_status || echo off)
  if [ "$status" = "on" ]; then
    # remove the mode explicitly
    makoctl mode -r dnd || true
  else
    # add the mode
    makoctl mode -a dnd || true
  fi
  # Ask Waybar to refresh this module immediately (signal must match waybar config)
  if cmd_exists pkill; then
    pkill -SIGRTMIN+8 waybar 2>/dev/null || true
  fi
}

case "${1:-}" in
  toggle)
    toggle
    # Give mako a brief moment, then print updated status so Waybar can refresh if exec-on-click is used
    sleep 0.05
    ;;
  *)
    ;;
esac

print_json
