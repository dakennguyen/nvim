local M = {}

M.specs = {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function() vim.cmd "colorscheme tokyonight" end,
}

function M.colors()
  local palette = require("tokyonight.colors").setup {
    style = (vim.o.background == "light") and "day" or nil,
  }

  vim.api.nvim_set_hl(0, "CursorLineNR", { fg = palette.fg_gutter })

  return {
    gitsigns = {
      add_fg = palette.green,
      change_fg = palette.blue,
      delete_fg = palette.red,
    },
  }
end

return M
