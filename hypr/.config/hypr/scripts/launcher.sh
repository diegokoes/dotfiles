#!/usr/bin/env bash
# wofi picks the app, uwsm starts it in its own systemd scope. Apps started
# as Hyprland's children share its session scope, and systemd-oomd kills a
# whole scope at once: one runaway app would take the session with it.

set -euo pipefail

# The same key closes the launcher
if pgrep -x wofi >/dev/null; then
    pkill -x wofi
    exit 0
fi

# Prints the chosen desktop file's path. No action follows it, because the
# wofi config sets no_actions=true.
entry=$(wofi --normal-window --show drun --insensitive \
    -D drun-print_desktop_file=true 2>/dev/null) || exit 0
[[ -n "$entry" ]] || exit 0

# uwsm pops a warning notification for desktop file names outside
# [A-Za-z0-9_.-] (Steam game shortcuts like "Hollow Knight.desktop"),
# so give it a link with a valid name
name=$(basename "$entry" .desktop)
if [[ ! $name =~ ^[A-Za-z0-9_][A-Za-z0-9_.-]*$ ]]; then
    link_dir="$XDG_RUNTIME_DIR/launcher"
    mkdir -p "$link_dir"
    link="$link_dir/${name//[^A-Za-z0-9_.-]/_}.desktop"
    ln -sfn "$entry" "$link"
    entry=$link
fi

exec uwsm app -- "$entry" >/dev/null 2>&1
