vim.cmd.colorscheme "catppuccin"

local color = require("catppuccin.palettes").get_palette "mocha"

return {
  lualine = {
    default_fg = color.blue,
    default_bg = color.base,
    light = color.text,
    visual = color.peach,
    insert = color.sky,
    replace = color.red,
    command = color.mauve,
    op = color.green,
    yellow = color.yellow,
    inactive = color.subtext0,
    dark = color.subtext1,
  },
  fzf = {
    bat_theme = "Catppuccin Mocha",
  },
}
