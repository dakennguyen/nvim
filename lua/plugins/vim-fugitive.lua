local job = require("plenary.job")
_G.open_in_browser = function(url)
  local command = vim.loop.os_uname().sysname == "Darwin" and "open"
    or "xdg-open"
  job:new({ command = command, args = { url } }):start()
end

vim.cmd[[ command! -nargs=? Browse lua _G.open_in_browser(<q-args>) ]]

vim.opt.diffopt:append { 'vertical' }
map('n', 'gs', ':tab G | tabmove -1<CR>',                                               { silent = true }) -- Git status
map('n', 'gb', ':Git blame<CR>',                                                        { silent = true }) -- Git blame
map('n', '<leader>gl', ':Gclog! -n 100 origin/HEAD..HEAD<cr>',                          { silent = true }) -- Git log
map('n', '<leader>gg', ':tab Git log --oneline --graph --decorate --abbrev-commit<CR>', { silent = true }) -- Git log
map('n', '<leader>gd', ':Gdiffsplit<CR>')                                                                  -- Git diff
map('n', '<leader>gs', ':Gclog! -g stash<CR>',                                          { silent = true }) -- Git stash
map('n', '<leader>gt', ':0Gclog!<CR>',                                                  { silent = true }) -- Git time machine
map('n', '<leader>gx', ':GBrowse<CR>',                                                  { silent = true }) -- Git Browse
map('v', '<leader>gx', ':GBrowse<CR>',                                                  { silent = true }) -- Git Browse in Visual mode

-- vimdiff
map('n', '<leader>gf', ':diffget //2<cr>')
map('n', '<leader>gj', ':diffget //3<cr>')
map('', '<leader>gh', ':diffput<cr>')
map('', '<leader>go', ':diffget<cr>')

-- vim.cmd[[autocmd User Fugitive command! -buffer -nargs=? -complete=customlist,fugitive#CompleteObject Gu Git branch -u <args>]]
