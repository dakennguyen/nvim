require'hop'.setup()
map('n', 's', ':HopChar1<CR>', { silent = true })
map('n', '<space><space>', ':HopWord<CR>', { silent = true, noremap = true })
