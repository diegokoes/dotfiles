local d = require("config.defaults")
local mainMod = "SUPER"

-- ======= Window Actions =======
hl.bind(mainMod .. " + Q",            hl.dsp.window.close())
hl.bind(mainMod .. " + CTRL + V",     hl.dsp.window.float({ action = "toggle" }))
hl.bind("CTRL + SHIFT + SPACE",       hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + Y",            hl.dsp.window.pin())
hl.bind(mainMod .. " + J",            hl.dsp.layout("togglesplit"))

-- ======= App Shortcuts =======
hl.bind(mainMod .. " + SPACE",        hl.dsp.exec_cmd(d.applauncher))
hl.bind(mainMod .. " + O",            hl.dsp.exec_cmd("obsidian"))
hl.bind(mainMod .. " + C",            hl.dsp.exec_cmd("code /home/koes/programming"))
hl.bind(mainMod .. " + F",            hl.dsp.exec_cmd(d.browser))
hl.bind(mainMod .. " + SHIFT + C",    hl.dsp.exec_cmd("hyprpicker -a -f hex -l"))
hl.bind(mainMod .. " + SHIFT + T",    hl.dsp.exec_cmd("thunderbird"))
hl.bind(mainMod .. " + Z",            hl.dsp.exec_cmd("zeditor programming"))
hl.bind(mainMod .. " + H",            hl.dsp.exec_cmd("helium-browser"))
hl.bind(mainMod .. " + V",            hl.dsp.exec_cmd("vivaldi"))
hl.bind(mainMod .. " + SHIFT + Q",    hl.dsp.exec_cmd("qbittorrent"))
hl.bind(mainMod .. " + I",            hl.dsp.exec_cmd("intellij-idea-ultimate-edition"))

-- ======= Dedicated App Workspaces =======
-- Discord: special workspace, monitor-agnostic
hl.bind(mainMod .. " + D",            hl.dsp.workspace.toggle_special("discord"))
hl.bind(mainMod .. " + SHIFT + D",    hl.dsp.exec_cmd("[workspace special:discord silent] vesktop --ozone-platform-hint=auto %U --enable-blink-features=MiddleClickAutoscroll"))

-- Steam
hl.bind(mainMod .. " + S",            hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + SHIFT + S",    hl.dsp.exec_cmd("[workspace 8 silent] steam -silent"))

-- FFXIV (launched separately by XIVLauncher)
hl.bind(mainMod .. " + B",            hl.dsp.focus({ workspace = 10 }))

-- Fooyin music
hl.bind(mainMod .. " + N",            hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + SHIFT + N",    hl.dsp.exec_cmd("[workspace 9 silent] fooyin"))

-- Move active window to dedicated workspaces
hl.bind(mainMod .. " + CTRL + S",     hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + CTRL + D",     hl.dsp.window.move({ workspace = "special:discord" }))
hl.bind(mainMod .. " + CTRL + B",     hl.dsp.window.move({ workspace = 10 }))
hl.bind(mainMod .. " + CTRL + N",     hl.dsp.window.move({ workspace = 9 }))

-- ======= Terminal-based apps =======
hl.bind(mainMod .. " + T",            hl.dsp.exec_cmd(d.terminal))
hl.bind(mainMod .. " + E",            hl.dsp.exec_cmd(d.terminal .. " -e " .. d.filemanager))
hl.bind(mainMod .. " + SHIFT + W",    hl.dsp.exec_cmd(d.terminal .. " -e " .. d.wifimanager))
hl.bind(mainMod .. " + SHIFT + B",    hl.dsp.exec_cmd(d.terminal .. " -e " .. d.bluetoothtui))
hl.bind(mainMod .. " + SHIFT + V",    hl.dsp.exec_cmd("[float; size 622 652] " .. d.terminal .. " -e 'clipse'"))
hl.bind(mainMod .. " + G",            hl.dsp.exec_cmd(d.terminal .. " -e gdu /"))

-- ======= Scripts =======
hl.bind(mainMod .. " + M",            hl.dsp.exec_cmd("/home/koes/.config/waybar/scripts/dnd.sh toggle"))
hl.bind(mainMod .. " + SHIFT + K",    hl.dsp.exec_cmd("/home/koes/.config/hypr/config/scripts/toggle-waybar.sh"))
hl.bind(mainMod .. " + W",            hl.dsp.exec_cmd("~/.config/hypr/scripts/wallpaper.sh"))

-- ======= Screenshots =======
hl.bind(mainMod .. " + CTRL + SHIFT + S", hl.dsp.exec_cmd([[bash -c 'dir=/home/koes/Pictures/screenshots; mkdir -p "$dir"; grim -g "$(slurp -d)" - | tee "$dir/$(date +%Y-%m-%d_%H-%M-%S).png" | wl-copy']]))
hl.bind(mainMod .. " + Print",            hl.dsp.exec_cmd([[bash -c 'dir=/home/koes/Pictures/screenshots; mkdir -p "$dir"; grim - | tee "$dir/$(date +%Y-%m-%d_%H-%M-%S).png" | wl-copy']]))

-- ======= Grouping Windows =======
hl.bind(mainMod .. " + K",            hl.dsp.group.toggle())
hl.bind(mainMod .. " + Tab",          hl.dsp.group.next())

-- ======= Volume Control =======
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd([[pactl set-sink-volume @DEFAULT_SINK@ +5% && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | awk '{if($1>100) system("pactl set-sink-volume @DEFAULT_SINK@ 100%")}' && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | awk '{print $1}' | head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob]]), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd([[pactl set-sink-volume @DEFAULT_SINK@ -5% && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | awk '{print $1}' | head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob]]), { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd([[amixer sset Master toggle | sed -En '/\[on\]/ s/.*\[([0-9]+)%\].*/\1/ p; /\[off\]/ s/.*/0/p' | head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob]]), { locked = true, repeating = true })
hl.bind("CTRL + ALT + SHIFT + S", hl.dsp.exec_cmd(d.volumecontrol .. " -t 1"))

-- ======= Playback Control =======
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))

-- ======= Screen Brightness =======
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl s +5%"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"), { locked = true, repeating = true })

