vim.opt_local.wrap = true

vim.keymap.set("n", "<c-v>", "<c-w><cr><c-w>H", { buffer = true, silent = true })
vim.keymap.set("n", "<c-s>", "<c-w><cr>", { buffer = true, silent = true })
vim.keymap.set("n", "<c-t>", "<c-w><cr><c-w>T", { buffer = true, silent = true })
