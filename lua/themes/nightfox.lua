local palette = {}
local custom_colors = {}
if vim.o.background == 'light' then
  palette = require('nightfox.palette').load().dayfox
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
  vim.cmd("colorscheme dayfox")
else
  palette = require('nightfox.palette').load().nightfox
  custom_colors = {
    light = '#BBC2CF',
    strong = '#FFFFFF',
    diff_add = "#618774",
    diff_add_bg = "#394E3D",
    diff_change = "#ba793e",
    diff_change_bg = "#52341b",
    diff_remove = "#b95d76",
    diff_remove_bg = "#4D2B2E",
  }
  vim.cmd("colorscheme nightfox")
end

return {
  lualine = {
    default_fg = palette.cyan.dim,
    default_bg = palette.bg1,
    light = custom_colors.light,
    visual = palette.orange.dim,
    insert = palette.blue.dim,
    replace = palette.red.dim,
    command = palette.magenta.dim,
    op = palette.green.dim,
    yellow = palette.yellow.dim,
    inactive = palette.bg4,
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
