local M = {}

M.specs = {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function() vim.cmd.colorscheme "catppuccin-latte" end,
}

function M.colors() return {} end

return M