-- ======= System =======
hl.bind(mainMod .. " + L",            hl.dsp.exec_cmd(d.lockdaemon))
hl.bind(mainMod .. " + SHIFT + O",    hl.dsp.exec_cmd("killall -SIGUSR2 waybar"))
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

-- Quick resize via keyboard
hl.bind(mainMod .. " + CTRL + SHIFT + right", hl.dsp.window.resize({ x =  65, y =   0, relative = true }))
hl.bind(mainMod .. " + CTRL + SHIFT + left",  hl.dsp.window.resize({ x = -65, y =   0, relative = true }))
hl.bind(mainMod .. " + CTRL + SHIFT + up",    hl.dsp.window.resize({ x =   0, y = -65, relative = true }))
hl.bind(mainMod .. " + CTRL + SHIFT + down",  hl.dsp.window.resize({ x =   0, y =  65, relative = true }))
hl.bind(mainMod .. " + CTRL + SHIFT + l",     hl.dsp.window.resize({ x =  65, y =   0, relative = true }))
hl.bind(mainMod .. " + CTRL + SHIFT + h",     hl.dsp.window.resize({ x = -65, y =   0, relative = true }))
hl.bind(mainMod .. " + CTRL + SHIFT + k",     hl.dsp.window.resize({ x =   0, y = -65, relative = true }))
hl.bind(mainMod .. " + CTRL + SHIFT + j",     hl.dsp.window.resize({ x =   0, y =  65, relative = true }))

