vim.pack.add { "https://tpope.io/vim/fugitive" }

vim.keymap.set("n", "gs", ":G<CR>", { silent = true, desc = "Git status" })
vim.keymap.set("n", "g0", "<cmd>Gedit<CR>")
vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<CR>", { desc = "Git blame" })
vim.keymap.set("v", "<leader>gb", ":Git blame<CR>", { silent = true, desc = "Git blame" })
vim.keymap.set("n", "go", "<cmd>Git branch | set filetype=gitbranch<CR>", { desc = "Git branch" })
vim.keymap.set(
  "n",
  "<leader>gr",
  "<cmd>Git branch --remote | set filetype=gitbranch<CR>",
  { desc = "Git branch remote" }
)
vim.keymap.set(
  "n",
  "<leader>gc",
  "<cmd>botright 0Gclog! --date=short --format='%H %ad - %s (%an)' | copen<CR>",
  { desc = "Git log current file" }
)
vim.keymap.set(
  "v",
  "<leader>gc",
  ":Gclog! --date=short --format='%H %ad - %s (%an)' | copen | wincmd J<CR>",
  { silent = true, desc = "Git log range" }
)
vim.keymap.set("n", "<leader>gd", ":Gdiffsplit", { desc = "Git diff" })
vim.keymap.set("n", "<leader>gz", "<cmd>botright Gclog! -g stash | copen<CR>", { desc = "Git stash" })
vim.keymap.set("n", "<leader>gx", "<cmd>GBrowse<CR>", { desc = "Git Browse" })
vim.keymap.set("v", "<leader>gx", ":GBrowse<CR>", { silent = true, desc = "Git Browse" })
vim.keymap.set(
  "n",
  "<space>gg",
  [[<cmd>Git log -n 5000 --oneline --date=short --pretty=format:"%h %ad -%d %s (%an)"<cr>]]
)

-- vimdiff
vim.keymap.set("", "<leader>dp", ":diffput<cr>")
vim.keymap.set("", "<leader>do", ":diffget<cr>")
