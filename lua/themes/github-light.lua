local M = {}

M.specs = {
  "romgrk/github-light.vim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd "colorscheme github-light"
    vim.api.nvim_set_hl(0, "Identifier", { italic = true })
  end,
}

function M.colors()
  return {
    lualine = {
      default_fg = "#5E81AC",
      default_bg = "#E0E2EA",
      light = "#494b53",
      visual = "#E45649",
      insert = "#61afef",
      replace = "#e06c75",
      command = "#c678dd",
      op = "#98c379",
      yellow = "#d19a66",
      inactive = "#81879C",
      strong = "#000000",
    },
  }
end

return M
