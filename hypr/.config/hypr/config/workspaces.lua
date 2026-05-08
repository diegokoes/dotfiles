-- Primary monitor (laptop) gets workspaces 1-3
hl.workspace_rule({ workspace = "1", monitor = "eDP-1", default = true })
hl.workspace_rule({ workspace = "2", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "3", monitor = "eDP-1" })

-- Secondary monitor gets workspaces 4-6 when connected (falls back to eDP-1 automatically)
hl.workspace_rule({ workspace = "4", monitor = "HDMI-A-1", default = true })
hl.workspace_rule({ workspace = "5", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "6", monitor = "HDMI-A-1" })

-- Dedicated app workspaces
hl.workspace_rule({ workspace = "8",  monitor = "HDMI-A-1", default_name = "steam" })
hl.workspace_rule({ workspace = "9",                        default_name = "music" })
hl.workspace_rule({ workspace = "10", monitor = "HDMI-A-1", default_name = "ffxiv" })
