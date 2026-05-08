-- NVIDIA (RTX 3060) primary; Intel iGPU fallback. Uses stable by-path names to avoid card1/card2 swapping at boot.
hl.env("AQ_DRM_DEVICES", "/dev/dri/pci-0000:01:00.0-card:/dev/dri/pci-0000:00:02.0-card")
hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "rose-pine-hyprcursor")
hl.env("XCURSOR_SIZE", "24")
hl.env("QT_CURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