-- Mouse drag/resize
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- ======= Resize Submap =======
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
    hl.bind("right",  hl.dsp.window.resize({ x =  65, y =   0, relative = true }), { repeating = true })
    hl.bind("left",   hl.dsp.window.resize({ x = -65, y =   0, relative = true }), { repeating = true })
    hl.bind("up",     hl.dsp.window.resize({ x =   0, y = -65, relative = true }), { repeating = true })
    hl.bind("down",   hl.dsp.window.resize({ x =   0, y =  65, relative = true }), { repeating = true })
    hl.bind("l",      hl.dsp.window.resize({ x =  65, y =   0, relative = true }), { repeating = true })
    hl.bind("h",      hl.dsp.window.resize({ x = -65, y =   0, relative = true }), { repeating = true })
    hl.bind("k",      hl.dsp.window.resize({ x =   0, y = -65, relative = true }), { repeating = true })
    hl.bind("j",      hl.dsp.window.resize({ x =   0, y =  65, relative = true }), { repeating = true })
    hl.bind("escape", hl.dsp.submap("reset"))
end)

-- ======= Move active window to a workspace =======
hl.bind(mainMod .. " + CTRL + 1",     hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + CTRL + 2",     hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + CTRL + 3",     hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + CTRL + 4",     hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + CTRL + 5",     hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + CTRL + 6",     hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + CTRL + left",  hl.dsp.window.move({ workspace = "-1" }))
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.move({ workspace = "+1" }))

-- Same as above, silent (don't switch)
hl.bind(mainMod .. " + SHIFT + 1",    hl.dsp.window.move({ workspace = 1, follow = false }))
hl.bind(mainMod .. " + SHIFT + 2",    hl.dsp.window.move({ workspace = 2, follow = false }))
hl.bind(mainMod .. " + SHIFT + 3",    hl.dsp.window.move({ workspace = 3, follow = false }))
hl.bind(mainMod .. " + SHIFT + 4",    hl.dsp.window.move({ workspace = 4, follow = false }))
hl.bind(mainMod .. " + SHIFT + 5",    hl.dsp.window.move({ workspace = 5, follow = false }))
hl.bind(mainMod .. " + SHIFT + 6",    hl.dsp.window.move({ workspace = 6, follow = false }))

-- ======= Workspace switching =======
hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + 6", hl.dsp.focus({ workspace = 6 }))

-- ======= Scrolling Layout (workspaces 1-6) =======
hl.bind(mainMod .. " + bracketright",        hl.dsp.layout("colresize +conf"))
hl.bind(mainMod .. " + bracketleft",         hl.dsp.layout("colresize -conf"))
hl.bind(mainMod .. " + CTRL + bracketright", hl.dsp.layout("swapcol r"))
hl.bind(mainMod .. " + CTRL + bracketleft",  hl.dsp.layout("swapcol l"))
hl.bind(mainMod .. " + ALT + right",         hl.dsp.layout("focus r"))
hl.bind(mainMod .. " + ALT + left",          hl.dsp.layout("focus l"))
hl.bind(mainMod .. " + grave",               hl.dsp.layout("promote"))
hl.bind(mainMod .. " + CTRL + F",            hl.dsp.layout("fit visible"))

-- Scroll through workspaces
hl.bind(mainMod .. " + PERIOD", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + COMMA",  hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + slash",  hl.dsp.focus({ workspace = "previous" }))

-- ======= Monitor Rotation Submap =======
hl.bind(mainMod .. " + R", hl.dsp.submap("monitor_rotate"))
hl.define_submap("monitor_rotate", function()
    -- Rotate external monitor to vertical (manga mode)
    hl.bind("V", hl.dsp.exec_cmd([[bash -c 'hyprctl keyword monitor "desc:BNQ BenQ GW2790 X1R0145601Q, 1920x1080@100, 1920x0, 1, transform, 1" && hyprctl dispatch submap reset']]))
    -- Rotate external monitor back to horizontal
    hl.bind("H", hl.dsp.exec_cmd([[bash -c 'hyprctl keyword monitor "desc:BNQ BenQ GW2790 X1R0145601Q, 1920x1080@100, 1920x0, 1, transform, 0" && hyprctl dispatch submap reset']]))
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
