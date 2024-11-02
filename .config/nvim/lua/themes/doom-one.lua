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

function M.colors()
  local palette = require("doom-one.colors").get_palette(vim.o.background)

  return {
    lualine = {
      default_fg = palette.blue,
      default_bg = palette.bg,
      light = palette.fg,
      visual = palette.orange,
      insert = palette.dark_blue,
      replace = palette.red,
      command = palette.magenta,
      op = palette.green,
      yellow = palette.yellow,
      inactive = palette.fg_alt,
      dark = palette.base8,
    },
    -- gitsigns = {
    --   add_fg = '#a6bf8f',
    --   add_bg = '#42534f',
    --   change_fg = '#405d7e',
    --   change_bg = '#39495d',
    --   delete_fg = '#d69fa7',
    --   delete_bg = '#3d3941',
    -- }
  }
end

return M
