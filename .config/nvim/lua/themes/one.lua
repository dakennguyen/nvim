local M = {}

M.specs = {
  "Th3Whit3Wolf/one-nvim",
  config = function()
    vim.cmd "colorscheme one-nvim"
  end,
}

function M.colors()
  return {
    lualine = {
      default_fg = "#5E81AC",
      default_bg = "#fafafa",
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
