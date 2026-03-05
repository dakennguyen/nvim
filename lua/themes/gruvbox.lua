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
  local colors = require("gruvbox").palette

  return {
    gitsigns = {
      add_fg = colors.faded_blue,
      change_fg = colors.faded_purple,
      delete_fg = colors.faded_orange,
    },
  }
end

return M
