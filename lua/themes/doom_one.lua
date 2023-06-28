vim.cmd "colorscheme doom-one"
highlight("Identifier", { fg = "#FFA8FF", style = "italic" })

return {
  lualine = {
    default_fg = "#51afef",
    default_bg = "#282C34",
    light = "#BBC2CF",
    visual = "#da8548",
    insert = "#2257A0",
    replace = "#ff6c6b",
    command = "#c678dd",
    op = "#98be65",
    yellow = "#ECBE7B",
    inactive = "#4e4f67",
    dark = "#efefef",
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
