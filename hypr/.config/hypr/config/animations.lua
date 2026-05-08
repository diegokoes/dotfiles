hl.config({
    animations = { enabled = true },
})

hl.curve("overshot", { type = "bezier", points = { {0.13, 0.99}, {0.29, 1.1} } })
hl.curve("sharp",    { type = "bezier", points = { {0.25, 0.1},  {0.25, 1.0} } })

-- speed unit: 1 = 100ms. Old config used duration in ds (same unit), so values map directly.
hl.animation({ leaf = "windows",       enabled = true, speed = 3, bezier = "sharp",    style = "slide" })
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 2, bezier = "overshot", style = "popin 85%" })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 2, bezier = "default",  style = "popin 90%" })
hl.animation({ leaf = "windowsMove",   enabled = true, speed = 3, bezier = "sharp" })

hl.animation({ leaf = "border",        enabled = true, speed = 2, bezier = "default" })

hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 2, bezier = "sharp",   style = "slidefade 20%" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 2, bezier = "sharp",   style = "slidefade 20%" })

-- fadePopups: speed 1 = 100ms (instant-feeling)
hl.animation({ leaf = "fadePopups",    enabled = true, speed = 1, bezier = "default" })

hl.animation({ leaf = "fadeSwitch",    enabled = true, speed = 8, bezier = "sharp" })
hl.animation({ leaf = "fadeDim",       enabled = true, speed = 2, bezier = "sharp" })
