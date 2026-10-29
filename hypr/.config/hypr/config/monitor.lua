local monitors = {
    laptop   = "eDP-1",
    external = "desc:BNQ BenQ GW2790 X1R0145601Q",
}

hl.monitor({ output = monitors.laptop,   mode = "1920x1080@60",  position = "0x0",    scale = 1 })
-- No adaptive sync on the BenQ over HDMI; keeps misc.vrr from retrying on it
hl.monitor({ output = monitors.external, mode = "1920x1080@100", position = "1920x0", scale = 1, vrr = 0 })
hl.monitor({ output = "",                mode = "preferred",     position = "auto",   scale = 1 })

return monitors
