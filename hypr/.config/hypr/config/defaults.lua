return {
    filemanager   = "yazi",
    -- Starts each app in its own systemd scope via uwsm
    applauncher   = "~/.config/hypr/scripts/launcher.sh",
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
