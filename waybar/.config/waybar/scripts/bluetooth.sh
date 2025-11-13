#!/usr/bin/env bash
# Waybar custom module for Bluetooth toggle
# - No args: print JSON status for Waybar
# - toggle:  toggle bluetooth power

set -euo pipefail

cmd_exists() {
  command -v "$1" >/dev/null 2>&1
}

ICON_OFF=${BT_ICON_OFF:-"B"}
ICON_ON=${BT_ICON_ON:-"B"}
ICON_CONNECTED=${BT_ICON_CONNECTED:-"B"}

get_status() {
  if ! cmd_exists bluetoothctl; then
    echo "unknown"
    return 1
  fi

  local powered
  powered=$(bluetoothctl show | grep "Powered:" | awk '{print $2}')

  if [ "$powered" = "yes" ]; then
    # Check if any device is connected
    if bluetoothctl devices Connected | grep -q "Device"; then
      echo "connected"
    else
      echo "on"
    fi
  else
    echo "off"
  fi
}

print_json() {
  local status
  status=$(get_status || true)
  local text icon css tooltip
  case "$status" in
    connected)
      icon="$ICON_CONNECTED"
      css="connected"
      tooltip="Bluetooth: Connected"
      ;;
    on)
      icon="$ICON_ON"
      css="on"
      tooltip="Bluetooth: On"
      ;;
    off)
      icon="$ICON_OFF"
      css="off"
      tooltip="Bluetooth: Off"
      ;;
    *)
      icon="?"
      css="off"
      tooltip="Bluetooth: unknown"
      ;;
  esac
  printf '{"text":"%s","class":["%s"],"tooltip":"%s"}\n' "$icon" "$css" "$tooltip"
}

toggle() {
  if ! cmd_exists bluetoothctl; then
    exit 1
  fi
  local status
  status=$(get_status || echo off)
  if [ "$status" = "on" ] || [ "$status" = "connected" ]; then
    bluetoothctl power off || true
  else
    bluetoothctl power on || true
  fi
  # Ask Waybar to refresh this module immediately
  if cmd_exists pkill; then
    pkill -SIGRTMIN+8 waybar 2>/dev/null || true
  fi
}

case "${1:-}" in
  toggle)
    toggle
    sleep 0.05
    ;;
  *)
    ;;
esac

print_json
