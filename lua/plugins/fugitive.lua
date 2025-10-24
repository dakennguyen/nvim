vim.pack.add { "https://github.com/tpope/vim-fugitive" }

map("n", "gs", ":G<CR>", { silent = true, desc = "Git status" })
map("n", "g0", "<cmd>Gedit<CR>")
map("n", "<leader>gb", "<cmd>Git blame<CR>", { desc = "Git blame" })
map("v", "<leader>gb", ":Git blame<CR>", { silent = true, desc = "Git blame" })
map("n", "go", "<cmd>Git branch | set filetype=gitbranch<CR>", { desc = "Git branch" })
map("n", "<leader>gr", "<cmd>Git branch --remote | set filetype=gitbranch<CR>", { desc = "Git branch remote" })
map(
  "n",
  "<leader>gc",
  "<cmd>botright 0Gclog! --date=short --format='%H %ad - %s (%an)' | copen<CR>",
  { desc = "Git log current file" }
)
map(
  "v",
  "<leader>gc",
  ":Gclog! --date=short --format='%H %ad - %s (%an)' | copen | wincmd J<CR>",
  { silent = true, desc = "Git log range" }
)
map("n", "<leader>gd", ":Gdiffsplit", { desc = "Git diff" })
map("n", "<leader>gz", "<cmd>botright Gclog! -g stash | copen<CR>", { desc = "Git stash" })
map("n", "<leader>gx", "<cmd>GBrowse<CR>", { desc = "Git Browse" })
map("v", "<leader>gx", ":GBrowse<CR>", { silent = true, desc = "Git Browse" })
map("n", "<space>gg", [[<cmd>tab Git log -n 5000 --oneline --date=short --pretty=format:"%h %ad -%d %s (%an)"<cr>]])

-- vimdiff
map("", "<leader>dp", ":diffput<cr>")
map("", "<leader>do", ":diffget<cr>")
