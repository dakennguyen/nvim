vim.pack.add {
  { src = "https://tpope.io/vim/dadbod" },
  { src = "https://github.com/kristijanhusak/vim-dadbod-completion" },
}

vim.g["redis"] = "redis:localhost:6379"
vim.keymap.set("", "<space>dd", ":DB") -- let g:db = ...
vim.keymap.set("", "<space>dr", ":DB g:redis")
vim.keymap.set("", "<space>dt", ":DB g:dbtest")
