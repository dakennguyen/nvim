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
    -- tabline
    TabLineSeparatorActive = { fg = onenord.cyan, bg = onenord.bg },
    TabLineSeparatorInactive = { fg = onenord.light_gray, bg = onenord.active },
    TabLineModifiedSeparatorActive = { fg = onenord.cyan, bg = onenord.bg },
    TabLineModifiedSeparatorInactive = { fg = onenord.light_gray, bg = onenord.bg },
  },
})
