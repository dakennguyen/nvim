local onenord = require('onenord.colors')

require('onenord').setup({
  borders = false,
  italics = {
    comments = false,
    strings = false,
    keywords = false,
    functions = false,
    variables = false,
  },
  custom_highlights = {
    Folded = { fg = onenord.light_gray, style = onenord.none },
    Identifier = { fg = onenord.blue, style = 'italic' },
    QuickFixLine = { style = 'italic' },
  },
})

return {
  lualine = {
    default_fg = onenord.cyan,
    default_bg = onenord.bg,
    light = "#BBC2CF",
    visual = onenord.orange,
    insert = onenord.dark_blue,
    replace = onenord.dark_red,
    command = onenord.light_purple,
    op = onenord.green,
    yellow = onenord.yellow,
    inactive = onenord.light_gray,
    dark = "#FFFFFF"
  },
  tabline = {
    default_bg = onenord.active,
    active_fg = onenord.cyan,
    inactive_fg = onenord.light_gray,
    separator = onenord.light_gray,
  },
}
