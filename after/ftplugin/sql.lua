vim.b["start"] = ":DB"
vim.b["dispatch"] = ":%DB"

vim.opt_local.commentstring = "-- %s"

buf_map("n", "<c-c><c-c>", "vip | :DB<CR>", { silent = true })
buf_map("n", "<c-c><c-l>", "V | :DB<CR>", { silent = true })
