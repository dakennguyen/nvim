return {
  "tpope/vim-fugitive",
  lazy = false,
  config = function()
    -- local job = require("plenary.job")
    -- _G.open_in_browser = function(url)
    --   local command = vim.loop.os_uname().sysname == "Darwin" and "open"
    --     or "xdg-open"
    --   job:new({ command = command, args = { url } }):start()
    -- end

    -- vim.cmd[[ command! -nargs=? Browse lua _G.open_in_browser(<q-args>) ]]

    vim.opt.diffopt:append { "vertical" }
    map("n", "gs", ":G<CR>", { silent = true }) -- Git status
    map("n", "gb", ":Git blame<CR>", { silent = true }) -- Git blame
    map("v", "gb", ":Git blame<CR>", { silent = true }) -- Git blame
    map("n", "go", ":Git branch | set filetype=gitbranch<CR>", { silent = true }) -- Git blame
    map("n", "<leader>gr", ":Git branch --remote | set filetype=gitbranch<CR>", { silent = true }) -- Git blame
    map("n", "<leader>gc", ":Gclog! -n 50<cr>", { silent = true }) -- Git log
    map("n", "<leader>gd", ":Gdiffsplit<CR>") -- Git diff
    map("n", "<leader>gz", ":Gclog! -g stash<CR>", { silent = true }) -- Git stash
    map("n", "<leader>gt", ":0Gclog<CR>", { silent = true }) -- Git time machine
    map("v", "<leader>gt", ":Gclog<CR>", { silent = true }) -- Git time machine
    map("n", "<leader>gx", ":GBrowse<CR>", { silent = true }) -- Git Browse
    map("v", "<leader>gx", ":GBrowse<CR>", { silent = true }) -- Git Browse in Visual mode

    -- vimdiff
    map("n", "<leader>gh", ":diffget //2 | diffupdate<cr>")
    map("n", "<leader>gl", ":diffget //3 | diffupdate<cr>")
    map("", "<leader>gj", ":diffput | diffupdate<cr>")
    map("", "<leader>go", ":diffget | diffupdate<cr>")

    -- luacheck:ignore 631
    -- vim.cmd[[autocmd User Fugitive command! -buffer -nargs=? -complete=customlist,fugitive#CompleteObject Gu Git branch -u <args>]]
  end,
}
