local M = {}

function M.setup()
  vim.pack.add {
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
  }

  vim.cmd "colorscheme catppuccin-macchiato"
end

function M.colors() return {} end

return M
