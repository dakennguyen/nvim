vim.opt_local.commentstring = "#%s"

vim.b["dispatch"] = ":lua require('kulala').run()"

buf_map("n", "<leader>ry", [[<cmd>lua require('kulala').copy()<cr>]])
buf_map("n", "<leader>rp", [[<cmd>lua require('kulala').from_curl()<cr>]])
