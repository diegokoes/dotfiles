return {
    filemanager   = "yazi",
    applauncher   = "sh -c 'pgrep -x wofi >/dev/null && pkill -x wofi || (wofi --normal-window --show drun --insensitive >/dev/null 2>&1 &)'",
    terminal      = "ghostty",
    idlehandler   = "hypridle",
    lockdaemon    = "hyprlock",
    wifimanager   = "impala",
    browser       = "firefox-developer-edition",
    bluetoothtui  = "bluetui",
    volumecontrol = "pavucontrol",
}
