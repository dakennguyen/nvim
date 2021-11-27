vim.opt.background = 'dark'
vim.g.nord_italic = true
require('nord').set()

vim.cmd[[
  highlight Folded guifg=#4C566A guibg=NONE gui=italic
  highlight Search guifg=white guibg=NONE gui=underline,bold

  highlight LspDiagnosticsDefaultWarning guifg=#EBCB8B
  highlight LspDiagnosticsVirtualTextWarning guifg=#EBCB8B
  highlight LspDiagnosticsSignWarning guifg=#EBCB8B
  highlight LspDiagnosticsFloatingWarning guifg=#EBCB8B
]]
