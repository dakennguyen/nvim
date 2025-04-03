vim.opt_local.commentstring = "#%s"

buf_map("n", "`<cr>", [[<cmd>lua require('kulala').run()<cr>]])
buf_map("n", "<leader>ry", [[<cmd>lua require('kulala').copy()<cr>]])
buf_map("n", "<leader>rp", [[<cmd>lua require('kulala').from_curl()<cr>]])
