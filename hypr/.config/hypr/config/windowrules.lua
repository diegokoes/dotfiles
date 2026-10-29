-- Floating / Transient & Utility Windows
hl.window_rule({ match = { class = "^(xdg-desktop-portal-gtk|xdg-desktop-portal-kde|xdg-desktop-portal-hyprland)(.*)$" }, float = true })
hl.window_rule({ match = { class = "^(polkit-gnome-authentication-agent-1|hyprpolkitagent|org.kde.polkit-kde-authentication-agent-1)(.*)$" }, float = true })
hl.window_rule({ match = { class = "^(CachyOSHello)$" }, float = true })
hl.window_rule({ match = { class = "^(zenity)$" }, float = true })
hl.window_rule({ match = { class = "^(org.pulseaudio.pavucontrol)$" }, float = true, center = true, size = {1400, 700} })
hl.window_rule({ match = { class = "^(org.gnome.Calculator)$" }, float = true })
hl.window_rule({ match = { class = "^(com.mitchellh.ghostty)$" }, center = true })

-- Zed
hl.window_rule({ match = { class = "^(dev.zed.Zed)$" }, tile = true, suppress_event = "maximize" })

-- Steam - Dedicated Workspace 8
hl.window_rule({ match = { class = "^(steam)$" }, workspace = "8 silent", fullscreen = true, render_unfocused = true })
hl.window_rule({ match = { class = "^(Slay the Spire)$" }, fullscreen = true })
hl.window_rule({ match = { title = "^(Steam Settings)$" }, float = true, center = true })
hl.window_rule({ match = { class = "^$", title = "^(Steam - Self Updater)$" }, float = true, center = true })

-- Steam games - Dedicated Workspace 7
-- On launch: move the game here, switch to it, and close the Steam main window
-- to the tray (the overlay stays responsive and Steam stops redrawing it)
local function is_steam_game(w)
    if w.class == "steam" then return false end
    if w.class:match("^steam_app_") then return true end
    local f = io.open("/proc/" .. w.pid .. "/environ", "rb")
    if not f then return false end
    local env = f:read("a")
    f:close()
    return env:find("SteamGameId=", 1, true) ~= nil or env:find("SteamOverlayGameId=", 1, true) ~= nil
end

hl.on("window.open", function(w)
    if is_steam_game(w) then
        hl.dispatch(hl.dsp.window.move({ workspace = 7, window = "address:" .. w.address }))
        hl.dispatch(hl.dsp.focus({ workspace = 7 }))
        for _, s in ipairs(hl.get_windows()) do
            if s.class == "steam" and s.title == "Steam" then
                hl.dispatch(hl.dsp.window.close({ window = "address:" .. s.address }))
            end
        end
    end
end)

-- File dialogs
hl.window_rule({ match = { class = "^$", title = "^(Save File)$" }, float = true })
hl.window_rule({ match = { class = "^$", title = "^(Open File)$" }, float = true })
hl.window_rule({ match = { initial_title = "^(DevTools)$" }, float = true })

-- qBittorrent
hl.window_rule({ match = { class = "^(org.qbittorrent.qBittorrent)$" }, float = true, size = {1200, 600}, center = true })

-- Discord (vesktop) - special workspace, monitor-agnostic
hl.window_rule({ match = { class = "^(vesktop)$" }, workspace = "special:discord silent", fullscreen = true, opacity = 1 })

-- Fooyin music - Workspace 9 fullscreen
hl.window_rule({ match = { class = "^(org.fooyin.fooyin|fooyin)$" }, workspace = "9 silent", fullscreen = true })

-- Picture-in-Picture (PiP), Firefox and Chromium titles
hl.window_rule({
    match = { title = "^(Picture-in-Picture|Picture in picture)$" },
    float = true, pin = true, no_initial_focus = true, focus_on_activate = false,
    size = {378, 213}, move = {1522, 847}, monitor = "eDP-1",
    fullscreen_state = "0 0", suppress_event = "fullscreen",
})

-- Browser / App-specific tweaks
hl.window_rule({ match = { class = "^(firefox-developer-edition)$", title = "negative:^(Picture-in-Picture)$" }, tile = true, fullscreen_state = "2 1" })
hl.window_rule({ match = { class = "^(Tor Browser)$" }, tile = true, suppress_event = "maximize fullscreen" })
hl.window_rule({ match = { class = "^(helium)$" }, tile = true, suppress_event = "maximize fullscreen" })

-- wofi (launcher)
hl.window_rule({ match = { class = "^(wofi)$" }, float = true, rounding = 16, center = true, dim_around = true, no_max_size = true })

-- Layer rules
hl.layer_rule({ match = { namespace = "awww-daemon" }, animation = "fade 50%" })
hl.layer_rule({ match = { namespace = "launcher" },    no_anim = true, dim_around = true })
