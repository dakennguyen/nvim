vim.opt_local.commentstring = "#%s"

local opts = { buffer = true }
vim.keymap.set("n", "`<cr>", [[<cmd>lua require('kulala').run()<cr>]], opts)
vim.keymap.set("n", "<leader>ry", [[<cmd>lua require('kulala').copy()<cr>]], opts)
vim.keymap.set("n", "<leader>rp", [[<cmd>lua require('kulala').from_curl()<cr>]], opts)
