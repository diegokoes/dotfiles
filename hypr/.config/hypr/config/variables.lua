local colors = require("config.colors")

hl.config({
    general = {
        border_size              = 0,
        layout                   = "dwindle",
        gaps_out                 = { top = 20, right = 20, bottom = 20, left = 20 },
        gaps_in                  = { top = 5,  right = 5,  bottom = 5,  left = 5  },
        allow_tearing            = true,
    },

    group = {
        col = {
            border_active          = colors.cachydgreen,
            border_inactive        = colors.cachylgreen,
            border_locked_active   = colors.cachymgreen,
            border_locked_inactive = colors.cachydblue,
        },
        groupbar = {
            font_family       = "Fira Sans",
            text_color        = colors.cachydblue,
            col = {
                active          = colors.cachydgreen,
                inactive        = colors.cachylgreen,
                locked_active   = colors.cachymgreen,
                locked_inactive = colors.cachydblue,
            },
        },
    },

    misc = {
        font_family             = "Fira Sans",
        disable_hyprland_logo   = true,
        background_color        = colors.cachydblue,
        focus_on_activate       = true,
        vrr                     = 2,
        middle_click_paste      = false,
    },

    render = {
        direct_scanout = 0,
    },

    dwindle = {
        preserve_split       = true,
    },
})
