local M = {}

M.specs = {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme "catppuccin-mocha"
  end,
}

function M.colors()
  local color = require("catppuccin.palettes").get_palette "mocha"

  return {
    lualine = {
      default_fg = color.blue,
      default_bg = color.base,
      light = color.text,
      visual = color.peach,
      insert = color.sky,
      replace = color.red,
      command = color.mauve,
      op = color.green,
      yellow = color.yellow,
      inactive = color.subtext0,
      strong = color.subtext1,
    },
  }
end

return M
