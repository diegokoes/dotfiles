local d = require("config.defaults")

-- Hyprland already exports WAYLAND_DISPLAY etc. to systemd/dbus on start
-- wob runs from the shipped wob.socket user unit ($XDG_RUNTIME_DIR/wob.sock)
hl.on("hyprland.start", function()
    -- hl.env vars only reach Hyprland's children; portal-started Qt apps need these too
    hl.exec_cmd("dbus-update-activation-environment --systemd QT_QPA_PLATFORMTHEME QT_QPA_PLATFORM")
    hl.exec_cmd("swaync")
    hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd(d.idlehandler)
    hl.exec_cmd("hyprsunset")
    hl.exec_cmd(d.discord)
    hl.exec_cmd("clipse -listen")
    hl.exec_cmd("brightnessctl set 100%")
    hl.exec_cmd("prime-run steam -silent")
end)
