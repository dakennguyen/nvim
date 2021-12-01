vim.opt.background = 'dark'
vim.g.nord_italic = true
require('nord').set()

vim.cmd[[
  highlight Folded guifg=#4C566A guibg=NONE gui=italic
  highlight Search guifg=white guibg=NONE gui=underline,bold

  highlight DiagnosticWarn guifg=#EBCB8B
  highlight DiagnosticVirtualTextWarn guifg=#EBCB8B
  highlight DiagnosticSignWarn guifg=#EBCB8B
  highlight DiagnosticFloatingWarn guifg=#EBCB8B
]]
