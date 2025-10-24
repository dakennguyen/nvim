vim.pack.add { "https://github.com/tpope/vim-dispatch" }

vim.g["dispatch_no_tmux_start"] = true
vim.g["dispatch_compilers"] = {
  ["python -m pytest"] = "pytest",
  ["poetry run"] = "",
  ["bundle exec spring"] = "",
  ["bundle exec"] = "",
}

map("n", "<leader>C", "<cmd>Copen<cr>")
map("n", "<space>C", "<cmd>Copen!<cr>")
map("v", "`<space>", ":Dispatch<space>")
map("v", "`<cr>", ":Dispatch<cr>")
map("n", "t<c-n>", "mT<cmd>.Dispatch<cr>")
map("n", "t<c-l>", "<cmd>Copen|Dispatch<cr>")
map("n", "t<c-g>", "'T")
