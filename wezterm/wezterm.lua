local wezterm = require 'wezterm';

return {
    colors = {
        tab_bar = {
            background = "#282c34",
            active_tab = {
                bg_color = "#b1b3b9",
                fg_color = "#2c2d30",
                intensity = "Normal",
                underline = "None",
                italic = false,
                strikethrough = false,
            },
            inactive_tab = {
                bg_color = "#2c2d30",
                fg_color = "#61636b",
            },
            inactive_tab_hover = {
                bg_color = "#35373b",
                fg_color = "#b1b3b9",
            },
            new_tab = {
                bg_color = "#2c2d30",
                fg_color = "#61636b",
            },
            new_tab_hover = {
                bg_color = "#35373b",
                fg_color = "#b1b3b9",
            },
        },
        foreground = "#bbc2cf",
        background = "#282c34",
        cursor_bg = "#b1b3b9",
        cursor_fg = "#2c2d30",
        cursor_border = "#b1b3b9",
        selection_fg = "#2c2d30",
        selection_bg = "#b1b3b9",
        split = "#b1b3b9",
        ansi = {"#2c2d30", "#E56A73", "#9BC379", "#EDBE67", "#5eb6ed", "#C67BDD", "#5dc6c4", "#b1b3b9"},
        brights = {"#2c2d30", "#E56A73", "#9BC379", "#EDBE67", "#5eb6ed", "#C67BDD", "#5dc6c4", "#b1b3b9"},
    },

    font_size = 9.5,
    font = wezterm.font("JetBrains Mono"), 
    line_height = 1.0,
 
    window_close_confirmation = "NeverPrompt",
}
