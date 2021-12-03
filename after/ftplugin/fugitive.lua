buf_map('n', '<leader>q', 'gq', { noremap = false })

buf_map('n', '<c-s>', 'o',  { noremap = false, nowait = true })
buf_map('n', '<c-v>', 'gO', { noremap = false, nowait = true })
buf_map('n', '<c-t>', 'O',  { noremap = false, nowait = true })

buf_map('n', 'cl<space>', ':Git pull<space>')
buf_map('n', 'cp<space>', ':Git push<space>')
buf_map('n', 'ch<space>', ':Git fetch<space>')
buf_map('n', 'cH<space>', ':Git remote update origin --prune<space>')
buf_map('n', 'cd<space>', ':vert Git diff<space>')

buf_map('n', '[ou', [[:Git branch -u origin/<c-r>=system('git branch --show-current')<CR><BS><CR>]])
buf_map('n', ']ou', [[:Git branch -u origin/HEAD<CR>]])

buf_map('n', 'go', ':Merginal<CR>', { nowait = true })
buf_map('n', '<leader>gz', ':Gclog! -g stash<CR>:close<cr><c-w><c-p>', { silent = true })
buf_map('n', '<leader>gc', ':Gclog! -n 50<CR>:close<cr><c-w><c-p>',    { silent = true })
buf_map('n', '<leader>gd', ':vert Git diff origin/HEAD..HEAD<CR>',     { silent = true })
