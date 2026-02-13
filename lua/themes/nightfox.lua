local M = {}

function M.setup()
  vim.pack.add { "https://github.com/EdenEast/nightfox.nvim" }

  require("nightfox").setup {
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
  }

  if vim.o.background == "light" then
    vim.cmd "colorscheme dayfox"
  else
    vim.cmd "colorscheme nightfox"
  end
end

function M.colors()
  local palette
  if vim.o.background == "light" then
    palette = require("nightfox.palette").load().dayfox
  else
    palette = require("nightfox.palette").load().nightfox
  end

  return {
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
