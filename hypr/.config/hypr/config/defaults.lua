return {
    filemanager   = "yazi",
    applauncher   = "sh -c 'pgrep -x wofi >/dev/null && pkill -x wofi || (wofi --normal-window --show drun --insensitive >/dev/null 2>&1 &)'",
    terminal      = "ghostty",
    idlehandler   = "hypridle",
    -- Goes through hypridle's lock_cmd, which won't start a second hyprlock
    lock          = "loginctl lock-session",
    wifimanager   = "impala",
    browser       = "firefox-developer-edition",
    bluetoothtui  = "bluetui",
    volumecontrol = "pavucontrol",
    -- Flags live in ~/.config/vesktop-flags.conf (read by /usr/bin/vesktop)
    discord       = "vesktop",
}
