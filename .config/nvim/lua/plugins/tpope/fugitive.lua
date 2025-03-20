return {
  "tpope/vim-fugitive",
  lazy = false,
  keys = {
    { "gs", "<cmd>G<CR>", desc = "Git status" },
    { "g0", "<cmd>Gedit<CR>" },
    { mode = { "n", "v" }, "<leader>gb", "<cmd>Git blame<CR>", desc = "Git blame" },
    { "go", "<cmd>Git branch | set filetype=gitbranch<CR>", desc = "Git branch" },
    { "<leader>gr", "<cmd>Git branch --remote | set filetype=gitbranch<CR>", desc = "Git branch remote" },
    {
      mode = "n",
      "<leader>gc",
      "<cmd>botright 0Gclog! --date=short --format='%H %ad - %s (%an)' | copen<CR>",
      desc = "Git log current file",
    },
    {
      mode = "v",
      "<leader>gc",
      "<cmd>Gclog! --date=short --format='%H %ad - %s (%an)' | copen | wincmd J<CR>",
      desc = "Git log range",
    },
    { "<leader>gd", ":Gdiffsplit", desc = "Git diff" },
    { "<leader>gz", "<cmd>botright Gclog! -g stash | copen<CR>", desc = "Git stash" },
    { mode = { "n", "v" }, "<leader>gx", "<cmd>GBrowse<CR>", desc = "Git Browse" },
    { "<space>gg", [[<cmd>Git log -n 5000 --oneline --date=short --pretty=format:"%h %ad -%d %s (%an)"<cr>]] },

    -- vimdiff
    { mode = "", "<leader>dp", "<cmd>diffput<cr>" },
    { mode = "", "<leader>do", "<cmd>diffget<cr>" },
  },
}
