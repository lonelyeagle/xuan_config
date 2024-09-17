-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Tokyo Night'
config.font = wezterm.font("MesloLGS NF")
config.font_size = 19
config.window_background_opacity = 0.8
config.macos_window_background_blur = 5
config.window_decorations = 'RESIZE|INTEGRATED_BUTTONS'
config.window_close_confirmation = 'NeverPrompt'

config.window_frame = {
    -- Berkeley Mono for me again, though an idea could be to try a
    -- serif font here instead of monospace for a nicer look?
    font = wezterm.font({ family = 'MesloLGS NF', weight = 'Bold' }),
    font_size = 15,
}

wezterm.on('update-status', function(window)
    -- Grab the utf8 character for the "powerline" left facing
    -- solid arrow.
    local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

    -- Grab the current window's configuration, and from it the
    -- palette (this is the combination of your chosen colour scheme
    -- including any overrides).
    local color_scheme = window:effective_config().resolved_palette
    local bg = color_scheme.background
    local fg = color_scheme.foreground

    window:set_right_status(wezterm.format({
    -- First, we draw the arrow...
    { Background = { Color = 'none' } },
    { Foreground = { Color = bg } },
    { Text = SOLID_LEFT_ARROW },
    -- Then we draw our text
    { Background = { Color = bg } },
    { Foreground = { Color = fg } },
    { Text = ' ' .. wezterm.hostname() .. ' ' },
    }))
end)

-- Table mapping keypresses to actions
config.keys = {
    -- Sends ESC + b and ESC + f sequence, which is used
    -- for telling your shell to jump back/forward.
    {
    -- When the left arrow is pressed
    key = 'LeftArrow',
    -- With the "Option" key modifier held down
    mods = 'OPT',
    -- Perform this action, in this case - sending ESC + B
    -- to the terminal
    action = wezterm.action.SendString '\x1bb',
    },
    {
    key = 'RightArrow',
    mods = 'OPT',
    action = wezterm.action.SendString '\x1bf',
    },
}

config.keys = {
    -- ... add these new entries to your config.keys table
    {
    key = ',',
    mods = 'SUPER',
    action = wezterm.action.SpawnCommandInNewTab {
        cwd = wezterm.home_dir,
        args = { 'nvim', wezterm.config_file },
    },
    },
}
config.set_environment_variables = {
    PATH = '/opt/homebrew/bin:' .. os.getenv('PATH')
}


-- and finally, return the configuration to wezterm
return config
