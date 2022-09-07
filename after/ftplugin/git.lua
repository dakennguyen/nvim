vim.opt_local.foldmethod = 'syntax'

buf_map('n', '<c-s>', 'o',  { noremap = false, nowait = true })
buf_map('n', '<c-v>', 'gO', { noremap = false, nowait = true })
buf_map('n', '<c-t>', 'O',  { noremap = false, nowait = true })

buf_map('n', '<leader>fo', 'f/lvt<space>gff', { noremap = false })
buf_map('n', '<leader>fs', 'f/lvt<space>gfs', { noremap = false })
buf_map('n', '<leader>fv', 'f/lvt<space>gfv', { noremap = false })
buf_map('n', '<leader>ft', 'f/lvt<space>gft', { noremap = false })

buf_map('n', 'cl<space>', ':Git pull<space>')
buf_map('n', 'cp<space>', ':Git push<space>')
buf_map('n', 'ch<space>', ':Git fetch<space>')
buf_map('n', 'cH<space>', ':Git remote update origin --prune')
buf_map('n', 'cd<space>', ':vert Git diff<space>')

buf_map('n', ']f', '/^diff --git<cr>zV', { noremap = false, silent = true })
buf_map('n', '[f', '?^diff --git<cr>zV', { noremap = false, silent = true })
