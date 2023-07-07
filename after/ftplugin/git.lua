vim.opt_local.foldmethod = "syntax"

buf_map("n", "<c-s>", "o", { remap = true, nowait = true })
buf_map("n", "<c-v>", "gO", { remap = true, nowait = true })
buf_map("n", "<c-t>", "O", { remap = true, nowait = true })

buf_map("n", "<leader>fo", "f/lvt<space>gf")
buf_map("n", "<leader>fs", "f/lvt<space><c-w>f")
buf_map("n", "<leader>fv", '<cmd>lua require("utils").vsplit("f/lvt<space>gf")<cr>')
buf_map("n", "<leader>ft", "f/lvt<space><c-w>gf")

buf_map("n", "cl", ":Git pull")
buf_map("n", "cp", ":Git push")
buf_map("n", "ch", ":Git fetch")
buf_map("n", "cH", ":Git remote update origin --prune")
buf_map("n", "cd<space>", ":vert Git diff<space>")

buf_map("n", "]f", "/^diff --git<cr>zV", { remap = true, silent = true })
buf_map("n", "[f", "?^diff --git<cr>zV", { remap = true, silent = true })
