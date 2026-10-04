# Auto-start Hyprland after a successful login on tty1
if [ -z "$WAYLAND_DISPLAY" ] && [ -z "$DISPLAY" ] && [ "${XDG_VTNR}" = "1" ]; then
  exec start-hyprland
fi
