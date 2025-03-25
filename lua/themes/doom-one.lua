local M = {}

M.specs = {
  "NTBBloodbath/doom-one.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd "colorscheme doom-one"
    vim.api.nvim_set_hl(0, "Identifier", { fg = "#FFA8FF", italic = true })
  end,
}

function M.colors() return {} end

return M
