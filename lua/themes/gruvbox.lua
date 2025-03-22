local M = {}

M.specs = {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd "colorscheme gruvbox"
    vim.api.nvim_set_hl(0, "SignColumn", { link = "Normal" })
    vim.api.nvim_set_hl(0, "CursorLineNR", { link = "LineNr" })
  end,
}

function M.colors()
  if vim.o.background == "dark" then return {} end

  return {
    gitsigns = {
      add_fg = "#4c9c3e",
      change_fg = "#f28c28",
      delete_fg = "#e34f4f",
    },
  }
end

return M
