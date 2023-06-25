local palette = {}
local custom_colors = {}
if vim.o.background == 'light' then
  palette = require("tokyonight.colors").setup({ transform = true })
  custom_colors = {
    light = '#494b53',
    strong = '#000000',
    diff_add = "#287980",
    diff_add_bg = "#a4c1c2",
    diff_change = "#ba793e",
    diff_change_bg = "#e7d2be",
    diff_remove = "#b95d76",
    diff_remove_bg = "#824d5b",
  }
  vim.cmd("colorscheme tokyonight-day")
else
  palette = require("tokyonight.colors").setup()
  custom_colors = {
    light = '#E1E2E7',
    strong = '#FFFFFF',
    diff_add = "#618774",
    diff_add_bg = "#394E3D",
    diff_change = "#ba793e",
    diff_change_bg = "#52341b",
    diff_remove = "#b95d76",
    diff_remove_bg = "#4D2B2E",
  }
  vim.cmd("colorscheme tokyonight")
end

return {
  lualine = {
    default_fg = palette.cyan,
    default_bg = palette.bg,
    light = custom_colors.light,
    visual = palette.orange,
    insert = palette.blue,
    replace = palette.red,
    command = palette.magenta,
    op = palette.green,
    yellow = palette.yellow,
    inactive = palette.bg_dark,
    strong = custom_colors.strong,
  },
  gitsigns = {
    add_fg = custom_colors.diff_add,
    add_bg = custom_colors.diff_add_bg,
    change_fg = custom_colors.diff_change,
    change_bg = custom_colors.diff_change_bg,
    delete_fg = custom_colors.diff_remove,
    delete_bg = custom_colors.diff_remove_bg,
  }
}
