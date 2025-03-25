local M = {}

M.specs = {
  "NTBBloodbath/doom-one.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd "colorscheme doom-one"
    _G.highlight("Identifier", { fg = "#FFA8FF", style = "italic" })
  end,
}

function M.colors() return {} end

return M
