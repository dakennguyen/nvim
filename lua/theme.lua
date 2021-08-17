vim.opt.background = 'dark'
vim.g.nord_italic = true
require('nord').set()

vim.cmd[[
augroup Theme
  autocmd ColorScheme * hi Folded guifg=#4C566A guibg=NONE gui=italic
  autocmd ColorScheme * hi IncSearch guifg=white guibg=NONE
  autocmd ColorScheme * hi Search guifg=white guibg=NONE gui=underline,bold
augroup END
]]
