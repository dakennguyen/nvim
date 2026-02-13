local M = {}

function M.setup()
  vim.pack.add { "https://github.com/NTBBloodbath/doom-one.nvim" }

  vim.cmd "colorscheme doom-one"
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#FFA8FF", italic = true })
end

function M.colors() return {} end

return M
