local d = require("config.defaults")
local monitors = require("config.monitor")
local mainMod = "SUPER"

-- ======= Window Actions =======
-- Steam only hides its window on close, so quit it fully instead
hl.bind(mainMod .. " + Q", function()
    local w = hl.get_active_window()
    if w and w.class == "steam" then
        hl.exec_cmd("steam -shutdown")
    else
        hl.dispatch(hl.dsp.window.close())
    end
end)
hl.bind(mainMod .. " + CTRL + V",     hl.dsp.window.float({ action = "toggle" }))
hl.bind("CTRL + SHIFT + SPACE",       hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + Y",            hl.dsp.window.pin())
hl.bind(mainMod .. " + J",            hl.dsp.layout("togglesplit"))

-- ======= App Shortcuts =======
hl.bind(mainMod .. " + SPACE",        hl.dsp.exec_cmd(d.applauncher))
hl.bind(mainMod .. " + O",            hl.dsp.exec_cmd("obsidian"))
hl.bind(mainMod .. " + F",            hl.dsp.exec_cmd(d.browser))
hl.bind(mainMod .. " + SHIFT + C",    hl.dsp.exec_cmd("hyprpicker -a -f hex -l"))
hl.bind(mainMod .. " + Z",            hl.dsp.exec_cmd("~/.config/hypr/scripts/open-project.sh"))
hl.bind(mainMod .. " + H",            hl.dsp.exec_cmd("helium-browser"))
hl.bind(mainMod .. " + SHIFT + Q",    hl.dsp.exec_cmd("qbittorrent"))

-- ======= Dedicated App Workspaces =======
-- Window rules in windowrules.lua place each app on its workspace

-- Discord: special workspace, monitor-agnostic
hl.bind(mainMod .. " + D",            hl.dsp.workspace.toggle_special("discord"))
hl.bind(mainMod .. " + SHIFT + D",    hl.dsp.exec_cmd(d.discord))

-- Steam
hl.bind(mainMod .. " + S",            hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + SHIFT + S",    hl.dsp.exec_cmd("prime-run steam -silent"))

-- Steam games (moved here automatically, see windowrules.lua)
hl.bind(mainMod .. " + G",            hl.dsp.focus({ workspace = 7 }))

-- Fooyin music
hl.bind(mainMod .. " + M",            hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + SHIFT + M",    hl.dsp.exec_cmd("fooyin"))

-- Move active window to dedicated workspaces
hl.bind(mainMod .. " + CTRL + S",     hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + CTRL + G",     hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + CTRL + D",     hl.dsp.window.move({ workspace = "special:discord" }))
hl.bind(mainMod .. " + CTRL + M",     hl.dsp.window.move({ workspace = 9 }))

-- ======= Terminal-based apps =======
hl.bind(mainMod .. " + T",            hl.dsp.exec_cmd(d.terminal))
hl.bind(mainMod .. " + E",            hl.dsp.exec_cmd(d.terminal .. " -e " .. d.filemanager))
hl.bind(mainMod .. " + SHIFT + W",    hl.dsp.exec_cmd(d.terminal .. " -e " .. d.wifimanager))
hl.bind(mainMod .. " + SHIFT + B",    hl.dsp.exec_cmd(d.terminal .. " -e " .. d.bluetoothtui))
hl.bind(mainMod .. " + SHIFT + V",    hl.dsp.exec_cmd("[float; size 622 652] " .. d.terminal .. " -e 'clipse'"))
hl.bind(mainMod .. " + SHIFT + G",    hl.dsp.exec_cmd(d.terminal .. " -e gdu /"))

-- ======= Scripts =======
hl.bind(mainMod .. " + N",            hl.dsp.exec_cmd("swaync-client -d"))
hl.bind(mainMod .. " + W",            hl.dsp.exec_cmd("~/.config/hypr/scripts/wallpaper.sh"))

-- ======= Screenshots =======
hl.bind(mainMod .. " + CTRL + SHIFT + S", hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh region"))
hl.bind(mainMod .. " + Print",            hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh full"))

-- ======= Grouping Windows =======
hl.bind(mainMod .. " + K",            hl.dsp.group.toggle())
hl.bind(mainMod .. " + Tab",          hl.dsp.group.next())

-- ======= Volume Control =======
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("~/.config/hypr/scripts/volume.sh up"),   { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("~/.config/hypr/scripts/volume.sh down"), { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("~/.config/hypr/scripts/volume.sh mute"), { locked = true })
hl.bind("CTRL + ALT + SHIFT + S", hl.dsp.exec_cmd(d.volumecontrol .. " -t 1"))

-- ======= Playback Control =======
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- ======= Screen Brightness =======
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl s +5%"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"), { locked = true, repeating = true })

-- ======= System =======
hl.bind(mainMod .. " + L",            hl.dsp.exec_cmd(d.lock))
hl.bind(mainMod .. " + ALT + F4",     hl.dsp.exec_cmd(d.terminal .. " -e shutdown now"))
hl.bind(mainMod .. " + ALT + F5",     hl.dsp.exec_cmd(d.terminal .. " -e reboot"))

-- ======= Window movement =======
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "d" }))

hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "d" }))

-- ======= Resize =======
local resize_steps = {
    { key = "right", x =  65, y =   0 },
    { key = "left",  x = -65, y =   0 },
    { key = "up",    x =   0, y = -65 },
    { key = "down",  x =   0, y =  65 },
    { key = "l",     x =  65, y =   0 },
    { key = "h",     x = -65, y =   0 },
    { key = "k",     x =   0, y = -65 },
    { key = "j",     x =   0, y =  65 },
}

-- Quick resize via keyboard
for _, s in ipairs(resize_steps) do
    hl.bind(mainMod .. " + CTRL + SHIFT + " .. s.key, hl.dsp.window.resize({ x = s.x, y = s.y, relative = true }))
end

-- Mouse drag/resize
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Resize submap
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
    for _, s in ipairs(resize_steps) do
        hl.bind(s.key, hl.dsp.window.resize({ x = s.x, y = s.y, relative = true }), { repeating = true })
    end
    hl.bind("escape", hl.dsp.submap("reset"))
end)

-- ======= Workspaces 1-6 =======
for i = 1, 6 do
    hl.bind(mainMod .. " + " .. i,           hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + CTRL + " .. i,    hl.dsp.window.move({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. i,   hl.dsp.window.move({ workspace = i, follow = false }))
end
hl.bind(mainMod .. " + CTRL + left",  hl.dsp.window.move({ workspace = "-1" }))
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.move({ workspace = "+1" }))

-- Scroll through workspaces
hl.bind(mainMod .. " + PERIOD", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + COMMA",  hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + slash",  hl.dsp.focus({ workspace = "previous" }))

-- ======= Monitor Rotation Submap =======
hl.bind(mainMod .. " + R", hl.dsp.submap("monitor_rotate"))
hl.define_submap("monitor_rotate", "reset", function()
    hl.bind("v", function()
        hl.monitor({ output = monitors.external, mode = "1920x1080@100", position = "1920x0", scale = 1, vrr = 0, transform = 1 })
    end)
    hl.bind("h", function()
        hl.monitor({ output = monitors.external, mode = "1920x1080@100", position = "1920x0", scale = 1, vrr = 0, transform = 0 })
    end)
    hl.bind("escape", hl.dsp.submap("reset"))
end)

-- ======= binds {} options =======
hl.config({
    binds = {
        allow_workspace_cycles            = true,
        workspace_back_and_forth          = true,
        workspace_center_on               = 1,
        movefocus_cycles_fullscreen       = true,
        window_direction_monitor_fallback = true,
    },
})
