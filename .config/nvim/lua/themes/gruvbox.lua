local M = {}

M.specs = {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd "colorscheme gruvbox"
    _G.highlight("SignColumn", { link = "Normal" })
    _G.highlight("CursorLineNR", { link = "LineNr" })
  end,
}

function M.colors() return {} end

return M
