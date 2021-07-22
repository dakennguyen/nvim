vim.opt.background = 'dark'
vim.cmd([[colorscheme nord]])

vim.cmd [[autocmd ColorScheme * hi Folded guifg=#4C566A guibg=NONE gui=italic]]
vim.cmd [[autocmd ColorScheme * hi IncSearch guifg=white guibg=NONE]]
vim.cmd [[autocmd ColorScheme * hi Search guifg=white guibg=NONE gui=underline,bold]]
