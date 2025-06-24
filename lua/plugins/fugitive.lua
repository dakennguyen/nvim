return {
  "tpope/vim-fugitive",
  lazy = false,
  keys = {
    { "gs", ":tab G<CR>", silent = true, desc = "Git status" },
    { "g0", "<cmd>Gedit<CR>" },
    { "<leader>gb", "<cmd>Git blame<CR>", desc = "Git blame" },
    { mode = "v", "<leader>gb", ":Git blame<CR>", silent = true, desc = "Git blame" },
    { "go", "<cmd>Git branch | set filetype=gitbranch<CR>", desc = "Git branch" },
    { "<leader>gr", "<cmd>Git branch --remote | set filetype=gitbranch<CR>", desc = "Git branch remote" },
    {
      "<leader>gc",
      "<cmd>botright 0Gclog! --date=short --format='%H %ad - %s (%an)' | copen<CR>",
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
    { "<leader>gz", "<cmd>botright Gclog! -g stash | copen<CR>", desc = "Git stash" },
    { "<leader>gx", "<cmd>GBrowse<CR>", desc = "Git Browse" },
    { mode = "v", "<leader>gx", ":GBrowse<CR>", silent = true, desc = "Git Browse" },
    { "<space>gg", [[<cmd>tab Git log -n 5000 --oneline --date=short --pretty=format:"%h %ad -%d %s (%an)"<cr>]] },

    -- vimdiff
    { mode = "", "<leader>dp", ":diffput<cr>" },
    { mode = "", "<leader>do", ":diffget<cr>" },
  },
}
