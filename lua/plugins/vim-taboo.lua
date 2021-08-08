vim.opt.sessionoptions:append { 'tabpages', 'globals' }
vim.g.taboo_tab_format = ' %N-%f%m '
vim.g.taboo_renamed_tab_format = ' %N-[%l]%m '
map('n', '<leader>rn', ':TabooRename ')
