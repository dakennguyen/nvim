vim.cmd "colorscheme github-light"
_G.highlight("Identifier", { style = "italic" })

return {
  lualine = {
    default_fg = "#5E81AC",
    default_bg = "#ffffff",
    light = "#494b53",
    visual = "#E45649",
    insert = "#61afef",
    replace = "#e06c75",
    command = "#c678dd",
    op = "#98c379",
    yellow = "#d19a66",
    inactive = "#81879C",
    dark = "#000000",
  },
}
