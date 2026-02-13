vim.pack.add { "https://tpope.io/vim/dispatch" }

vim.g["dispatch_no_tmux_start"] = true
vim.g["dispatch_compilers"] = {
  ["python -m pytest"] = "pytest",
  ["poetry run"] = "",
  ["bundle exec spring"] = "",
  ["bundle exec"] = "",
}

vim.keymap.set("n", "<leader>C", "<cmd>Copen<cr>")
vim.keymap.set("n", "<space>C", "<cmd>Copen!<cr>")
vim.keymap.set("v", "`<space>", ":Dispatch<space>")
vim.keymap.set("v", "`<cr>", ":Dispatch<cr>")
vim.keymap.set("n", "t<c-n>", "mT<cmd>.Dispatch<cr>")
vim.keymap.set("n", "t<c-l>", "<cmd>Copen|Dispatch<cr>")
vim.keymap.set("n", "t<c-g>", "'T")
