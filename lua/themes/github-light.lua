local M = {}

M.specs = {
  "romgrk/github-light.vim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd "colorscheme github-light"
    vim.api.nvim_set_hl(0, "Identifier", { italic = true })
  end,
}

function M.colors() return {} end

return M
