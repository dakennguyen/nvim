local M = {}

M.specs = {
  "EdenEast/nightfox.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    palettes = {
      nightfox = {
        light = "#BBC2CF",
        strong = "#FFFFFF",
        diff_add = "#618774",
        diff_add_bg = "#394E3D",
        diff_change = "#ba793e",
        diff_change_bg = "#52341b",
        diff_remove = "#b95d76",
        diff_remove_bg = "#4D2B2E",
      },
      dayfox = {
        light = "#494b53",
        strong = "#000000",
        diff_add = "#287980",
        diff_add_bg = "#a4c1c2",
        diff_change = "#ba793e",
        diff_change_bg = "#e7d2be",
        diff_remove = "#b95d76",
        diff_remove_bg = "#824d5b",
      },
    },
  },
  config = function(_, opts)
    require("nightfox").setup(opts)

    if vim.o.background == "light" then
      vim.cmd "colorscheme dayfox"
    else
      vim.cmd "colorscheme nightfox"
    end
  end,
}

function M.colors()
  local palette
  if vim.o.background == "light" then
    palette = require("nightfox.palette").load().dayfox
  else
    palette = require("nightfox.palette").load().nightfox
  end

  return {
    lualine = {
      default_fg = palette.cyan.dim,
      default_bg = palette.bg1,
      light = palette.light,
      visual = palette.orange.dim,
      insert = palette.blue.dim,
      replace = palette.red.dim,
      command = palette.magenta.dim,
      op = palette.green.dim,
      yellow = palette.yellow.dim,
      inactive = palette.bg4,
      strong = palette.strong,
    },
    gitsigns = {
      add_fg = palette.diff_add,
      add_bg = palette.diff_add_bg,
      change_fg = palette.diff_change,
      change_bg = palette.diff_change_bg,
      delete_fg = palette.diff_remove,
      delete_bg = palette.diff_remove_bg,
    },
  }
end

return M
