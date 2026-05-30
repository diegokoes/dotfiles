local envs = {
    HYPRCURSOR_THEME = "rose-pine-hyprcursor",
    HYPRCURSOR_SIZE = "24",
    XCURSOR_THEME = "rose-pine-hyprcursor",
    XCURSOR_SIZE = "24",
    QT_CURSOR_SIZE = "24",
    QT_QPA_PLATFORM = "wayland;xcb",
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1",
}

for key, value in pairs(envs) do
    hl.env(key, value)
end
