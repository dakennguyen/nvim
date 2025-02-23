local M = {}

M.specs = {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd "hi! link SignColumn Normal"
    vim.cmd "colorscheme gruvbox"
  end,
}

function M.colors() return {} end

return M
