vim.opt.background = 'dark'
vim.g.nord_italic = true
require('nord').set()

highlight('Folded', { fg='#4C566A', bg='NONE', style='italic' })
highlight('Search', { fg='white', bg='NONE', style='underline,bold' })

highlight('DiffAdd', { fg='NONE', bg='#324125', style='NONE' })
highlight('DiffChange', { fg='NONE', bg='#334963', style='NONE' })
highlight('DiffDelete', { fg='NONE', bg='#BF616A', style='NONE' })
highlight('DiffText', { fg='NONE', bg='#446285', style='NONE' })

highlight('DiagnosticWarn', { fg='#EBCB8B' })
highlight('DiagnosticVirtualTextWarn', { fg='#EBCB8B' })
highlight('DiagnosticSignWarn', { fg='#EBCB8B' })
highlight('DiagnosticFloatingWarn', { fg='#EBCB8B' })

return {
  lualine = {
    default_fg = "#87C0D0",
    default_bg = "#2E3440",
    light = "#BBC2CF",
    visual = "#D08770",
    insert = "#5E81AC",
    replace = "#BF616A",
    command = "#B48EAD",
    op = "#A3BE8C",
    yellow = "#EBCB8B",
    inactive = "#81879C",
    dark = "#FFFFFF"
  }
}
