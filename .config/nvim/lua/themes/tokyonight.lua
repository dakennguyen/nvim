local palette = require("tokyonight.colors").setup {
  style = (vim.o.background == "light") and "day" or nil,
}
local bat_theme = (vim.o.background == "light") and "tokyonight_day" or "tokyonight_moon"

vim.cmd "colorscheme tokyonight"

_G.highlight("CursorLineNR", { fg = palette.fg_gutter })

return {
  lualine = {
    default_fg = palette.cyan,
    default_bg = palette.bg,
    light = palette.fg_dark,
    visual = palette.orange,
    insert = palette.blue,
    replace = palette.red,
    command = palette.magenta,
    op = palette.green,
    yellow = palette.yellow,
    inactive = palette.fg_dark,
    strong = palette.fg,
  },
  gitsigns = {
    add_fg = palette.green,
    change_fg = palette.blue,
    delete_fg = palette.red,
  },
  fzf = {
    bat_theme = bat_theme,
  },
}
