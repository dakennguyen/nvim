local M = {}

M.specs = {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd "colorscheme gruvbox"
    vim.cmd "hi! link SignColumn Normal"
    vim.cmd "hi! link CursorLineNR LineNr"
  end,
}

function M.colors() return {} end

return M
