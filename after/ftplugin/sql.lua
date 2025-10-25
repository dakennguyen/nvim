vim.b["start"] = ":DB"
vim.b["dispatch"] = ":%DB"

vim.opt_local.commentstring = "-- %s"

vim.keymap.set("n", "<c-c><c-c>", "vip | :DB<CR>", { buffer = true, silent = true })
vim.keymap.set("n", "<c-c><c-l>", "V | :DB<CR>", { buffer = true, silent = true })
