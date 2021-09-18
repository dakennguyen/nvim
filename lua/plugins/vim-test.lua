vim.g["test#strategy"] = "neovim"
vim.g["test#neovim#term_position"] = 'botright 10'

vim.g['test#ruby#bundle_exec'] = 1
vim.g['test#ruby#use_binstubs'] = 0
vim.g['test#javascript#runner'] = 'jest'
vim.g['test#javascript#jest#executable'] = 'yarn test'

map('n', 't<C-n>', ':TestNearest<CR><C-\\><C-n>G', { noremap = false, silent = true })
map('n', 't<C-f>', ':TestFile<CR><C-\\><C-n>G',    { noremap = false, silent = true })
map('n', 't<C-s>', ':TestSuite<CR><C-\\><C-n>G',   { noremap = false, silent = true })
map('n', 't<C-l>', ':TestLast<CR><C-\\><C-n>G',    { noremap = false, silent = true })
map('n', 't<C-g>', ':TestVisit<CR><C-\\><C-n>G',   { noremap = false, silent = true })
