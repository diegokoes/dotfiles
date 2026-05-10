local colors = require("config.colors")

hl.config({
    general = {
        border_size              = 0,
        col = {
            active_border   = colors.cachywhite,
            inactive_border = colors.cachymblue,
        },
        layout                   = "dwindle",
        gaps_out                 = { top = 20, right = 20, bottom = 20, left = 20 },
        gaps_in                  = { top = 5,  right = 5,  bottom = 5,  left = 5  },
        allow_tearing            = true,
        warp_on_change_workspace = false,
        warp_on_toggle_special   = false,
        snap = {
            enabled = true,
        },
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
        enable_swallow          = true,
        swallow_regex           = "^(cachy-browser|firefox|nautilus|nemo|thunar|btrfs-assistant.)$",
        focus_on_activate       = true,
        vrr                     = 2,
        middle_click_paste      = false,
    },

    render = {
        direct_scanout = 0,
    },

    dwindle = {
        special_scale_factor = 0.8,
        pseudotile           = true,
        preserve_split       = true,
    },

    master = {
        new_status           = "master",
        special_scale_factor = 0.8,
    },

    scrolling = {
        column_width             = 0.5,
        focus_fit_method         = 1,
        fullscreen_on_one_column = true,
        direction                = "right",
    },
})
