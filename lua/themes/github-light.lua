local M = {}

function M.setup()
  vim.pack.add { "https://github.com/romgrk/github-light.vim" }

  vim.cmd "colorscheme github-light"
  vim.api.nvim_set_hl(0, "Identifier", { italic = true })
end

function M.colors() return {} end

return M
