vim.cmd [[silent! unmap <buffer> *]]
vim.opt_local.foldmethod = "syntax"

vim.keymap.set("n", "<c-s>", "o", { buffer = true, remap = true, nowait = true })
vim.keymap.set("n", "<c-v>", "gO", { buffer = true, remap = true, nowait = true })
vim.keymap.set("n", "<c-t>", "O", { buffer = true, remap = true, nowait = true })

local opts = { buffer = true }
vim.keymap.set("n", "<leader>fo", "f/lvt<space>gf", opts)
vim.keymap.set("n", "<leader>fs", "f/lvt<space><c-w>f", opts)
vim.keymap.set("n", "<leader>fv", function() require("utils").vsplit "f/lvt<space>gf" end, opts)
vim.keymap.set("n", "<leader>ft", "f/lvt<space><c-w>gf", opts)

vim.keymap.set("n", "cl", ":Git pull", opts)
vim.keymap.set("n", "cp", ":Git push", opts)
vim.keymap.set("n", "ch", ":Git fetch", opts)
vim.keymap.set("n", "cH", ":Git remote update origin --prune", opts)
vim.keymap.set("n", "cd", ":vert Git diff", opts)

vim.keymap.set("n", "]m", "/^diff --git<cr>zV<cmd>noh<cr>", { buffer = true, remap = true, silent = true })
vim.keymap.set("n", "[m", "?^diff --git<cr>zV<cmd>noh<cr>", { buffer = true, remap = true, silent = true })
