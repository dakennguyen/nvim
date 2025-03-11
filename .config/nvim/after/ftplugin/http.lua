vim.opt_local.commentstring = "#%s"

vim.b["dispatch"] = ":lua require('kulala').run()"

buf_map("n", "<cr>", [[:lua require('kulala').run()<cr>]], { silent = true })
buf_map("n", "<leader>ry", [[:lua require('kulala').copy()<cr>]], { silent = true })
buf_map("n", "<leader>rp", [[:lua require('kulala').from_curl()<cr>]], { silent = true })
