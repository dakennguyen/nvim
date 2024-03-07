return {
  "tpope/vim-fugitive",
  lazy = false,
  config = function()
    vim.api.nvim_create_user_command(
      "Browse",
      function (opts)
        vim.fn.system { "open", opts.fargs[1] }
      end,
      { nargs = 1 }
    )

    vim.opt.diffopt:append { "vertical" }
    map("n", "gs", ":G<CR>", { silent = true }) -- Git status
    map("n", "gb", ":Git blame<CR>", { silent = true }) -- Git blame
    map("v", "gb", ":Git blame<CR>", { silent = true }) -- Git blame
    map("n", "go", ":Git branch | set filetype=gitbranch<CR>", { silent = true }) -- Git blame
    map("n", "<leader>gr", ":Git branch --remote | set filetype=gitbranch<CR>", { silent = true }) -- Git blame
    map("n", "<leader>gc", ":Gclog -n 50<cr>", { silent = true }) -- Git log
    map("n", "<leader>gd", ":Gdiffsplit<CR>") -- Git diff
    map("n", "<leader>gz", ":Gclog -g stash<CR>", { silent = true }) -- Git stash
    map("n", "<leader>gt", ":0Gclog<CR>", { silent = true }) -- Git time machine
    map("v", "<leader>gt", ":Gclog<CR>", { silent = true }) -- Git time machine
    map("n", "<leader>gx", ":GBrowse<CR>", { silent = true }) -- Git Browse
    map("v", "<leader>gx", ":GBrowse<CR>", { silent = true }) -- Git Browse in Visual mode
    map("n", "<leader>gv", [[:Git log -p -- <C-R>=expand("%")<cr><cr>]])
    map("n", "<space>gg", [[<cmd>Git log -n 5000 --oneline --date=short --pretty=format:"%h%d %s (%an)"<cr>]])

    -- vimdiff
    map("n", "<leader>gh", ":diffget //2 | diffupdate<cr>")
    map("n", "<leader>gl", ":diffget //3 | diffupdate<cr>")
    map("", "<leader>gj", ":diffput | diffupdate<cr>")
    map("", "<leader>go", ":diffget | diffupdate<cr>")

    -- luacheck:ignore 631
    -- vim.cmd[[autocmd User Fugitive command! -buffer -nargs=? -complete=customlist,fugitive#CompleteObject Gu Git branch -u <args>]]
  end,
}
