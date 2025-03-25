local M = {}

M.specs = {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function() vim.cmd.colorscheme "catppuccin-macchiato" end,
}

function M.colors() return {} end

return M
