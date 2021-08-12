vim.opt.background = 'dark'
vim.g.nord_italic = false
require('nord').set()

vim.cmd[[
augroup Theme
  autocmd ColorScheme * hi Folded guifg=#4C566A guibg=NONE gui=italic
  autocmd ColorScheme * hi IncSearch guifg=white guibg=NONE
  autocmd ColorScheme * hi Search guifg=white guibg=NONE gui=underline,bold

  autocmd ColorScheme * hi ALEWarning guifg=#EBCB8B
  autocmd ColorScheme * hi ALEError guifg=#BF616A
  autocmd ColorScheme * hi ALEWarningSign guifg=#EBCB8B
  autocmd ColorScheme * hi ALEErrorSign guifg=#BF616A

  " autocmd ColorScheme * hi CocWarningHighlight guifg=#EBCB8B
  " autocmd ColorScheme * hi CocErrorHighlight guifg=#BF616A
  " autocmd ColorScheme * hi CocWarningSign guifg=#EBCB8B
  " autocmd ColorScheme * hi CocErrorSign guifg=#BF616A
  " autocmd ColorScheme * hi CocInfoSign guifg=#88C0D0
  " autocmd ColorScheme * hi CocHintSign guifg=#5E81AC
augroup END
]]
