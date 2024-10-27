return {
  "tpope/vim-fugitive",
  lazy = false,
  keys = {
    { "gs", ":tab G<CR>", silent = true, desc = "Git status" },
    { mode = { "n", "v" }, "<leader>gb", ":Git blame<CR>", silent = true, desc = "Git blame" },
    { "go", ":Git branch | set filetype=gitbranch<CR>", silent = true, desc = "Git branch" },
    { "<leader>gr", ":Git branch --remote | set filetype=gitbranch<CR>", silent = true, desc = "Git branch remote" },
    { "<leader>gz", ":Gclog -g stash<CR>", silent = true, desc = "Git stash" },
    { "<leader>gt", ":0Gclog<CR>", silent = true, desc = "Git time machine" },
    { mode = { "n", "v" }, "<leader>gx", ":GBrowse<CR>", silent = true, desc = "Git Browse" },
    { "<space>gg", [[<cmd>tab Git log -n 5000 --oneline --date=short --pretty=format:"%h%d %s (%an)"<cr>]] },

    -- vimdiff
    { "<leader>gh", ":diffget //2 | diffupdate<cr>" },
    { "<leader>gl", ":diffget //3 | diffupdate<cr>" },
    { mode = "", "<leader>gj", ":diffput | diffupdate<cr>" },
    { mode = "", "<leader>go", ":diffget | diffupdate<cr>" },
  },
  config = function()
    -- vim.api.nvim_create_user_command("Browse", function(opts)
    --   vim.fn.system { "open", opts.fargs[1] }
    -- end, { nargs = 1 })

    vim.opt.diffopt:append { "vertical" }

    -- luacheck:ignore 631
    -- vim.cmd[[autocmd User Fugitive command! -buffer -nargs=? -complete=customlist,fugitive#CompleteObject Gu Git branch -u <args>]]
  end,
}
