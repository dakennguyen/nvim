vim.cmd([[
  function! BufferStrategy(cmd)
    execute 'R !' . a:cmd
  endfunction
]])

vim.g['test#custom_strategies'] = { buffer = vim.fn['BufferStrategy'] }
vim.g['test#strategy'] = "basic"
-- vim.g["test#neovim#term_position"] = 'botright 10'

vim.g['test#ruby#bundle_exec'] = 1
vim.g['test#ruby#use_binstubs'] = 0
vim.g['test#javascript#runner'] = 'jest'
vim.g['test#javascript#jest#executable'] = 'yarn test'

vim.g['test#java#gradletest#options'] = '--info'

map('n', 't<C-n>', ':TestNearest<CR>', { noremap = false, silent = true })
map('n', 't<C-f>', ':TestFile<CR>',    { noremap = false, silent = true })
map('n', 't<C-s>', ':TestSuite<CR>',   { noremap = false, silent = true })
map('n', 't<C-l>', ':TestLast<CR>',    { noremap = false, silent = true })
map('n', 't<C-g>', ':TestVisit<CR>',   { noremap = false, silent = true })
