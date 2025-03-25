local M = {}

M.specs = {
  "romgrk/github-light.vim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd "colorscheme github-light"
    _G.highlight("Identifier", { style = "italic" })
  end,
}

function M.colors() return {} end

return M
