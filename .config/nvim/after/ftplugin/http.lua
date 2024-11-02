vim.opt_local.commentstring = "#%s"

vim.b["dispatch"] = ":Rest run"
buf_map("n", "<leader>ry", ":Rest curl yank<cr>")

map("n", "<space>rl", ":Rest last<cr>", { silent = true })
