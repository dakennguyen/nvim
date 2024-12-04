vim.opt_local.commentstring = "#%s"

vim.b["dispatch"] = ":lua require('rest-nvim').run()"
buf_map("n", "<leader>ry", [[:lua require('rest-nvim').run(true)<cr>]], { silent = true })

map("n", "<space>rl", [[:lua require('rest-nvim').last()<cr>]], { silent = true })
