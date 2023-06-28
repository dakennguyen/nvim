vim.opt_local.commentstring = "#%s"

buf_map("n", "`<cr>", [[:lua require('rest-nvim').run()<cr>]], { silent = true })
buf_map("n", "<leader>rp", [[:lua require('rest-nvim').run(true)<cr>]], { silent = true })

map("n", "<space>rl", [[:lua require('rest-nvim').last()<cr>]], { silent = true })
