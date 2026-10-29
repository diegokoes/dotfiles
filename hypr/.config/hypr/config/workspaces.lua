local monitors = require("config.monitor")

-- Primary monitor (laptop) gets workspaces 1-3
hl.workspace_rule({ workspace = "1", monitor = monitors.laptop, default = true })
hl.workspace_rule({ workspace = "2", monitor = monitors.laptop })
hl.workspace_rule({ workspace = "3", monitor = monitors.laptop })

-- Secondary monitor gets workspaces 4-6 when connected (falls back to eDP-1 automatically)
hl.workspace_rule({ workspace = "4", monitor = monitors.external, default = true })
hl.workspace_rule({ workspace = "5", monitor = monitors.external })
hl.workspace_rule({ workspace = "6", monitor = monitors.external })

-- Dedicated app workspaces
hl.workspace_rule({ workspace = "7",  monitor = monitors.external, default_name = "games" })
hl.workspace_rule({ workspace = "8",  monitor = monitors.external, default_name = "steam" })
hl.workspace_rule({ workspace = "9",                               default_name = "music" })

-- Special workspaces: inset to ~80% of a 1920x1080 output (replaces dwindle.special_scale_factor = 0.8)
hl.workspace_rule({ workspace = "s[true]", gaps_out = { top = 108, right = 192, bottom = 108, left = 192 } })
