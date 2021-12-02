vim.opt.background = 'dark'
vim.g.nord_italic = true
require('nord').set()

vim.cmd[[
  highlight Folded guifg=#4C566A guibg=NONE gui=italic
  highlight Search guifg=white guibg=NONE gui=underline,bold

  highlight DiffAdd guifg=NONE guibg=#324125 gui=NONE
  highlight DiffChange guifg=NONE guibg=#334963 gui=NONE
  highlight DiffDelete guifg=NONE guibg=#BF616A gui=NONE
  highlight DiffText guifg=NONE guibg=#446285 gui=NONE

  highlight DiagnosticWarn guifg=#EBCB8B
  highlight DiagnosticVirtualTextWarn guifg=#EBCB8B
  highlight DiagnosticSignWarn guifg=#EBCB8B
  highlight DiagnosticFloatingWarn guifg=#EBCB8B
]]
