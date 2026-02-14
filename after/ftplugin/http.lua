vim.opt_local.commentstring = "#%s"

local opts = { buffer = true }
vim.keymap.set("n", "`<cr>", require("kulala").run, opts)
vim.keymap.set("n", "<leader>ry", require("kulala").copy, opts)
vim.keymap.set("n", "<leader>rp", require("kulala").from_curl, opts)
