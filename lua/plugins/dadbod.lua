vim.pack.add {
  { src = "https://github.com/tpope/vim-dadbod" },
  { src = "https://github.com/kristijanhusak/vim-dadbod-completion" },
}

vim.g["redis"] = "redis:localhost:6379"
map("", "<space>dd", ":DB") -- let g:db = ...
map("", "<space>dr", ":DB g:redis")
map("", "<space>dt", ":DB g:dbtest")
