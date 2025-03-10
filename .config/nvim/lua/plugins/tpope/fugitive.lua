return {
  "tpope/vim-fugitive",
  lazy = false,
  keys = {
    { "gs", ":G<CR>", silent = true, desc = "Git status" },
    { "g0", ":Gedit<CR>" },
    { mode = { "n", "v" }, "<leader>gb", ":Git blame<CR>", silent = true, desc = "Git blame" },
    { "go", ":Git branch | set filetype=gitbranch<CR>", silent = true, desc = "Git branch" },
    { "<leader>gr", ":Git branch --remote | set filetype=gitbranch<CR>", silent = true, desc = "Git branch remote" },
    {
      mode = "n",
      "<leader>gc",
      ":botright 0Gclog! --date=short --format='%H %ad - %s (%an)' | copen<CR>",
      silent = true,
      desc = "Git log current file",
    },
    {
      mode = "v",
      "<leader>gc",
      ":Gclog! --date=short --format='%H %ad - %s (%an)' | copen | wincmd J<CR>",
      silent = true,
      desc = "Git log range",
    },
    { "<leader>gd", ":Gdiffsplit", desc = "Git diff" },
    { "<leader>gz", ":botright Gclog! -g stash | copen<CR>", silent = true, desc = "Git stash" },
    { mode = { "n", "v" }, "<leader>gx", ":GBrowse<CR>", silent = true, desc = "Git Browse" },
    { "<space>gg", [[<cmd>Git log -n 5000 --oneline --date=short --pretty=format:"%h %ad -%d %s (%an)"<cr>]] },

    -- vimdiff
    { mode = "", "<leader>dp", ":diffput<cr>" },
    { mode = "", "<leader>do", ":diffget<cr>" },
  },
}
