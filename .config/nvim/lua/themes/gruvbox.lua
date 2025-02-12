local M = {}

M.specs = {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local gruvbox = require "gruvbox"

    gruvbox.setup {
      overrides = {
        SignColumn = { bg = gruvbox.palette.light0 },
      },
    }

    vim.cmd "colorscheme gruvbox"
  end,
}

function M.colors()
  local utils = require "utils"
  return {
    gitsigns = {
      add_bg = utils.get_hl("DiffAdd").bg,
      change_bg = utils.get_hl("DiffChange").bg,
      delete_bg = utils.get_hl("DiffDelete").bg,
    },
  }
end

return M
