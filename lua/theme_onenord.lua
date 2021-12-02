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
    Folded = { fg = '#4C566A', style = 'italic' },
    Identifier = { fg = onenord.blue, style = 'italic' },
    QuickFixLine = { style = 'italic' },
  },
})
