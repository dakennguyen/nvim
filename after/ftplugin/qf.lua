buf_map('n', '<leader>q', ':q<CR>', { silent = true })
buf_map('n', 'p', ':lua require("bqf.qfwin.handler").open(false)<cr><c-w>p', { silent = true })