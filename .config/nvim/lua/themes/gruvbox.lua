local M = {}

M.specs = {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local gruvbox = require("gruvbox")

    gruvbox.setup({
      overrides = {
        SignColumn = {bg = gruvbox.palette.light0}
      }
    })

    vim.cmd "colorscheme gruvbox"
  end,
}

function M.colors()
  local colors = require("gruvbox").palette
  local custom_colors = {}
  if vim.o.background == "light" then
    custom_colors = {
      default_fg = colors.faded_yellow,
      default_bg = colors.light0,
    }
  else
    custom_colors = {
      default_fg = colors.faded_yellow,
      default_bg = colors.dark0,
    }
  end

  return {
    lualine = {
      default_fg = custom_colors.default_fg,
      default_bg = custom_colors.default_bg,
      light = colors.dark0,
      visual = colors.faded_orange,
      insert = colors.faded_blue,
      replace = colors.faded_red,
      command = colors.faded_purple,
      op = colors.faded_green,
      yellow = colors.faded_yellow,
      inactive = colors.gray,
      dark = colors.dark4,
    },
  }
end

return M
