-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- For example, changing the color scheme:
config.color_scheme = "One Light (base16)"

config.font_size = 16
config.font = wezterm.font({
        family = "MonacoB",
        weight = "Bold",
})

config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true

act = wezterm.action

config.keys = {
        {
                key = "raw:36",
                mods = "CMD|SHIFT",
                action = act.TogglePaneZoomState,
        },
        {
                key = "d",
                mods = "CMD",
                action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
        },
        {
                key = "d",
                mods = "CMD|SHIFT",
                action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
        },
        {
                key = "w",
                mods = "CMD",
                action = act.CloseCurrentPane({ confirm = true }),
        },
        {
                key = "LeftArrow",
                mods = "CMD|SHIFT",
                action = act.MoveTabRelative(-1),
        },
        {
                key = "RightArrow",
                mods = "CMD|SHIFT",
                action = act.MoveTabRelative(1),
        },
        {
                key = "LeftArrow",
                mods = "CMD|OPT",
                action = act.ActivatePaneDirection("Left"),
        },
        {
                key = "RightArrow",
                mods = "CMD|OPT",
                action = act.ActivatePaneDirection("Right"),
        },
        {
                key = "UpArrow",
                mods = "CMD|OPT",
                action = act.ActivatePaneDirection("Up"),
        },
        {
                key = "DownArrow",
                mods = "CMD|OPT",
                action = act.ActivatePaneDirection("Down"),
        },
}

-- and finally, return the configuration to wezterm
return config
