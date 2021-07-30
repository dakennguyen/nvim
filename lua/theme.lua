vim.opt.background = 'dark'
vim.cmd([[colorscheme nord]])

vim.cmd [[autocmd ColorScheme * hi Folded guifg=#4C566A guibg=NONE gui=italic]]
vim.cmd [[autocmd ColorScheme * hi IncSearch guifg=white guibg=NONE]]
vim.cmd [[autocmd ColorScheme * hi Search guifg=white guibg=NONE gui=underline,bold]]

-- ALE
vim.cmd [[autocmd ColorScheme * hi ALEWarning guifg=#EBCB8B]]
vim.cmd [[autocmd ColorScheme * hi ALEError guifg=#BF616A]]
vim.cmd [[autocmd ColorScheme * hi ALEWarningSign guifg=#EBCB8B]]
vim.cmd [[autocmd ColorScheme * hi ALEErrorSign guifg=#BF616A]]

-- Coc
-- vim.cmd [[autocmd ColorScheme * hi CocWarningHighlight guifg=#EBCB8B]]
-- vim.cmd [[autocmd ColorScheme * hi CocErrorHighlight guifg=#BF616A]]
-- vim.cmd [[autocmd ColorScheme * hi CocWarningSign guifg=#EBCB8B]]
-- vim.cmd [[autocmd ColorScheme * hi CocErrorSign guifg=#BF616A]]
-- vim.cmd [[autocmd ColorScheme * hi CocInfoSign guifg=#88C0D0]]
-- vim.cmd [[autocmd ColorScheme * hi CocHintSign guifg=#5E81AC]]
