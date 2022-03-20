vim.opt_local.foldmethod = 'syntax'

buf_map('n', '<c-s>', 'o',  { noremap = false, nowait = true })
buf_map('n', '<c-v>', 'gO', { noremap = false, nowait = true })
buf_map('n', '<c-t>', 'O',  { noremap = false, nowait = true })

buf_map('n', '<leader>fo', 'f/gff', { noremap = false })
buf_map('n', '<leader>fs', 'f/gfs', { noremap = false })
buf_map('n', '<leader>fv', 'f/gfv', { noremap = false })
buf_map('n', '<leader>ft', 'f/gft', { noremap = false })

buf_map('n', 'cl<space>', ':Git pull<space>')
buf_map('n', 'cp<space>', ':Git push<space>')
buf_map('n', 'ch<space>', ':Git fetch<space>')
buf_map('n', 'cH<space>', ':Git remote update origin --prune<space>')
buf_map('n', 'cd<space>', ':vert Git diff<space>')

buf_map('n', ']f', '/^diff --git<cr>zV', { noremap = false, silent = true })
buf_map('n', '[f', '?^diff --git<cr>zV', { noremap = false, silent = true })
