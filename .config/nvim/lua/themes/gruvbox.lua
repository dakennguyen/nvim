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
  local custom_colors
  if vim.o.background == "light" then
    custom_colors = {
      default_fg = colors.faded_yellow,
      default_bg = colors.light0,
      inactive = colors.dark4,
      light = colors.dark4,
      strong = colors.dark1,
    }
  else
    custom_colors = {
      default_fg = colors.faded_yellow,
      default_bg = colors.dark0,
      inactive = colors.light4,
      light = colors.light4,
      strong = colors.light1,
    }
  end

  return {
    lualine = {
      default_fg = custom_colors.default_fg,
      default_bg = custom_colors.default_bg,
      light = custom_colors.light,
      visual = colors.faded_orange,
      insert = colors.faded_blue,
      replace = colors.faded_red,
      command = colors.faded_purple,
      op = colors.faded_green,
      yellow = colors.faded_yellow,
      inactive = custom_colors.inactive,
      strong = custom_colors.strong,
    },
  }
end

return M
