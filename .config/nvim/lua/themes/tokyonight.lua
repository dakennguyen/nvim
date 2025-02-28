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

  _G.highlight("CursorLineNR", { fg = palette.fg_gutter })

  return {}
end

return M
