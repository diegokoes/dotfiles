-- Floating / Transient & Utility Windows
hl.window_rule({ match = { class = "^(xdg-desktop-portal-gtk|xdg-desktop-portal-kde|xdg-desktop-portal-hyprland)(.*)$" }, float = true })
hl.window_rule({ match = { class = "^(polkit-gnome-authentication-agent-1|hyprpolkitagent|org.org.kde.polkit-kde-authentication-agent-1)(.*)$" }, float = true })
hl.window_rule({ match = { class = "^(CachyOSHello)$" }, float = true })
hl.window_rule({ match = { class = "^(zenity)$" }, float = true })
hl.window_rule({ match = { class = "^(org.pulseaudio.pavucontrol)$" }, float = true, center = true, size = {1400, 700} })
hl.window_rule({ match = { class = "^(org.gnome.Calculator)$" }, float = true })
hl.window_rule({ match = { class = "^(com.mitchellh.ghostty)$" }, center = true })

-- VSCode tiling
hl.window_rule({ match = { class = "^(Code)$" }, tile = true, suppress_event = "maximize" })

-- Zed
hl.window_rule({ match = { class = "^(dev.zed.Zed)$" }, tile = true, suppress_event = "maximize" })

-- FFXIV - Dedicated Workspace 10
hl.window_rule({ match = { class = "^(ffxiv_dx11.exe)$" }, workspace = "10 silent", fullscreen = true, render_unfocused = true, idle_inhibit = "always", immediate = true })
hl.window_rule({ match = { class = "^(XIVLauncher.Core)$" }, float = true, center = true, size = {850, 400} })

-- Steam - Dedicated Workspace 8
hl.window_rule({ match = { class = "^(steam)$" }, workspace = "8 silent", fullscreen = true, render_unfocused = true })
hl.window_rule({ match = { class = "^(Slay the Spire)$" }, workspace = "8 silent", fullscreen = true, render_unfocused = true })
hl.window_rule({ match = { title = "^(Steam Settings)$" }, float = true, center = true })
hl.window_rule({ match = { class = "^$", title = "^(Steam - Self Updater)$" }, float = true, center = true })

-- File dialogs
hl.window_rule({ match = { class = "^$", title = "^(Save File)$" }, float = true })
hl.window_rule({ match = { class = "^$", title = "^(Open File)$" }, float = true })
hl.window_rule({ match = { initial_title = "^(DevTools)$" }, float = true })

-- qBittorrent
hl.window_rule({ match = { class = "^(org.qbittorrent.qBittorrent)$" }, float = true, move = {560, 250}, size = {1200, 600}, center = true })

-- Discord (vesktop) - special workspace, monitor-agnostic
hl.window_rule({ match = { class = "^(vesktop)$" }, workspace = "special:discord silent", render_unfocused = true })

-- Fooyin music - Workspace 9 fullscreen
hl.window_rule({ match = { class = "^(org.fooyin.fooyin|fooyin)$" }, workspace = "9 silent", fullscreen = true })

-- Picture-in-Picture (PiP)
hl.window_rule({
    match = { title = "^(Picture-in-Picture)$" },
    float = true, pin = true, no_initial_focus = true, focus_on_activate = false,
    size = {378, 213}, move = {1522, 847}, monitor = "eDP-1",
    fullscreen_state = "0 0", suppress_event = "fullscreen",
})
hl.window_rule({
    match = { title = "^(Picture in picture)$" },
    float = true, pin = true, no_initial_focus = true, focus_on_activate = false,
    size = {378, 213}, move = {1522, 847}, monitor = "eDP-1",
    fullscreen_state = "0 0", suppress_event = "fullscreen",
})

-- Browser / App-specific tweaks
hl.window_rule({ match = { class = "^(firefox-developer-edition)$", title = "negative:^(Picture-in-Picture)$" }, no_blur = true, tile = true, fullscreen_state = "2 1" })
hl.window_rule({ match = { class = "^(vivaldi-stable)$" }, no_blur = true, tile = true, fullscreen_state = "1 1", suppress_event = "maximize fullscreen" })
hl.window_rule({ match = { class = "^(Tor Browser)$" }, no_blur = true, tile = true, suppress_event = "maximize fullscreen" })
hl.window_rule({ match = { class = "^(helium)$" }, no_blur = true, tile = true, suppress_event = "maximize fullscreen" })

-- Workspace render rules
hl.window_rule({ match = { workspace = "8" },  render_unfocused = true })
hl.window_rule({ match = { workspace = "10" }, render_unfocused = true, fullscreen = true })

-- wofi (launcher)
hl.window_rule({ match = { class = "^(wofi)$" }, float = true, rounding = 16, center = true, dim_around = true, no_max_size = true })

-- Layer rules
hl.layer_rule({ match = { namespace = "logout_dialog" }, animation = "slide top" })
hl.layer_rule({ match = { namespace = "waybar" },        animation = "popin 50%" })
hl.layer_rule({ match = { namespace = "wallpaper" },     animation = "fade 50%" })
