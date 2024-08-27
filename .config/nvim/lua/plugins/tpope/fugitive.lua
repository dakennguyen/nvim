return {
  "tpope/vim-fugitive",
  lazy = false,
  keys = {
    { "gs", ":G<CR>", silent = true, desc = "Git status" },
    { mode = { "n", "v" }, "gb", ":Git blame<CR>", silent = true, desc = "Git blame" },
    { "go", ":Git branch | set filetype=gitbranch<CR>", silent = true, desc = "Git branch" },
    { "<leader>gr", ":Git branch --remote | set filetype=gitbranch<CR>", silent = true, desc = "Git branch remote" },
    { "<leader>gc", ":Gclog -n 50<cr>", silent = true, desc = "Git log" },
    { "<leader>gd", ":Gdiffsplit<CR>", desc = "Git diff" },
    { "<leader>gz", ":Gclog -g stash<CR>", silent = true, desc = "Git stash" },
    { "<leader>gt", ":0Gclog<CR>", silent = true, desc = "Git time machine" },
    { mode = "v", "<leader>gt", ":Gclog<CR>", silent = true, desc = "Git time machine" },
    { mode = { "n", "v" }, "<leader>gx", ":GBrowse<CR>", silent = true, desc = "Git Browse" },
    { "<leader>gv", [[:Git log -p -- <C-R>=expand("%")<cr><cr>]] },
    { "<space>gg", [[<cmd>Git log -n 5000 --oneline --date=short --pretty=format:"%h%d %s (%an)"<cr>]] },

    -- vimdiff
    { "<leader>gh", ":diffget //2 | diffupdate<cr>" },
    { "<leader>gl", ":diffget //3 | diffupdate<cr>" },
    { mode = "", "<leader>gj", ":diffput | diffupdate<cr>" },
    { mode = "", "<leader>go", ":diffget | diffupdate<cr>" },
  },
  config = function()
    vim.api.nvim_create_user_command(
      "Browse",
      function (opts)
        vim.fn.system { "open", opts.fargs[1] }
      end,
      { nargs = 1 }
    )

    vim.opt.diffopt:append { "vertical" }

    -- luacheck:ignore 631
    -- vim.cmd[[autocmd User Fugitive command! -buffer -nargs=? -complete=customlist,fugitive#CompleteObject Gu Git branch -u <args>]]
  end,
}
